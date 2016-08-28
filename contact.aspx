<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="hackathon_starter_asp_webforms.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .margin{
            margin:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3>Say Hello</h3>
        <hr />
        <div class="row">

            <div class="row margin">
                <div class="col-md-2"> <label>Name :</label> </div>
                <div class="col-md-5"> <asp:TextBox runat="server" ID="txtName" CssClass="form-control" /> </div>
            </div>
            <div class="row margin">
                <div class="col-md-2"> <label>Email :</label> </div>
                <div class="col-md-5"> <asp:TextBox runat="server" ID="txtEmail" TextMode="Email" CssClass="form-control" /> </div>
            </div>
            <div class="row margin">
                <div class="col-md-2"> <label>Body :</label> </div>
                <div class="col-md-5"> <asp:Textbox Rows="5" runat="server" ID="txtBody" TextMode="MultiLine" CssClass="form-control" /> </div>
            </div>
            <div class="rows margin">
                <div class="col-md-offset-2 col-md-5">
                    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-primary" />
                </div>
            </div>

        </div>
    </div>
</asp:Content>
