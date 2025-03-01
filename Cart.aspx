<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="OnlineHomeBaking.Cart" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shopping Cart - Online Home Baking System</title>
    <link rel="stylesheet" type="text/css" href="HomeCartStyle.css" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header>
            <h2>Online Home Baking</h2>
            <nav>
                <a href="Home.aspx">Home</a>
                <a href="Home.aspx#products">Products</a>
                <a href="Contact.aspx">Contact Us</a>
                <a href="Cart.aspx">Cart</a>
                <a href="Login.aspx">Login</a>
            </nav>
        </header>

        <!-- Cart Section -->
        <section class="cart">
            <h2>Your Shopping Cart</h2>
            <asp:Repeater ID="rptCart" runat="server">
                <ItemTemplate>
                    <div class="cart-item">
                        <img src='<%# Eval("ProductImage") %>' alt="Product Image" />
                        <h3><%# Eval("ProductName") %></h3>
                        <p>Price: ₹<%# Eval("Price") %></p>
                        <p>Quantity: <%# Eval("Quantity") %></p>
                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandArgument='<%# Eval("CartID") %>' OnClick="RemoveFromCart_Click" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <!-- Total Price -->
            <div class="total-section">
                <h3>Total Amount: ₹<asp:Label ID="lblTotalAmount" runat="server" Text="0"></asp:Label></h3>
                <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" OnClick="Checkout_Click" />
            </div>
        </section>
    </form>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Sanjay. All Rights Reserved.</p>
    </footer>
</body>
</html>
