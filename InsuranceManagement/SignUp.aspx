<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="InsuranceManagement.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    
    <div class="card w-25 m-auto p-4">
        <div class="text-center">
            <p class="h2-responsive">Register</p>
        </div>

        <hr />

        <div class="d-lg-flex">

            <div class="form-group m-2">
                
                <label for="txtFirstName">First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Only Characters allowed." ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please Enter First Name"></asp:RequiredFieldValidator>
                
            </div>
            
            <div class="form-group m-2">
                
                <label for="txtMiddleName">Middle Name</label>
                <asp:TextBox ID="txtMiddleName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMiddleName" ErrorMessage="Only Characters allowed." ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMiddleName" ErrorMessage="Please Enter Middle Name"></asp:RequiredFieldValidator>
                
            </div>
            
            <div class="form-group m-2">
                    
                <label for="txtLastName">Last Name</label>
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                
                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="Only Characters allowed." ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please Enter Last Name"></asp:RequiredFieldValidator>
                
            </div>

        </div>

        <div class="form-group m-2">
            <label for="txtEmail">Email Id</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"
                ValidationGroup="loginGroup"></asp:TextBox>
                
            <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Valid Email."></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="EmailIdValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>

        <div class="form-group m-2">

            <label for="txtPassword">Password</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"
                ValidationGroup="loginGroup"></asp:TextBox>
                
            <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="Minimum 6 - Maximum 15 Alphanumeric." ValidationExpression="^[A-Za-z0-9]{6,15}$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>
                
        </div>

        <div class="text-left m-2">
            <small>
                <p class="text-primary">Forgot Password ?</p>
            </small>
        </div>

        <div class="text-center">

            <small>
                <asp:Label ID="lblSuccess" runat="server" CssClass="text-success"></asp:Label>
                <asp:Label ID="lblFailure" runat="server" CssClass="text-danger"></asp:Label>
            </small>

        </div>

        <div class="text-center">

            <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Submit" />

        </div>

    </div>

</asp:Content>
