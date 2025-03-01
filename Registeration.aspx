<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="OnlineHomeBaking.Registeration" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Online Home Baking</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f1e5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navigation Bar */
        .nav {
            background-color: #d2691e;
            padding: 15px 0;
            text-align: center;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            padding: 10px 15px;
            border-radius: 5px;
        }
        .nav a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        .nav .login-btn {
            background-color: white;
            color: #d2691e;
            padding: 8px 15px;
            border-radius: 5px;
            font-weight: bold;
        }
        .nav .login-btn:hover {
            background-color: #f5d1a4;
        }

        /* Main Container */
        .container {
            width: 400px;
            margin: 100px auto 20px; /* Adjusted to ensure it's below the fixed header */
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }
        h2 {
            color: #d2691e;
            margin-bottom: 20px;
        }

        /* Input Fields */
        input, button {
            width: 92%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        #btnRegister{
            cursor:pointer;
        }

        #btnRegister:hover{
            background-color: #d2691e;
        }

        button {
            background-color: #d2691e;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            padding: 10px;
        }
        button:hover {
            background-color: #a0522d;
        }

        /* Footer */
        footer {
            margin-top: auto;
            text-align: center;
            background-color: #333;
            color: white;
            padding: 10px;
            font-size: 14px;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        /* Validation Error Messages */
        .error-message {
            color: darkred;
            font-size: 14px;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <div class="nav">
        <a>🎂 Sanjay's Home Baking</a>
        <a href="Registeration.aspx" onclick="alert('Please register or login first');">Home</a>
        <a href="Registeration.aspx" onclick="alert('Please register or login first');">Products</a>
        <a href="Registeration.aspx" onclick="alert('Please register or login first');">About</a>
        <a href="Registeration.aspx" onclick="alert('Please register or login first');">Contact</a>
        <a href="Registeration.aspx" onclick="alert('Please register or login first');">🛒 Cart</a>
        <a href="login.aspx" class="login-btn">Login</a>
    </div>

    <!-- Registration Form -->
    <form id="registerForm" runat="server">
        <div class="container">
            <h2>Registration Form</h2>

            <!-- Full Name -->
            <asp:TextBox ID="txtFullName" runat="server" Placeholder="Full Name"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFullName"
                ErrorMessage="Full Name is required" ForeColor="DarkRed" CssClass="error-message"></asp:RequiredFieldValidator>
            <br />

            <!-- Email -->
            <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Email is required" ForeColor="DarkRed" CssClass="error-message"></asp:RequiredFieldValidator>
            <br />

            <!-- Password -->
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Placeholder="Password"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPassword"
                ErrorMessage="Password is required" ForeColor="DarkRed" CssClass="error-message"></asp:RequiredFieldValidator>
            <br />

            <!-- Phone -->
            <asp:TextBox ID="txtPhone" runat="server" Placeholder="Phone Number"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone"
                ErrorMessage="Phone Number is required" ForeColor="DarkRed" CssClass="error-message"></asp:RequiredFieldValidator>
            <br />

            <!-- Address -->
            <asp:TextBox ID="txtAddress" runat="server" Placeholder="Address"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAddress"
                ErrorMessage="Address is required" ForeColor="DarkRed" CssClass="error-message"></asp:RequiredFieldValidator>
            <br />

            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
        </div>
    </form>

    <!-- Footer -->
    <footer>
        <p>Copyrights © Sanjay</p>
    </footer>

</body>
</html>
