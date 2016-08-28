<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="account.aspx.cs" Inherits="hackathon_starter_asp_webforms.account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        body {
            background: whitesmoke;
        }

        .body {
            background: white;
            width: 70%;
            padding: 25px;
        }

        .inline {
            display: inline-block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="alert alert-danger" runat="server" visible="false" id="divUserError">
            Error! User not found
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
        </div>
        <div class="alert alert-danger" runat="server" visible="false" id="divPageError">
            HTTP Error 404.0 - Page Not Found
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
        </div>
        <div runat="server" id="Profilebody" class="body center-block">
            <h3>Profile</h3>
            <hr />
            <div class="row">
                <div class="col-sm-5 profileImage">
                    <asp:Image ID="Image1" CssClass="" Height="130px" Width="120px" ImageUrl="~/images/favicon.png" runat="server" />
                </div>
                <div class="col-sm-7">
                    <div class="row">
                        <div class="inline">
                            <label>Username : </label>
                        </div>
                        <div class="inline">
                            <asp:Label ID="lblUsername" Text="text" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="inline">
                            <label>Fullname : </label>
                        </div>
                        <div class="inline">
                            <asp:Label ID="lblFullname" Text="text" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="inline">
                            <label>Gender : </label>
                        </div>
                        <div class="inline">
                            <asp:Label ID="lblGender" Text="text" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="inline">
                            <label>Location : </label>
                        </div>
                        <div class="inline">
                            <asp:Label ID="lblLocation" Text="text" runat="server" />
                        </div>
                    </div>

                </div>
            </div>
            <br />
            <asp:Button Text="Update Profile" ID="btnUpdateProfile" CssClass="btn btn-danger" runat="server" OnClick="btnUpdateProfile_Click" />
        </div>
    </div>
</asp:Content>
