using System;
using System.Data.OleDb;
using System.Web.UI;

namespace OnlineHomeBaking
{
    public partial class Payments : Page
    {
        protected void btnPay_Click(object sender, EventArgs e)
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                decimal totalAmount = GetTotalAmount(userId);
                string paymentMethod = ddlPaymentMethod.SelectedValue;

                if (totalAmount > 0)
                {
                    SavePayment(userId, totalAmount, paymentMethod);

                    // JavaScript to show popup and redirect
                    string script = "<script>alert('Payment Successful! Thank you for your order.'); window.location='Home.aspx';</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "paymentSuccess", script);
                }
                else
                {
                    lblMessage.Text = "Cart is empty. Please add products before making payment.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }


        private decimal GetTotalAmount(int userId)
        {
            string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\sanjay\\Desktop\\MCA_Project\\HomeBaking\\HomeBakingDB.accdb";
            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();
                string query = "SELECT SUM(Products.Price * Cart2.Quantity) FROM Cart2 " +
                               "INNER JOIN Products ON Cart2.ProductID = Products.ProductID " +
                               "WHERE Cart2.UserID = @UserID";

                OleDbCommand cmd = new OleDbCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);
                object result = cmd.ExecuteScalar();

                return (result != DBNull.Value) ? Convert.ToDecimal(result) : 0;
            }
        }

        private void SavePayment(int userId, decimal amount, string method)
        {
            string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\sanjay\\Desktop\\MCA_Project\\HomeBaking\\HomeBakingDB.accdb";

            using (OleDbConnection conn = new OleDbConnection(connStr))
            {
                conn.Open();
                string query = "INSERT INTO Payments (UserID, TotalAmount, PaymentMethod, PaymentStatus, PaymentDate) " +
                               "VALUES (@UserID, @TotalAmount, @PaymentMethod, @PaymentStatus, @PaymentDate)";

                OleDbCommand cmd = new OleDbCommand(query, conn);

                // Explicitly define the data types
                cmd.Parameters.Add("@UserID", OleDbType.Integer).Value = userId;
                cmd.Parameters.Add("@TotalAmount", OleDbType.Currency).Value = Convert.ToDouble(amount);
                cmd.Parameters.Add("@PaymentMethod", OleDbType.VarChar).Value = method;
                cmd.Parameters.Add("@PaymentStatus", OleDbType.VarChar).Value = "Completed";
                cmd.Parameters.Add("@PaymentDate", OleDbType.Date).Value = DateTime.Now;

                cmd.ExecuteNonQuery();
            }
        }

    }
}
