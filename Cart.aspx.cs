using System;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;

namespace OnlineHomeBaking
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            int userId = Convert.ToInt32(Session["UserID"]); // Ensure the user is logged in

            string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\sanjay\\Desktop\\MCA_Project\\HomeBaking\\HomeBakingDB.accdb";
            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();
                string query = @"
                        SELECT Cart2.CartID, Products.ProductName, Products.ImagePath AS ProductImage, 
                               CInt(Products.Price) AS Price, Cart2.Quantity
                        FROM Cart2
                        INNER JOIN Products ON Cart2.ProductID = Products.ProductID
                        WHERE Cart2.UserID = @UserID";


                OleDbDataAdapter da = new OleDbDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@UserID", userId);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptCart.DataSource = dt;
                rptCart.DataBind();

                // Calculate Total Amount
                int total = 0;
                foreach (DataRow row in dt.Rows)
                {
                    total += Convert.ToInt32(row["Price"]) * Convert.ToInt32(row["Quantity"]);
                }
                lblTotalAmount.Text = total.ToString();
            }
        }

        protected void RemoveFromCart_Click(object sender, EventArgs e)
        {
            int cartId = Convert.ToInt32(((Button)sender).CommandArgument);
            string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\sanjay\\Desktop\\MCA_Project\\HomeBaking\\HomeBakingDB.accdb";

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();
                string query = "DELETE FROM Cart2 WHERE CartID = @CartID";
                OleDbCommand cmd = new OleDbCommand(query, conn);
                cmd.Parameters.AddWithValue("@CartID", cartId);
                cmd.ExecuteNonQuery();
            }

            LoadCart(); // Reload cart after deletion
        }

        protected void Checkout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payments.aspx");
        }
    }
}
