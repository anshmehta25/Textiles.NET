using System;
using System.Web.UI;

namespace textiles
{
    public partial class processing : Page
    {
        public string OrderNumber = "ORD-FWQ3H";
        public string TxnId = "TXN-89421894";
        public string PaymentMethod = "Cash on Delivery (COD)";
        public string Amount = "730";
        public string DateTimeStr = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["order"] != null)
            {
                OrderNumber = Request.QueryString["order"];
            }
            else if (Session["LastOrderNumber"] != null)
            {
                OrderNumber = Session["LastOrderNumber"].ToString();
            }

            if (Session["LastOrderAmount"] != null)
            {
                Amount = Session["LastOrderAmount"].ToString();
            }

            if (Session["LastPaymentMethod"] != null)
            {
                string m = Session["LastPaymentMethod"].ToString();
                PaymentMethod = m == "Online" ? "Online Payment (UPI/Card)" : "Cash on Delivery (COD)";
            }

            // Generate realistic transaction ID matching Figure 9
            TxnId = "TXN-" + Math.Abs((OrderNumber + DateTime.Now.Ticks).GetHashCode()).ToString().Substring(0, 8);
            DateTimeStr = DateTime.Now.ToString("dd-MMM-yyyy, hh:mm tt");
        }
    }
}
