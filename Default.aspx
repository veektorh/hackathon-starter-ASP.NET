<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hackathon_starter_asp_webforms.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body container">
        <div class="alert alert-success" runat="server" visible="false" id="divLoginSuccess">
            Success! You're now logged in
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
        </div>
        <div class="alert alert-danger" runat="server" visible="false" id="divDeleteSuccess">
            Goodbye! Your account has been deleted
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
        </div>
        <div class="jumbotron">
            <div class="container">
                <h2>Hackathon Starter</h2>
                <h4>A boiler plate for asp.net applications</h4>
                <h5>Total number of users : <asp:Label Text="" ID="lblUsers" runat="server" /></h5>
            </div>
        </div>

        <div class="about col-md-12 col-lg-8">
            <h3>What this sample application demonstrates</h3>
            <hr />
            <p>
                This simple application demonstrates the following
            </p>
            <ul>
                <li>User Registration</li>
                <li>User Login , Authentication and Authorization</li>
                <li>Saving and Retrieving images for user profile</li>
                <li>Hashing of Password using ASP web security</li>
                <li>Sending Emails</li>
                <li>Use of Cookies and Querystring</li>
            </ul>
            
            <br />
            <asp:Button ID="btnRegister" Text="Register" CssClass="btn btn-success" runat="server" OnClick="btnRegister_Click" />
        </div>
    </div>
</asp:Content>
