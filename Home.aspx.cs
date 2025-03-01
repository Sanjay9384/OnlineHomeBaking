using System;
using System.Data;
using System.Data.OleDb;
using System.Web;

namespace OnlineHomeBaking
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
                LoadDiscountedProducts();
            }
        }

        private void LoadProducts()
        {
            string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\sanjay\\Desktop\\MCA_Project\\HomeBaking\\HomeBakingDB.accdb";
            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();
                string query = "SELECT ProductID, ProductName, CInt(Price) AS Price, ImagePath FROM Products;";
                OleDbDataAdapter da = new OleDbDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptProducts.DataSource = dt;
                rptProducts.DataBind();
            }
        }

        private void LoadDiscountedProducts()
        {
            string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\sanjay\\Desktop\\MCA_Project\\HomeBaking\\HomeBakingDB.accdb";
            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();
                string query = "SELECT ProductID, ProductName, CInt(Price) - CInt(Discount) AS DiscountedPrice, ImagePath FROM Products WHERE CInt(Discount) > 0";
                OleDbDataAdapter da = new OleDbDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptDiscountProducts.DataSource = dt;
                rptDiscountProducts.DataBind();
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            try
            {
                // Check if user is logged in
                if (Session["UserID"] == null)
                {
                    Response.Write("<script>alert('Please log in before adding to cart.');</script>");
                    return;
                }

                // Convert UserID and ProductID safely
                int userId;
                if (!int.TryParse(Session["UserID"].ToString(), out userId))
                {
                    Response.Write("<script>alert('Invalid User ID. Please log in again.');</script>");
                    return;
                }

                int productId;
                if (!int.TryParse(((System.Web.UI.WebControls.Button)sender).CommandArgument, out productId))
                {
                    Response.Write("<script>alert('Invalid Product ID.');</script>");
                    return;
                }

                // Ensure database path is correct
                string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\sanjay\\Desktop\\MCA_Project\\HomeBaking\\HomeBakingDB.accdb";
                using (OleDbConnection conn = new OleDbConnection(connStr))
                {
                    conn.Open();

                    // Insert query
                    string query = "INSERT INTO Cart2 (UserID, ProductID, Quantity, DateAdded) VALUES (@UserID, @ProductID, @Quantity, @DateAdded)";
                    using (OleDbCommand cmd = new OleDbCommand(query, conn))
                    {
                        // Ensure correct data types
                        cmd.Parameters.Add("@UserID", OleDbType.Integer).Value = userId;
                        cmd.Parameters.Add("@ProductID", OleDbType.Integer).Value = productId;
                        cmd.Parameters.Add("@Quantity", OleDbType.Integer).Value = 1;
                        cmd.Parameters.Add("@DateAdded", OleDbType.Date).Value = DateTime.Now;

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Product added to cart successfully!');</script>");
                            Response.Redirect("Cart.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Error adding product to cart.');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }


    }
}
