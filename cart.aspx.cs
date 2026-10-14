using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace textiles
{
    public partial class cart : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["action"] == "add" && Request.QueryString["id"] != null)
                {
                    int pid;
                    if (int.TryParse(Request.QueryString["id"], out pid))
                    {
                        AddToCart(pid);
                    }
                }

                LoadCart();
            }
        }

        private void AddToCart(int productId)
        {
            string userEmail = Session["UserEmail"] != null ? Session["UserEmail"].ToString() : "guest@textiles.com";
            try
            {
                string sql = "SELECT TOP 1 * FROM products WHERE id=@id";
                DataTable dt = DbHelper.ExecuteDataTable(sql, new SqlParameter("@id", productId));
                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    string pName = row["name"].ToString();
                    decimal pPrice = Convert.ToDecimal(row["price"]);
                    string pImage = row["image_url"].ToString();

                    string checkSql = "SELECT TOP 1 id, quantity FROM cart WHERE user_email=@email AND product_id=@pid";
                    DataTable dtCart = DbHelper.ExecuteDataTable(checkSql, 
                        new SqlParameter("@email", userEmail),
                        new SqlParameter("@pid", productId));

                    if (dtCart != null && dtCart.Rows.Count > 0)
                    {
                        int cartId = Convert.ToInt32(dtCart.Rows[0]["id"]);
                        int qty = Convert.ToInt32(dtCart.Rows[0]["quantity"]) + 1;
                        DbHelper.ExecuteNonQuery("UPDATE cart SET quantity=@qty WHERE id=@cid", 
                            new SqlParameter("@qty", qty),
                            new SqlParameter("@cid", cartId));
                    }
                    else
                    {
                        DbHelper.ExecuteNonQuery("INSERT INTO cart (user_email, product_id, product_name, price, image_url, quantity, size) VALUES (@email, @pid, @pname, @price, @image, 1, 'M')",
                            new SqlParameter("@email", userEmail),
                            new SqlParameter("@pid", productId),
                            new SqlParameter("@pname", pName),
                            new SqlParameter("@price", pPrice),
                            new SqlParameter("@image", pImage));
                    }
                }
            }
            catch
            {
            }
        }

        private void LoadCart()
        {
            string userEmail = Session["UserEmail"] != null ? Session["UserEmail"].ToString() : "guest@textiles.com";
            try
            {
                string sql = "SELECT * FROM cart WHERE user_email=@email ORDER BY id DESC";
                DataTable dt = DbHelper.ExecuteDataTable(sql, new SqlParameter("@email", userEmail));

                if (dt != null && dt.Rows.Count > 0)
                {
                    decimal subtotal = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        decimal price = Convert.ToDecimal(row["price"]);
                        int qty = Convert.ToInt32(row["quantity"]);
                        subtotal += price * qty;
                    }

                    lblSubtotal.Text = subtotal.ToString("N0");
                    if (lblShipping != null) lblShipping.Text = "FREE";
                    decimal tax = Math.Round(subtotal * 0.05m);
                    if (lblTax != null) lblTax.Text = tax.ToString("N0");
                    lblTotal.Text = subtotal.ToString("N0");

                    rptCart.DataSource = dt;
                    rptCart.DataBind();
                    pnlCart.Visible = true;
                    pnlEmpty.Visible = false;
                }
                else
                {
                    pnlCart.Visible = false;
                    pnlEmpty.Visible = true;
                }
            }
            catch
            {
                pnlCart.Visible = false;
                pnlEmpty.Visible = true;
            }
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int cartId = Convert.ToInt32(e.CommandArgument);
            try
            {
                if (e.CommandName == "Remove")
                {
                    DbHelper.ExecuteNonQuery("DELETE FROM cart WHERE id=@id", new SqlParameter("@id", cartId));
                }
                else if (e.CommandName == "Increase")
                {
                    DbHelper.ExecuteNonQuery("UPDATE cart SET quantity = quantity + 1 WHERE id=@id", new SqlParameter("@id", cartId));
                }
                else if (e.CommandName == "Decrease")
                {
                    DataTable dt = DbHelper.ExecuteDataTable("SELECT quantity FROM cart WHERE id=@id", new SqlParameter("@id", cartId));
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        int currentQty = Convert.ToInt32(dt.Rows[0]["quantity"]);
                        if (currentQty > 1)
                        {
                            DbHelper.ExecuteNonQuery("UPDATE cart SET quantity = quantity - 1 WHERE id=@id", new SqlParameter("@id", cartId));
                        }
                        else
                        {
                            DbHelper.ExecuteNonQuery("DELETE FROM cart WHERE id=@id", new SqlParameter("@id", cartId));
                        }
                    }
                }
            }
            catch
            {
            }

            LoadCart();
        }

        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            string userEmail = Session["UserEmail"] != null ? Session["UserEmail"].ToString() : "guest@textiles.com";
            try
            {
                DbHelper.ExecuteNonQuery("DELETE FROM cart WHERE user_email=@email", new SqlParameter("@email", userEmail));
            }
            catch
            {
            }

            LoadCart();
        }
    }
}