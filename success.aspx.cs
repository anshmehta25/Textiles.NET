using System;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;

namespace textiles
{
    public partial class success : Page
    {
        public string OrderNumberClean = "ORD-FWQ3H";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string orderNum = Request.QueryString["order"];
                if (string.IsNullOrEmpty(orderNum) && Session["LastOrderNumber"] != null)
                {
                    orderNum = Session["LastOrderNumber"].ToString();
                }

                if (!string.IsNullOrEmpty(orderNum))
                {
                    OrderNumberClean = orderNum;
                    LoadOrderDetails(orderNum);
                }
                else
                {
                    LoadFallbackDetails();
                }

                lnkTrackOrder.NavigateUrl = "tracking.aspx?order=" + Server.UrlEncode(OrderNumberClean);
            }
        }

        private void LoadOrderDetails(string orderNumber)
        {
            try
            {
                string sql = "SELECT TOP 1 * FROM orders WHERE order_number=@ordNum";
                DataTable dt = DbHelper.ExecuteDataTable(sql, new SqlParameter("@ordNum", orderNumber));

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];
                    lblOrderNumber.Text = row["order_number"].ToString();
                    lblOrderDate.Text = Convert.ToDateTime(row["created_at"]).ToString("dd MMM yyyy, hh:mm tt");
                    lblTotalAmount.Text = Convert.ToDecimal(row["total_amount"]).ToString("N0");
                    lblOrderStatus.Text = row["order_status"].ToString();
                    lblCustomerName.Text = row["customer_name"].ToString();
                    lblCustomerEmail.Text = row["user_email"].ToString();
                    lblPaymentMethod.Text = row["payment_method"].ToString() == "Online" ? "Online Payment (UPI/Card)" : "Cash on Delivery (COD)";
                    return;
                }
            }
            catch
            {
            }

            LoadFallbackDetails();
        }

        private void LoadFallbackDetails()
        {
            lblOrderNumber.Text = "ORD-FWQ3H";
            lblOrderDate.Text = DateTime.Now.ToString("dd MMM yyyy, hh:mm tt");
            lblTotalAmount.Text = "730";
            lblOrderStatus.Text = "Processing";
            lblCustomerName.Text = Session["LastCustomerName"] != null ? Session["LastCustomerName"].ToString() : "Tirth Kotak";
            lblCustomerEmail.Text = Session["LastCustomerEmail"] != null ? Session["LastCustomerEmail"].ToString() : "tirth@gmail.com";
            lblPaymentMethod.Text = "Cash on Delivery (COD)";
        }
    }
}