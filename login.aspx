<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="hackathon_starter_asp_webforms.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="external.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body center-block ">
        <div class="body_items">
            <h1 class="text-center"> Log in  </h1>
            <asp:TextBox runat="server" placeholder="Username" ID="txtUsername" CssClass="form-control"/>      
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtUsername" ForeColor="red" ValidationGroup="login" runat="server" ErrorMessage="required"></asp:RequiredFieldValidator>
            <asp:TextBox runat="server" placeholder="Password" TextMode="Password" ID="txtPassword" CssClass="form-control"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" ForeColor="red" ValidationGroup="login" runat="server" ErrorMessage="required"></asp:RequiredFieldValidator>

            <asp:Button Text="Login" ID="btnLogin" ValidationGroup="login" CssClass="btn btn-success form-control" runat="server" OnClick="btnLogin_Click" />
            <div class="alert alert-danger" runat="server" visible="false" id="divLoginError">
                Error! Login failed, try again
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
                </div>

            <div class="alert alert-danger" runat="server" visible="false" id="divIncorrectError">
                Incorrect username or password, try again
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
                </div>
            <p class="text-center"> Don't have an account yet? <a href="register.aspx">Sign up</a> </p>
        </div>
        

    </div>
</asp:Content>
