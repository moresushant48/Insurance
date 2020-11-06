<%@ Page Title="Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="InsuranceManagement.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <main class="">

       <div style="height:300px" class="w-100 py-3 bg-light">

           <div class="container">
               <h1 class="display-3">Hello, <asp:Label ID="lblName" runat="server"></asp:Label></h1>
           </div>

           <div class="container my-5">
               
               <div class="card">
                   <div class="card-header bg-white d-flex">
                       <p class="h2-responsive mr-auto">My Account</p>
                       <div class="ml-auto">
                           <a id="btnOpenPasswordDialog" class="btn btn-block btn-secondary"
                               data-toggle="modal" data-target="#centralModalSm">Change Password</a>
                           
                       </div>
                       
                   </div>

                   <div class="card-body">

                       <p class="text-secondary">USER INFORMATION</p>

                       <div class="d-flex py-3">

                           <div class="col-4 form-group">
                
                               <label for="txtFirstName">First Name</label>
                               <asp:TextBox ID="txtFirstName" runat="server" Enabled="false" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>
                
                           </div>

                           <div class="col-4 form-group">
                
                               <label for="txtMiddleName">Middle Name</label>
                               <asp:TextBox ID="txtMiddleName" runat="server" Enabled="false" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>
                
                           </div>

                           <div class="col-4 form-group">
                
                               <label for="txtLastName">Last Name</label>
                               <asp:TextBox ID="txtLastName" runat="server" Enabled="false" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>
                
                           </div>

                       </div>

                       <hr />

                       <p class="text-secondary">CONTACT INFORMATION</p>

                       <div class="d-flex py-3">

                           <div class="col-4 form-group">

                               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                   <ContentTemplate>
                                       <label for="txtEmail">Email Id</label>
                                       <asp:TextBox AutoPostBack="true" OnTextChanged="txtEmail_TextChanged" ID="txtEmail" runat="server" Enabled="true" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>

                                       <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Valid Email."></asp:RequiredFieldValidator>
                                       <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="EmailIdValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                   </ContentTemplate>
                               </asp:UpdatePanel>
                               

                           </div>

                           <div class="col-4 form-group">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                       <label for="txtPhone">Mobile Number</label>
                                       <asp:TextBox AutoPostBack="true" OnTextChanged="txtPhone_TextChanged" ID="txtPhone" runat="server" Enabled="true" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>
                
                                       <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please Enter Mobile Number"></asp:RequiredFieldValidator>
                                       <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtPhone" ErrorMessage="Enter Valid 10 digit Mobile No." ValidationExpression="^[0-9]{10,10}$"></asp:RegularExpressionValidator>
                                    </ContentTemplate>
                               </asp:UpdatePanel>
                           </div>

                           <div class="col-4 form-group">
                
                               <label for="txtGender">Gender</label>
                               <asp:TextBox ID="txtGender" runat="server" Enabled="false" CssClass="card form-control" TextMode="SingleLine"></asp:TextBox>
                
                           </div>

                       </div>

                       <div class="form-group m-3">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                                    <label for="txtAddress">Address</label>
                                    <asp:TextBox AutoPostBack="true" OnTextChanged="txtAddress_TextChanged" ID="txtAddress" runat="server" Enabled="true" CssClass="card form-control" TextMode="MultiLine"></asp:TextBox>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                       </div>

                   </div>
               </div>

           </div>

       </div>

        <!-- MODAL -->

        <div class="modal fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">

            <!-- Change class .modal-sm to change the size of the modal -->
            <div class="modal-dialog modal-sm" role="document">

                <div class="modal-content">
                    
                    <div class="modal-header">
                        <h4 class="modal-title w-100" id="myModalLabel">Reset Password</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                
                    <div class="modal-body">
                
                        <div class="form-group">

                            <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Always">
                                <ContentTemplate>

                                    <div class="form-group m-2">
                    
                                        <label for="txtPrevPassword">Current Password</label>
                                        <asp:TextBox ID="txtPrevPassword" runat="server" CssClass="form-control" TextMode="Password"
                                            AutoPostBack="false"
                                            ValidationGroup="checkCodeAndPass"
                                            ></asp:TextBox>
                
                                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrevPassword" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrevPassword" ErrorMessage="Minimum 6 - Maximum 15 Alphanumeric." ValidationExpression="^[A-Za-z0-9]{6,15}$"></asp:RegularExpressionValidator>
                
                                    </div>

                                    <div class="form-group m-2">

                                        <label for="txtChangedPassword">New Password</label>
                                        <asp:TextBox ID="txtChangedPassword" runat="server" CssClass="form-control" TextMode="Password"
                                            AutoPostBack="false"
                                            ValidationGroup="checkCodeAndPass"></asp:TextBox>
                
                                        <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtChangedPassword" ErrorMessage="Minimum 6 - Maximum 15 Alphanumeric." ValidationExpression="^[A-Za-z0-9]{6,15}$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtChangedPassword" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                
                                    </div>

                                </ContentTemplate>
                               
                            </asp:UpdatePanel>

                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnChangePassword" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnChangePassword_Click"
                            ValidationGroup="checkCodeAndPass" />
                    </div>

                </div>
            </div>

        </div>

    </main>

</asp:Content>
