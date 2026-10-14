using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace textiles
{
    public partial class register : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string password = txtPassword.Text.Trim();

            try
            {
                // Check if email already exists
                string checkSql = "SELECT COUNT(*) FROM users WHERE email=@email";
                object count = DbHelper.ExecuteScalar(checkSql, new SqlParameter("@email", email));
                if (Convert.ToInt32(count) > 0)
                {
                    lblRegisterMsg.Text = "An account with this email already exists!";
                    lblRegisterMsg.Style["background"] = "#f8d7da";
                    lblRegisterMsg.Style["color"] = "#721c24";
                    lblRegisterMsg.Style["border"] = "1px solid #f5c6cb";
                    lblRegisterMsg.Visible = true;
                    return;
                }

                // Insert new user into database
                string insertSql = "INSERT INTO users (name, email, phone, password, role) VALUES (@name, @email, @phone, @password, 'user')";
                DbHelper.ExecuteNonQuery(insertSql,
                    new SqlParameter("@name", name),
                    new SqlParameter("@email", email),
                    new SqlParameter("@phone", phone),
                    new SqlParameter("@password", password));

                Response.Redirect("login.aspx?registered=1");
            }
            catch (Exception ex)
            {
                lblRegisterMsg.Text = "Error registering user: " + Server.HtmlEncode(ex.Message);
                lblRegisterMsg.Style["background"] = "#f8d7da";
                lblRegisterMsg.Style["color"] = "#721c24";
                lblRegisterMsg.Style["border"] = "1px solid #f5c6cb";
                lblRegisterMsg.Visible = true;
            }
        }
    }
}