<%@ Page Title="Customer's Policy" Language="C#" MasterPageFile="~/admin/AdminSidebar.master" AutoEventWireup="true" CodeBehind="AddCustomerToPolicy.aspx.cs" Inherits="InsuranceManagement.admin.AddCustomerToPolicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SidebarContent" runat="server">

    <main class="vh-100">
        

        <nav class="nav">
            <button type="button" 
                class="btn btn-primary " 
                data-toggle="modal" data-target="#centralModalSm">New Customer</button>
        </nav>

        <div class="tab-pane fade show active" id="donors" role="tabpanel" aria-labelledby="donors-tab">
            <div class="m-2">
                <table class="table table-borderless">

                    <thead class="bg-light">
                        <tr>
                            <th>Id</th>
                            <th>Policy</th>
                            <th>Customer</th>
                            <th>Agent</th>
                            <th>Sum Assured</th>
                            <th>Payment Period</th>
                            <th>Insurance Period</th>
                            <th>Premium Mode</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
        
                        <ItemTemplate>

                            <tbody>
                                <tr>
                                    <td><%#Eval("id") %></td>
                                    <td><%#Eval("policy_name") %></td>
                                    <td><%#Eval("cemail") %></td>
                                    <td><%#Eval("aemail") %></td>
                                    <td><%#Eval("sum") %></td>
                                    <td><%#Eval("payment_period") %></td>
                                    <td><%#Eval("insurance_period") %></td>
                                    <td><%#Eval("premium_mode") %></td>
                                    <td>
                                        <asp:Button runat="server" ID="DeleteCustomer" Text="Delete" CommandArgument='<%#Eval("id")%>' CommandName="deleteCustomer" OnClick="DeleteCustomer_Click" OnClientClick="javascript:return confirm('Are you sure to delete record?')" CssClass="btn btn-red btn-block p-1" />
                                    </td>
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
                    SelectCommand="SELECT c.email AS cemail, a.email AS aemail,* FROM custpolicy cp INNER JOIN policies p ON (p.id = cp.policy_id) INNER JOIN customers c ON (c.id = cp.customer_id) INNER JOIN agents a ON (a.id = cp.agent_id)"></asp:SqlDataSource>
            
            </div>
        </div>

        <div class="modal fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">

            <!-- Change class .modal-sm to change the size of the modal -->
            <div class="modal-dialog modal-lg" role="document">

                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title w-100" id="myModalLabel">Add Customer to Policy</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                
                    <div class="modal-body">

                        <div class="d-flex">

                            <div class="m-auto p-4">

                                <div>

                                    <div class="d-lg-flex">
                                        <div class="form-group col">

                                            <label for="ddlCustomerId">Customer</label>
                                            <asp:DropDownList ID="ddlCustomerId" runat="server" DataSourceID="SqlDataSource2" DataTextField="email" DataValueField="id" CssClass="form-control">
                                            </asp:DropDownList>

                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:insuranceConnectionString %>" SelectCommand="SELECT [id], [fname], [mname], [lname], [email] FROM [customers]"></asp:SqlDataSource>

                                        </div>

                                        <div class="form-group col">

                                            <label for="ddlPolicyID">Policy</label>
                                            <asp:DropDownList ID="ddlPolicyID" runat="server" DataSourceID="SqlDataSource1" DataTextField="policy_name" DataValueField="id" CssClass="form-control"></asp:DropDownList>

                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insuranceConnectionString %>" SelectCommand="SELECT [id], [policy_name] FROM [policies]"></asp:SqlDataSource>

                                        </div>
                                    </div>
                    
                                    <div class="d-lg-flex">

                                        <div class="form-group col">

                                            <label for="txtSumAssured">Sum Assured</label>
                                            <asp:TextBox ID="txtSumAssured" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Sum Assured." ControlToValidate="txtSumAssured"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Can only be Digits." ControlToValidate="txtSumAssured" ValidationExpression="^[0-9]+"></asp:RegularExpressionValidator>

                                        </div>

                                        <div class="form-group col">

                                            <label for="ddlPremiumMode">Premium Mode</label>
                                            <asp:DropDownList ID="ddlPremiumMode" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="M">Monthly</asp:ListItem>
                                                <asp:ListItem Value="Q">Quarterly</asp:ListItem>
                                                <asp:ListItem Value="S">Semi-Annual</asp:ListItem>
                                                <asp:ListItem Value="A">Annual</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>

                                    </div>

                                    <div class="d-lg-flex">

                                        <div class="form-group col">

                                            <label for="txtPaymentPeriod">Payment Period (In Months)</label>
                                            <asp:TextBox ID="txtPaymentPeriod" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Payment Period." ControlToValidate="txtPaymentPeriod"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Can only be Digits." ControlToValidate="txtPaymentPeriod" ValidationExpression="^[0-9]+"></asp:RegularExpressionValidator>

                                        </div>

                                        <div class="form-group col">

                                            <label for="txtInsurancePeriod">Insurance Period (In Months)</label>
                                            <asp:TextBox ID="txtInsurancePeriod" CssClass="form-control" runat="server" TextMode="SingleLine"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Insurance Period." ControlToValidate="txtInsurancePeriod"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Can only be Digits." ControlToValidate="txtInsurancePeriod" ValidationExpression="^[0-9]+"></asp:RegularExpressionValidator>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnAddCustomerToPolicy" runat="server" Text="Submit" OnClick="btnAddCustomerToPolicy_Click" CssClass="btn btn-primary"/>
                    </div>

                </div>

            </div>

        </div>

    </main>

</asp:Content>
