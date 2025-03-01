using System;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;

namespace OnlineHomeBaking
{
    public partial class Login : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\sanjay\\Desktop\\MCA_Project\\HomeBaking\\HomeBakingDB.accdb";
                using (OleDbConnection conn = new OleDbConnection(connStr))
                {
                    conn.Open();
                    string query = "SELECT UserID FROM Users WHERE Email = ? AND Password = ?"; // Fetch UserID

                    using (OleDbCommand cmd = new OleDbCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("?", txtEmail.Text.Trim());
                        cmd.Parameters.AddWithValue("?", txtPassword.Text.Trim());

                        object result = cmd.ExecuteScalar(); // Get UserID from DB

                        if (result != null) // If user exists
                        {
                            Session["UserID"] = result.ToString(); // Store UserID in session
                            Session["Email"] = txtEmail.Text.Trim(); // Store Email for future use

                            Response.Write("<script>alert('Login successful! Redirecting to Home Page...'); window.location='Home.aspx';</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid Email or Password');</script>");
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
