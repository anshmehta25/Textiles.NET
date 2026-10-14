using System;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;

namespace textiles
{
    public partial class profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            pnlAlert.Visible = false;

            if (!IsPostBack)
            {
                hfActiveTab.Value = "dashboard";
                LoadUserData();
                LoadUserOrders();
            }
        }

        private void LoadUserData()
        {
            string email = Session["UserEmail"].ToString();
            lblProfileEmail.Text = email;
            txtEmail.Text = email;

            try
            {
                string sql = "SELECT TOP 1 name, email, phone, address FROM users WHERE email=@email";
                DataTable dt = DbHelper.ExecuteDataTable(sql, new SqlParameter("@email", email));

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    string fullName = row["name"] != DBNull.Value ? row["name"].ToString() : "User";
                    lblProfileName.Text = fullName;

                    // Split into first and last name
                    string[] parts = fullName.Split(new char[] { ' ' }, 2, StringSplitOptions.RemoveEmptyEntries);
                    txtFirstName.Text = parts.Length > 0 ? parts[0] : "";
                    txtLastName.Text = parts.Length > 1 ? parts[1] : "";

                    txtPhone.Text = row["phone"] != DBNull.Value ? row["phone"].ToString() : "";

                    string address = row["address"] != DBNull.Value ? row["address"].ToString() : "";
                    if (!string.IsNullOrWhiteSpace(address))
                    {
                        txtAddressLine.Text = address;
                        lblDisplayAddress.Text = Server.HtmlEncode(address);
                    }
                    else
                    {
                        lblDisplayAddress.Text = "No default delivery address set yet. Please add your address below.";
                    }
                }
                else if (Session["UserName"] != null)
                {
                    lblProfileName.Text = Session["UserName"].ToString();
                }
            }
            catch (Exception ex)
            {
                if (Session["UserName"] != null)
                {
                    lblProfileName.Text = Session["UserName"].ToString();
                }
                ShowAlert("Failed to load profile: " + ex.Message, false);
            }
        }

        private void LoadUserOrders()
        {
            string email = Session["UserEmail"].ToString();

            try
            {
                string sql = "SELECT id, order_number, created_at, customer_name, total_amount, payment_method, order_status FROM orders WHERE user_email=@email ORDER BY id DESC";
                DataTable dt = DbHelper.ExecuteDataTable(sql, new SqlParameter("@email", email));

                if (dt != null && dt.Rows.Count > 0)
                {
                    int total = dt.Rows.Count;
                    int delivered = 0;
                    int processing = 0;
                    decimal totalSpent = 0;

                    foreach (DataRow row in dt.Rows)
                    {
                        string status = row["order_status"].ToString();
                        if (status.Equals("Delivered", StringComparison.OrdinalIgnoreCase)) delivered++;
                        else if (status.Equals("Processing", StringComparison.OrdinalIgnoreCase)) processing++;

                        if (row["total_amount"] != DBNull.Value)
                        {
                            totalSpent += Convert.ToDecimal(row["total_amount"]);
                        }
                    }

                    lblTotalOrders.Text = total.ToString();
                    lblDeliveredOrders.Text = delivered.ToString();
                    lblProcessingOrders.Text = processing.ToString();
                    lblTotalSpent.Text = "&#8377;" + totalSpent.ToString("N0");

                    // Bind recent orders (top 3)
                    DataTable dtRecent = dt.Clone();
                    int count = Math.Min(3, dt.Rows.Count);
                    for (int i = 0; i < count; i++)
                    {
                        dtRecent.ImportRow(dt.Rows[i]);
                    }

                    rptRecentOrders.DataSource = dtRecent;
                    rptRecentOrders.DataBind();
                    pnlNoRecentOrders.Visible = false;

                    // Bind all orders
                    rptAllOrders.DataSource = dt;
                    rptAllOrders.DataBind();
                    pnlNoAllOrders.Visible = false;
                }
                else
                {
                    lblTotalOrders.Text = "0";
                    lblDeliveredOrders.Text = "0";
                    lblProcessingOrders.Text = "0";
                    lblTotalSpent.Text = "&#8377;0";

                    rptRecentOrders.DataSource = null;
                    rptRecentOrders.DataBind();
                    pnlNoRecentOrders.Visible = true;

                    rptAllOrders.DataSource = null;
                    rptAllOrders.DataBind();
                    pnlNoAllOrders.Visible = true;
                }
            }
            catch
            {
                lblTotalOrders.Text = "0";
                lblDeliveredOrders.Text = "0";
                lblProcessingOrders.Text = "0";
                lblTotalSpent.Text = "&#8377;0";
                pnlNoRecentOrders.Visible = true;
                pnlNoAllOrders.Visible = true;
            }
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "profile";
            if (!Page.IsValid) return;

            string email = Session["UserEmail"].ToString();
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string fullName = (firstName + " " + lastName).Trim();
            string phone = txtPhone.Text.Trim();

            try
            {
                string sql = "UPDATE users SET name=@name, phone=@phone WHERE email=@email";
                DbHelper.ExecuteNonQuery(sql,
                    new SqlParameter("@name", fullName),
                    new SqlParameter("@phone", phone),
                    new SqlParameter("@email", email));

                Session["UserName"] = fullName;
                lblProfileName.Text = fullName;

                ShowAlert("Profile information saved successfully!", true);
            }
            catch (Exception ex)
            {
                ShowAlert("Error updating profile: " + ex.Message, false);
            }
        }

        protected void btnSaveAddress_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "address";
            if (!Page.IsValid) return;

            string email = Session["UserEmail"].ToString();
            string line = txtAddressLine.Text.Trim();
            string city = txtCity.Text.Trim();
            string state = txtState.Text.Trim();
            string pin = txtPincode.Text.Trim();
            string country = string.IsNullOrWhiteSpace(txtCountry.Text) ? "India" : txtCountry.Text.Trim();

            string fullAddress = line + ", " + city + ", " + state + " - " + pin + ", " + country;

            try
            {
                string sql = "UPDATE users SET address=@address WHERE email=@email";
                DbHelper.ExecuteNonQuery(sql,
                    new SqlParameter("@address", fullAddress),
                    new SqlParameter("@email", email));

                lblDisplayAddress.Text = Server.HtmlEncode(fullAddress);
                ShowAlert("Delivery address saved successfully!", true);
            }
            catch (Exception ex)
            {
                ShowAlert("Error saving address: " + ex.Message, false);
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            hfActiveTab.Value = "password";
            if (!Page.IsValid) return;

            string email = Session["UserEmail"].ToString();
            string currentPass = txtCurrentPassword.Text.Trim();
            string newPass = txtNewPassword.Text.Trim();

            try
            {
                // Verify current password
                string checkSql = "SELECT COUNT(*) FROM users WHERE email=@email AND password=@pass";
                object countObj = DbHelper.ExecuteScalar(checkSql,
                    new SqlParameter("@email", email),
                    new SqlParameter("@pass", currentPass));

                if (Convert.ToInt32(countObj) == 0)
                {
                    ShowAlert("Current password is incorrect. Please try again.", false);
                    return;
                }

                // Update password
                string updateSql = "UPDATE users SET password=@newPass WHERE email=@email";
                DbHelper.ExecuteNonQuery(updateSql,
                    new SqlParameter("@newPass", newPass),
                    new SqlParameter("@email", email));

                txtCurrentPassword.Text = string.Empty;
                txtNewPassword.Text = string.Empty;
                txtConfirmNewPassword.Text = string.Empty;

                ShowAlert("Password changed successfully!", true);
            }
            catch (Exception ex)
            {
                ShowAlert("Error changing password: " + ex.Message, false);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("login.aspx");
        }

        private void ShowAlert(string message, bool isSuccess)
        {
            pnlAlert.Visible = true;
            lblAlertMessage.Text = message;
            pnlAlert.CssClass = isSuccess ? "alert-banner alert-success" : "alert-banner alert-danger";
        }
    }
}