<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewMyPolicy.aspx.cs" Inherits="InsuranceManagement.ViewMyPolicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainHeader" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="card m-auto p-4">

        <div class="d-flex">

            <div class="col"> 

                <div class="form-group m-2">
                    <label for="txtEmail">Email Id</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"
                        ValidationGroup="SendMailGroup"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Valid Email."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="EmailIdValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>

                <div class="text-center">

                    <small>
                        <asp:Label ID="lblSuccess" runat="server" CssClass="text-success"></asp:Label>
                    </small>

                </div>

                <div class="text-right">

                    <asp:Button ID="btnSendMail" ValidationGroup="SendMailGroup" runat="server" CssClass="btn btn-primary" Text="Send OTP" OnClick="btnSendMail_Click"/>

                </div>

            </div>

            <div class="col">

                <div class="form-group m-2">
                    
                    <label for="txtSecurityCode">Security Code</label>
                    <asp:TextBox ID="txtSecurityCode" runat="server" CssClass="form-control" TextMode="SingleLine"
                        AutoPostBack="false"
                        ValidationGroup="checkCodeAndPass"
                        ></asp:TextBox>
                
                    <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSecurityCode" ErrorMessage="Please enter Valid Security Code."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtSecurityCode" ErrorMessage="Enter Valid 6-digit Security Code." ValidationExpression="^[0-9]{6,6}$"></asp:RegularExpressionValidator>
                
                    <div class="text-center">
                        <small>
                            <asp:Label ID="lblInvalidCode" runat="server" CssClass="text-center text-danger"></asp:Label>
                        </small>
                    </div>

                </div>

                <div class="text-right">
                
                    <asp:Button ID="btnVerifyOtp" runat="server" CssClass="btn btn-primary" Text="Submit"
                                    ValidationGroup="checkCodeAndPass"
                                    OnClick="btnVerifyOtp_Click" />

                </div>

            </div>

        </div>

    </div>

    <div class="m-2">
        <table class="table table-borderless">

            <thead class="bg-light">
                <tr>
                    <th>Policy</th>
                    <th>Customer</th>
                    <th>Agent</th>
                    <th>Sum Assured</th>
                    <th>Payment Period</th>
                    <th>Insurance Period</th>
                    <th>Premium Mode</th>
                </tr>
            </thead>

            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
        
                <ItemTemplate>

                    <tbody>
                        <tr>
                            <td><%#Eval("policy_name") %></td>
                            <td><%#Eval("cemail") %></td>
                            <td><%#Eval("aemail") %></td>
                            <td><%#Eval("sum") %></td>
                            <td><%#Eval("payment_period") %></td>
                            <td><%#Eval("insurance_period") %></td>
                            <td><%#Eval("premium_mode") %></td>
                        </tr>
                    </tbody>
            
                </ItemTemplate>

                <EmptyDataTemplate>
                    <h2 class="text-info">No data found.</h2>
                </EmptyDataTemplate>

            </asp:ListView>
    
        </table>

        <asp:DataPager ID="DataPager1" PagedControlID="ListView1" PageSize="5" runat="server">
            <Fields>
                <asp:NumericPagerField CurrentPageLabelCssClass="border border-primary p-2 mx-2"/>
            </Fields>
        </asp:DataPager>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ 
            ConnectionStrings:insuranceConnectionString %>" 
            SelectCommand="SELECT c.email AS cemail, a.email AS aemail,* FROM custpolicy cp INNER JOIN policies p ON (p.id = cp.policy_id) INNER JOIN customers c ON (c.id = cp.customer_id) INNER JOIN agents a ON (a.id = cp.agent_id) WHERE customer_id = (SELECT id FROM customers WHERE email = @email)">

            <SelectParameters>
                <asp:Parameter DefaultValue="" Name="email"/>
            </SelectParameters>

        </asp:SqlDataSource>
            
    </div>

</asp:Content>
