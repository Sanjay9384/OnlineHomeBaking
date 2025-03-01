<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OnlineHomeBaking.Home" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Online Home Baking System</title>
    <link rel="stylesheet" type="text/css" href="HomeCartStyle.css" />
</head>
<body>
    <!-- Header -->
    <header>
        <h2>Sanjay's Home Baking</h2>
        <nav>
            <a href="Home.aspx">Home</a>
            <a href="Home.aspx#products">Products</a>
            <a href="Contact.aspx">Contact Us</a>
            <a href="Cart.aspx">Cart</a>
            <a href="Login.aspx">Login</a>
        </nav>
    </header>
    <form id="form1" runat="server">
    <!-- Discounted Products Section -->
    <section class="discount-products">
        <h2>Discounted Products</h2>
        <asp:Repeater ID="rptDiscountProducts" runat="server">
            <ItemTemplate>
                <div class="product">
                    <img src='<%# Eval("ImagePath") %>' alt="Product Image" />
                    <h3><%# Eval("ProductName") %></h3>
                    <p>₹<%# Eval("DiscountedPrice") %></p>
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("ProductID") %>' OnClick="AddToCart_Click" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </section>

    <!-- All Products Section -->
    <section id="products">
        <h2>Our Products</h2>
        <asp:Repeater ID="rptProducts" runat="server">
            <ItemTemplate>
                <div class="product">
                    <img src='<%# Eval("ImagePath") %>' alt="Product Image" />
                    <h3><%# Eval("ProductName") %></h3>
                    <p>₹<%# Eval("Price") %></p>
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CommandArgument='<%# Eval("ProductID") %>' OnClick="AddToCart_Click" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </section>
        </form>

    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Sanjay. All Rights Reserved.</p>
    </footer>
</body>
</html>
