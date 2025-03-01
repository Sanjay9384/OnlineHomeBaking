using System;
using System.Data.OleDb;
using System.Web.UI;

namespace OnlineHomeBaking
{
    public partial class Registeration : Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\sanjay\\Desktop\\MCA_Project\\HomeBaking\\HomeBakingDB.accdb";
                using (OleDbConnection conn = new OleDbConnection(connStr))
                {
                    conn.Open();
                    string query = "INSERT INTO Users (FullName, Email, [Password], Phone, Address) VALUES (@FullName, @Email, @Password, @Phone, @Address)";

                    using (OleDbCommand cmd = new OleDbCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);

                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Write("<script>alert('Registration successful!'); window.location='login.aspx';</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
    }
}
