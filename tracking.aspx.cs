using System;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;

namespace textiles
{
    public partial class tracking : Page
    {
        public string OrderStatus = "Shipped";
        public int StepIndex = 5; // 1: Placed, 2: Confirmed, 3: Processing, 4: Packed, 5: Shipped, 6: OutForDelivery, 7: Delivered

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string orderNum = Request.QueryString["order"];
                if (!string.IsNullOrEmpty(orderNum))
                {
                    txtTrackOrder.Text = orderNum;
                    LoadTracking(orderNum);
                }
                else
                {
                    txtTrackOrder.Text = "ORD-FWQ3H";
                    LoadTracking("ORD-FWQ3H");
                }
            }
        }

        protected void btnTrack_Click(object sender, EventArgs e)
        {
            string orderNum = txtTrackOrder.Text.Trim();
            if (!string.IsNullOrEmpty(orderNum))
            {
                LoadTracking(orderNum);
            }
        }

        private void LoadTracking(string orderNumber)
        {
            try
            {
                string sql = "SELECT TOP 1 * FROM orders WHERE order_number=@ordNum";
                DataTable dt = DbHelper.ExecuteDataTable(sql, new SqlParameter("@ordNum", orderNumber));

                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow r = dt.Rows[0];
                    lblOrderId.Text = r["order_number"].ToString();
                    lblOrderDate.Text = Convert.ToDateTime(r["created_at"]).ToString("dd-MMM-yyyy");
                    lblTotalAmount.Text = Convert.ToDecimal(r["total_amount"]).ToString("N0");
                    lblPaymentMethod.Text = r["payment_method"].ToString() == "Online" ? "Online Payment (UPI/Card)" : "Cash on Delivery (COD)";
                    lblCustomerName.Text = r["customer_name"].ToString();
                    lblAddress.Text = r["address"].ToString();
                    lblPhone.Text = r["phone"].ToString();
                    lblCourier.Text = "BlueDart Express";
                    lblAwb.Text = "BLUEDART-" + Math.Abs(orderNumber.GetHashCode()).ToString().Substring(0, 8);

                    // Fetch items
                    int orderId = Convert.ToInt32(r["id"]);
                    DataTable dtItems = DbHelper.ExecuteDataTable("SELECT product_name, quantity, size FROM order_items WHERE order_id=@oid", new SqlParameter("@oid", orderId));
                    if (dtItems != null && dtItems.Rows.Count > 0)
                    {
                        string itemsStr = "";
                        foreach (DataRow ir in dtItems.Rows)
                        {
                            if (itemsStr.Length > 0) itemsStr += ", ";
                            itemsStr += ir["product_name"] + " x " + ir["quantity"] + " (Size: " + ir["size"] + ")";
                        }
                        lblItemsList.Text = itemsStr;
                    }
                    else
                    {
                        lblItemsList.Text = "Marble Swirl Print T-Shirt x 1 (Size: M)";
                    }

                    OrderStatus = r["order_status"].ToString();
                    SetStepIndex(OrderStatus);
                    pnlTrackingResult.Visible = true;
                    lblTrackingMsg.Visible = false;
                    return;
                }
            }
            catch
            {
            }

            // Fallback to demo wireframe tracking data (Figure 11)
            LoadFallback(orderNumber);
        }

        private void SetStepIndex(string status)
        {
            switch (status.ToLower())
            {
                case "delivered":
                    StepIndex = 7;
                    break;
                case "out for delivery":
                    StepIndex = 6;
                    break;
                case "shipped":
                    StepIndex = 5;
                    break;
                case "packed":
                    StepIndex = 4;
                    break;
                case "processing":
                    StepIndex = 3;
                    break;
                default:
                    StepIndex = 5;
                    break;
            }
        }

        private void LoadFallback(string orderNumber)
        {
            lblOrderId.Text = orderNumber;
            lblOrderDate.Text = "01-Mar-2026";
            lblTotalAmount.Text = "730";
            lblPaymentMethod.Text = "Cash on Delivery (COD)";
            lblCustomerName.Text = "Tirth Kotak";
            lblAddress.Text = "101 Ring Road, Rajkot, Gujarat - 360005";
            lblPhone.Text = "+91 9876543211";
            lblCourier.Text = "BlueDart Express";
            lblAwb.Text = "BLUEDART-84920194";
            lblItemsList.Text = "Marble Swirl Print T-Shirt x 1 (Size: M)";
            OrderStatus = "Shipped";
            StepIndex = 5;
            pnlTrackingResult.Visible = true;
            lblTrackingMsg.Visible = false;
        }
    }
}
