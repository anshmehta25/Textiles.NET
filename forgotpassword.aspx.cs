using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace textiles
{
    public partial class forgotpassword : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string email = txtEmail.Text.Trim();

            try
            {
                string sql = "SELECT COUNT(*) FROM users WHERE email=@email";
                object count = DbHelper.ExecuteScalar(sql, new SqlParameter("@email", email));

                if (Convert.ToInt32(count) > 0)
                {
                    lblForgotMsg.Text = "Password reset instructions have been sent to " + Server.HtmlEncode(email) + ".";
                    lblForgotMsg.Style["background"] = "#d4edda";
                    lblForgotMsg.Style["color"] = "#155724";
                    lblForgotMsg.Style["border"] = "1px solid #c3e6cb";
                    lblForgotMsg.Visible = true;
                }
                else
                {
                    lblForgotMsg.Text = "No account found with this email address.";
                    lblForgotMsg.Style["background"] = "#f8d7da";
                    lblForgotMsg.Style["color"] = "#721c24";
                    lblForgotMsg.Style["border"] = "1px solid #f5c6cb";
                    lblForgotMsg.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblForgotMsg.Text = "Error: " + Server.HtmlEncode(ex.Message);
                lblForgotMsg.Style["background"] = "#f8d7da";
                lblForgotMsg.Style["color"] = "#721c24";
                lblForgotMsg.Style["border"] = "1px solid #f5c6cb";
                lblForgotMsg.Visible = true;
            }
        }
    }
}