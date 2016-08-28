<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="editProfile.aspx.cs" Inherits="hackathon_starter_asp_webforms.editProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="external.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <h3>Edit Profile</h3>
            <hr />
            <div class="alert alert-success" runat="server" visible="false" id="divProfileSuccess">
                        Success! Your Profile has been updated
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
                    </div>
                    <div class="alert alert-danger" runat="server" visible="false" id="divProfileError">
                        Error! Could not update profile
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
                    </div>
            <div class="alert alert-danger" runat="server" visible="false" id="divPasswordError">
                        The Password you entered is incorrect
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
                    </div>
                    <div class="alert alert-danger" runat="server" visible="false" id="divPasswordError2">
                        Error! please try again
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
                    </div>
                    <div class="alert alert-success" runat="server" visible="false" id="divPasswordSuccess">
                        Success! Password has been changed 
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times; </a>
                    </div>
            <div class="row">
                <div class="col-md-10">
                    <div class="row Profileinfo">
                        <div class="col-md-3">
                            <label>Username : </label>
                        </div>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtUsername" />
                        </div>
                    </div>
                    <div class="row Profileinfo">
                        <div class="col-md-3">
                            <label>Fullname : </label>
                        </div>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtFullname" />
                        </div>
                    </div>
                    <div class="row Profileinfo">
                        <div class="col-md-3">
                            <label>Gender : </label>
                        </div>
                        <div class="col-md-9">
                             <asp:TextBox runat="server" CssClass="form-control" ID="txtGender" />
                        </div>
                    </div>
                    <div class="row Profileinfo">
                        <div class="col-md-3">
                            <label>Location : </label>
                        </div>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtLocation" />
                        </div>
                    </div>
                    <div class="row Profileinfo">
                        <div class="col-md-3">
                            <label>Change Profile Picture :</label>
                        </div>
                        <div class="col-md-9">
                            <asp:FileUpload runat="server" ID="fileUpload1" accept=".jpg,.png"/>
                        </div>
                    </div>
                    <br />
                    <div class="row Profileinfo">
                        <div class=" col-md-offset-3 col-md-9">
                            <asp:Button Text="Save" ID="btnProfileSave" runat="server" CssClass="btn btn-primary" OnClick="btnProfileSave_Click" />
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-10">
                    <h3>Change Password </h3>
                    <hr />
                    <div class="row Profileinfo">
                        <div class="col-md-3">
                            <label>Old Password :</label>
                        </div>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtOldPassword" />
                            <asp:RequiredFieldValidator ValidationGroup="grp" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword" ErrorMessage="required" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row Profileinfo">
                        <div class="col-md-3">
                            <label>New Password :</label>
                        </div>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtNewPassword" />
                            <asp:RequiredFieldValidator ValidationGroup="grp" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="required" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row Profileinfo">
                        <div class="col-md-3">
                            <label>Confirm New Password : </label>
                        </div>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="txtConfirmPassword" />
                            <asp:RequiredFieldValidator ValidationGroup="grp" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="required" ForeColor="red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ValidationGroup="grp" ID="CompareValidator1" runat="server" ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword" Operator="Equal" Type="String" ErrorMessage="passwords do not match" ForeColor="red"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="row Profileinfo">
                        <div class=" col-md-offset-3 col-md-9">
                            <asp:Button Text="Save" ValidationGroup="grp" ID="btnPasswordSave" runat="server" CssClass="btn  btn-primary" OnClick="btnPasswordSave_Click" />
                        </div>
                    </div>
                    
                </div>
            </div>

            <div class="row">
                <div class="col-md-10">
                    <hr />
                    <h3>Delete Account</h3>
                    <hr />
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <p>You can delete this account but bear in mind that this action is irreversible</p>
                            <asp:Button Text="Delete my account" ID="btnDelete" CssClass="btn btn-danger" runat="server" OnClick="btnDelete_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
