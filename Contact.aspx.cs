using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace textiles
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();

            try
            {
                string sql = "INSERT INTO contact_submissions (name, email, subject, message) VALUES (@name, @email, @subject, @message)";
                DbHelper.ExecuteNonQuery(sql,
                    new SqlParameter("@name", name),
                    new SqlParameter("@email", email),
                    new SqlParameter("@subject", subject),
                    new SqlParameter("@message", message));

                lblMessage.Visible = true;
                lblMessage.Text = "Thank you! Your message has been received and saved successfully.";
                lblMessage.CssClass = "success-message";

                txtName.Text = "";
                txtEmail.Text = "";
                txtSubject.Text = "";
                txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Visible = true;
                lblMessage.Text = "Error saving message: " + ex.Message;
                lblMessage.CssClass = "error-message";
            }
        }
    }
}