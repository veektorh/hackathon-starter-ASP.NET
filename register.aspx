<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="hackathon_starter_asp_webforms.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="external.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="body center-block ">
        <div class="body_items">
            <h1 class="text-center">Register  </h1>
            <div class="">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TextBox runat="server" placeholder="Username" ID="txtUsername" CssClass="form-control" AutoPostBack="True" OnTextChanged="txtUsername_TextChanged" />
                        <asp:Label runat="server" ID="lblUsernameExist" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtUsername" ValidationGroup="reg" runat="server" ErrorMessage="required" ForeColor="red"></asp:RequiredFieldValidator>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <div class="">
                <asp:TextBox runat="server" TextMode="Password" placeholder="Password" ID="txtPassword" CssClass=" form-control" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtPassword" ValidationGroup="reg" runat="server" ErrorMessage="required" ForeColor="red"></asp:RequiredFieldValidator>
            </div>

            <div class="">
                <asp:TextBox runat="server" TextMode="Password" placeholder="Confirm Password" ID="txtConfirmPassword" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtConfirmPassword" ValidationGroup="reg" runat="server" ErrorMessage="required" ForeColor="red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="both passwords must match"
                    ControlToCompare="txtPassword" ValidationGroup="reg" ForeColor="red" ControlToValidate="txtConfirmPassword" Operator="Equal" Type="String"></asp:CompareValidator>
            </div>

            <asp:Button Text="Register" ID="btnRegister" ValidationGroup="reg" CssClass="btn btn-success form-control" runat="server" OnClick="btnRegister_Click" />
            <div class="alert alert-success" runat="server" visible="false" id="divRegisterSuccess">
                Success! You're now a member. Proceed to <a href="login.aspx">login</a>
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
            </div>
            <div class="alert alert-danger" runat="server" visible="false" id="divRegisterError">
                Error! Registration failed, try again
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
            </div>
            <p class="text-center">Already have an account ? <a href="login.aspx">Log in</a> </p>
        </div>


    </div>
    <script>
        $(document).ready(function () {
        })
    </script>
</asp:Content>
