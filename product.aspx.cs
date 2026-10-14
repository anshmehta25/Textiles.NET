using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;

namespace textiles
{
    public partial class product : Page
    {
        public int ProductCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["q"] != null)
                {
                    txtSearch.Text = Request.QueryString["q"];
                }

                if (Request.QueryString["category"] != null)
                {
                    string cat = Request.QueryString["category"];
                    var item = ddlCategory.Items.FindByValue(cat);
                    if (item != null)
                    {
                        ddlCategory.SelectedValue = cat;
                    }
                }

                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            DataTable dt = null;
            string query = txtSearch.Text.Trim();
            string category = ddlCategory.SelectedValue;
            string sort = ddlSort.SelectedValue;

            try
            {
                string sql = "SELECT id, name, category, price, original_price, rating, image_url, description, stock FROM products WHERE 1=1";
                var parameters = new List<SqlParameter>();

                if (!string.IsNullOrWhiteSpace(query))
                {
                    sql += " AND (name LIKE @q OR description LIKE @q OR category LIKE @q)";
                    parameters.Add(new SqlParameter("@q", "%" + query + "%"));
                }

                if (!string.IsNullOrWhiteSpace(category) && category != "All")
                {
                    sql += " AND category = @category";
                    parameters.Add(new SqlParameter("@category", category));
                }

                if (sort == "price_asc")
                {
                    sql += " ORDER BY price ASC";
                }
                else if (sort == "price_desc")
                {
                    sql += " ORDER BY price DESC";
                }
                else if (sort == "rating")
                {
                    sql += " ORDER BY rating DESC";
                }
                else
                {
                    sql += " ORDER BY id ASC";
                }

                dt = DbHelper.ExecuteDataTable(sql, parameters.ToArray());
            }
            catch
            {
                // Fallback to static wireframe products
            }

            if (dt == null || dt.Rows.Count == 0)
            {
                dt = GetStaticProducts(query, category, sort);
            }

            ProductCount = dt != null ? dt.Rows.Count : 0;
            rptProducts.DataSource = dt;
            rptProducts.DataBind();
        }

        private DataTable GetStaticProducts(string query, string category, string sort)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("id", typeof(int));
            dt.Columns.Add("name", typeof(string));
            dt.Columns.Add("category", typeof(string));
            dt.Columns.Add("price", typeof(decimal));
            dt.Columns.Add("original_price", typeof(decimal));
            dt.Columns.Add("rating", typeof(double));
            dt.Columns.Add("image_url", typeof(string));
            dt.Columns.Add("stock", typeof(int));
            dt.Columns.Add("description", typeof(string));

            dt.Rows.Add(1, "Marble Swirl Print T-Shirt", "T-Shirts", 799.00m, 1199.00m, 4.8, "images/product_marble_tshirt.jpg", 40, "Combed cotton t-shirt with marble swirl print.");
            dt.Rows.Add(2, "Gorilla Graphic T-Shirt", "T-Shirts", 849.00m, 1299.00m, 4.7, "images/product_gorilla_tshirt.jpg", 35, "Streetwear oversized graphic tee.");
            dt.Rows.Add(3, "Textiles Signature Hoodie", "Hoodies", 1599.00m, 2299.00m, 4.9, "images/product_textiles_hoodie.jpg", 25, "Heavy-blend fleece pullover hoodie.");
            dt.Rows.Add(4, "Tiger Varsity Jacket", "Jackets", 2499.00m, 3499.00m, 4.8, "images/product_tiger_jacket.jpg", 15, "Retro varsity bomber jacket with tiger emblem.");
            dt.Rows.Add(5, "Slim Fit Blue Jeans", "Jeans", 1299.00m, 1899.00m, 4.6, "images/product_slim_jeans.jpg", 30, "Classic washed indigo slim fit denim jeans.");

            if (!string.IsNullOrWhiteSpace(category) && category != "All")
            {
                for (int i = dt.Rows.Count - 1; i >= 0; i--)
                {
                    if (!dt.Rows[i]["category"].ToString().Equals(category, StringComparison.OrdinalIgnoreCase))
                    {
                        dt.Rows.RemoveAt(i);
                    }
                }
            }

            return dt;
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadProducts();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            ddlCategory.SelectedValue = "All";
            ddlSort.SelectedValue = "default";
            LoadProducts();
        }
    }
}
