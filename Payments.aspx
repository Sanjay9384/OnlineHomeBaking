<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payments.aspx.cs" Inherits="OnlineHomeBaking.Payments" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>Payment Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            text-align: center;
            padding: 20px;
        }
        .container {
            width: 400px;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin: auto;
        }
        h2 {
            color: #333;
        }
        label {
            font-size: 16px;
            font-weight: bold;
        }
        .dropdown {
            width: 100%;
            padding: 8px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn {
            width: 100%;
            background: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .btn:hover {
            background: #218838;
        }
        .message {
            margin-top: 15px;
            font-size: 14px;
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Complete Your Payment</h2>

            <label for="ddlPaymentMethod">Select Payment Method:</label>
            <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="dropdown">
                <asp:ListItem Text="Credit Card" Value="CreditCard"></asp:ListItem>
                <asp:ListItem Text="Debit Card" Value="DebitCard"></asp:ListItem>
                <asp:ListItem Text="UPI" Value="UPI"></asp:ListItem>
                <asp:ListItem Text="Cash on Delivery" Value="COD"></asp:ListItem>
            </asp:DropDownList>

            <br /><br />
            <asp:Button ID="btnPay" runat="server" Text="Pay Now" CssClass="btn" OnClick="btnPay_Click" />

            <br /><br />
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>
    </form>
</body>
</html>
