using System;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;

namespace textiles
{
    public partial class login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["registered"] == "1")
                {
                    lblLoginError.Visible = true;
                    lblLoginError.Style["background"] = "#d4edda";
                    lblLoginError.Style["color"] = "#155724";
                    lblLoginError.Style["border"] = "1px solid #c3e6cb";
                    lblLoginError.Text = "Account created successfully! Please login with your credentials.";
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string email = txtEmail.Text.Trim();

            
            string password = txtPassword.Text.Trim();

            try
            {
                // 1. Check users table
                string userSql = "SELECT TOP 1 id, name, email, role FROM users WHERE email=@email AND password=@password";
                DataTable dtUser = DbHelper.ExecuteDataTable(userSql, 
                    new SqlParameter("@email", email), 
                    new SqlParameter("@password", password));

                if (dtUser != null && dtUser.Rows.Count > 0)
                {
                    DataRow row = dtUser.Rows[0];
                    Session["UserEmail"] = row["email"].ToString();
                    Session["UserName"] = row["name"].ToString();
                    Session["UserRole"] = row["role"].ToString();

                    if (row["role"].ToString().ToLower() == "admin")
                    {
                        Response.Redirect("admin.aspx");
                    }
                    else
                    {
                        Response.Redirect("index.aspx");
                    }
                    return;
                }

                // 2. Check admin_users table
                string adminSql = "SELECT TOP 1 id, username, email, role FROM admin_users WHERE (email=@email OR username=@email) AND password=@password";
                DataTable dtAdmin = DbHelper.ExecuteDataTable(adminSql, 
                    new SqlParameter("@email", email), 
                    new SqlParameter("@password", password));

                if (dtAdmin != null && dtAdmin.Rows.Count > 0)
                {
                    DataRow row = dtAdmin.Rows[0];
                    Session["UserEmail"] = row["email"].ToString();
                    Session["UserName"] = row["username"].ToString();
                    Session["UserRole"] = "admin";

                    Response.Redirect("admin.aspx");
                    return;
                }

                lblLoginError.Visible = true;
                lblLoginError.Text = "Invalid Email or Password. Please try again.";
            }
            catch (Exception ex)
            {
                lblLoginError.Visible = true;
                lblLoginError.Text = "Error: " + ex.Message;
            }
        }
    }
}