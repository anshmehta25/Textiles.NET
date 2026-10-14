using System;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;

namespace textiles
{
    public partial class productdetails : Page
    {
        private int productId = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int.TryParse(Request.QueryString["id"], out productId);
            }
            if (productId <= 0) productId = 1;

            if (!IsPostBack)
            {
                LoadProductDetails();
            }
        }

        private void LoadProductDetails()
        {
            try
            {
                string sql = "SELECT TOP 1 * FROM products WHERE id=@id";
                DataTable dt = DbHelper.ExecuteDataTable(sql, new SqlParameter("@id", productId));

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    lblTitle.Text = row["name"].ToString();
                    lblCategory.Text = row["category"].ToString().ToUpper();
                    lblPrice.Text = Convert.ToDecimal(row["price"]).ToString("N0");
                    lblOriginalPrice.Text = Convert.ToDecimal(row["original_price"]).ToString("N0");
                    lblRating.Text = row["rating"].ToString();
                    lblDescription.Text = row["description"].ToString();
                    imgProduct.ImageUrl = row["image_url"].ToString();
                    return;
                }
            }
            catch
            {
                // Fallback to static wireframe data
            }

            LoadStaticProductDetails(productId);
        }

        private void LoadStaticProductDetails(int id)
        {
            switch (id)
            {
                case 2:
                    lblTitle.Text = "Gorilla Graphic T-Shirt";
                    lblCategory.Text = "T-SHIRTS";
                    lblPrice.Text = "849";
                    lblOriginalPrice.Text = "1,299";
                    lblRating.Text = "4.7";
                    lblDescription.Text = "Streetwear aesthetic oversized graphic t-shirt with vivid gorilla artwork. 100% bio-washed cotton.";
                    imgProduct.ImageUrl = "images/product_gorilla_tshirt.jpg";
                    break;
                case 3:
                    lblTitle.Text = "Textiles Signature Hoodie";
                    lblCategory.Text = "HOODIES";
                    lblPrice.Text = "1,599";
                    lblOriginalPrice.Text = "2,299";
                    lblRating.Text = "4.9";
                    lblDescription.Text = "Heavy-blend fleece pullover hoodie with signature Textiles embroidery, double-lined hood, and kangaroo pouch.";
                    imgProduct.ImageUrl = "images/product_textiles_hoodie.jpg";
                    break;
                case 4:
                    lblTitle.Text = "Tiger Varsity Jacket";
                    lblCategory.Text = "JACKETS";
                    lblPrice.Text = "2,499";
                    lblOriginalPrice.Text = "3,499";
                    lblRating.Text = "4.8";
                    lblDescription.Text = "Retro varsity bomber jacket with embroidered tiger back emblem, contrast striped ribbing, and snap-button closure.";
                    imgProduct.ImageUrl = "images/product_tiger_jacket.jpg";
                    break;
                case 5:
                    lblTitle.Text = "Slim Fit Blue Jeans";
                    lblCategory.Text = "JEANS";
                    lblPrice.Text = "1,299";
                    lblOriginalPrice.Text = "1,899";
                    lblRating.Text = "4.6";
                    lblDescription.Text = "Classic washed indigo slim fit denim jeans crafted from stretch cotton with clean five-pocket detailing.";
                    imgProduct.ImageUrl = "images/product_slim_jeans.jpg";
                    break;
                default:
                    lblTitle.Text = "Marble Swirl Print T-Shirt";
                    lblCategory.Text = "T-SHIRTS";
                    lblPrice.Text = "799";
                    lblOriginalPrice.Text = "1,199";
                    lblRating.Text = "4.8";
                    lblDescription.Text = "Premium combed cotton t-shirt featuring modern marble swirl print. Super comfortable, breathable, and pre-shrunk for an ideal fit.";
                    imgProduct.ImageUrl = "images/product_marble_tshirt.jpg";
                    break;
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            AddToCartAndRedirect("cart.aspx");
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;
            AddToCartAndRedirect("checkout.aspx");
        }

        private void AddToCartAndRedirect(string redirectPage)
        {
            if (!Page.IsValid) return;

            string userEmail = Session["UserEmail"] != null ? Session["UserEmail"].ToString() : "guest@textiles.com";
            int qty = 1;
            int.TryParse(txtQuantity.Text, out qty);
            if (qty < 1) qty = 1;
            string selectedSize = ddlSize.SelectedValue;

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

                    string checkSql = "SELECT TOP 1 id, quantity FROM cart WHERE user_email=@email AND product_id=@pid AND size=@size";
                    DataTable dtCart = DbHelper.ExecuteDataTable(checkSql, 
                        new SqlParameter("@email", userEmail),
                        new SqlParameter("@pid", productId),
                        new SqlParameter("@size", selectedSize));

                    if (dtCart != null && dtCart.Rows.Count > 0)
                    {
                        int cartId = Convert.ToInt32(dtCart.Rows[0]["id"]);
                        int currentQty = Convert.ToInt32(dtCart.Rows[0]["quantity"]);
                        string updateSql = "UPDATE cart SET quantity=@qty WHERE id=@cid";
                        DbHelper.ExecuteNonQuery(updateSql, 
                            new SqlParameter("@qty", currentQty + qty),
                            new SqlParameter("@cid", cartId));
                    }
                    else
                    {
                        string insertSql = "INSERT INTO cart (user_email, product_id, product_name, price, image_url, quantity, size) VALUES (@email, @pid, @pname, @price, @image, @qty, @size)";
                        DbHelper.ExecuteNonQuery(insertSql,
                            new SqlParameter("@email", userEmail),
                            new SqlParameter("@pid", productId),
                            new SqlParameter("@pname", pName),
                            new SqlParameter("@price", pPrice),
                            new SqlParameter("@image", pImage),
                            new SqlParameter("@qty", qty),
                            new SqlParameter("@size", selectedSize));
                    }
                }
            }
            catch
            {
                // Ignored fallback
            }

            Response.Redirect(redirectPage);
        }
    }
}