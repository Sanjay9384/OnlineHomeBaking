<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineHomeBaking.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Online Home Baking</title>
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
        .nav .register-btn {
            background-color: white;
            color: #d2691e;
            padding: 8px 15px;
            border-radius: 5px;
            font-weight: bold;
        }
        .nav .register-btn:hover {
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
            text-align: center;
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

        #btnLogin{
            cursor : pointer;

        }
        #btnLogin:hover{
             background-color: #d2691e;
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
        <a href="Login.aspx" onclick="alert('Please register or login first');">Home</a>
        <a href="Login.aspx" onclick="alert('Please register or login first');">Products</a>
        <a href="Login.aspx" onclick="alert('Please register or login first');">About</a>
        <a href="Login.aspx" onclick="alert('Please register or login first');">Contact</a>
        <a href="Login.aspx" onclick="alert('Please register or login first');">🛒 Cart</a>
        <a href="Registeration.aspx" class="register-btn">Register</a>
    </div>

    <!-- Login Form -->
    <form id="loginForm" runat="server">
        <div class="container">
            <h2>Login</h2>

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

            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </div>
    </form>

    <!-- Footer -->
    <footer>
        <p>Copyrights © Sanjay</p>
    </footer>

</body>
</html>
