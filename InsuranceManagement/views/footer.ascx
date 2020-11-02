<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="InsuranceManagement.views.footer" %>

<div class="container py-4 d-flex">
    <div class="col-8">
        <p class="h1-responsive"> Mail Us </p>
        <hr />
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">

            <ContentTemplate>

                <div class="w-75">
                    <asp:TextBox ID="txtName" runat="server" placeholder="Name" 
                        CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please enter your name."
                        ValidationGroup="emailForm" 
                        ControlToValidate="txtName" CssClass="text-danger"
                        ></asp:RequiredFieldValidator>
            
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email ID" 
                        ValidationGroup="emailForm"
                        CssClass="form-control" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage="Please enter your Email Id."
                        ValidationGroup="emailForm" 
                        ControlToValidate="txtEmail" CssClass="text-danger"
                        ></asp:RequiredFieldValidator>
            
                    <asp:TextBox ID="txtMessage" runat="server" placeholder="Message" 
                        ValidationGroup="emailForm" 
                        CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Please enter your Query Message."
                        ValidationGroup="emailForm" 
                        ControlToValidate="txtMessage" CssClass="text-danger"
                        ></asp:RequiredFieldValidator>

                    <div class="text-center">
                        <small>
                            <asp:Label ID="lblMailSuccess" runat="server" CssClass="text-success"></asp:Label>
                        </small>
                    </div>

                    <div>
                        <asp:Button ID="btnSend" runat="server" Text="Submit"
                            ValidationGroup="emailForm"
                            CssClass="btn border border-dark text-dark ml-auto" OnClick="btnSend_Click"/>
                    </div>
                </div>

            </ContentTemplate>

        </asp:UpdatePanel>

    </div>

    <div class="col-4">

        <p class="h1-responsive"> Social Handles </p>
        <hr />
        <p class="h5-responsive">Make sure to follow us on social media.</p>
        
        <br />
        <div class="d-flex mt-3 text-leftn">
            <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook text-primary fa-3x col-4"></i></a>
            <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram text-secondary fa-3x col-4"></i></a>
            <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter text-primary fa-3x col-4"></i></a>
        </div>

        <br />
        <h5>aartikharat@gmail.com</h5>
        <h5>+91 869 1940090</h5>

    </div>

</div>

<div class="d-flex bg-dark text-white py-2">
    <p class="m-auto">&copy; Aarti Kharat - All Rights Reserved <%: DateTime.Now.Year %> </p>
</div>