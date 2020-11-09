<%@ Page Title="" Language="C#" MasterPageFile="~/agent/AgentSidebar.master" AutoEventWireup="true" CodeBehind="AddCustomerToPolicy.aspx.cs" Inherits="InsuranceManagement.agent.AddCustomerToPolicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SidebarContent" runat="server">

    <main class="vh-100">

        <div class="d-flex">

            <div class="m-auto card">

                <div>

                    <p class="h3-responsive">Add Customer To Policy</p>
                    <hr />

                    <div class="form-group m-2">

                        <label for="ddlCustomerId">Customer</label>
                        <asp:DropDownList ID="ddlCustomerId" runat="server" DataSourceID="SqlDataSource2" DataTextField="id" DataValueField="id"></asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:insuranceConnectionString %>" SelectCommand="SELECT [id], [policy_name] FROM [policies]"></asp:SqlDataSource>

                    </div>

                    <div class="form-group m-2">

                        <label for="ddlPolicyID">Policy</label>
                        <asp:DropDownList ID="ddlPolicyID" runat="server" DataSourceID="SqlDataSource1" DataTextField="id" DataValueField="id"></asp:DropDownList>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insuranceConnectionString %>" SelectCommand="SELECT [id], [fname], [mname], [lname], [email] FROM [customers]"></asp:SqlDataSource>

                    </div>
                    
                    <div>

                        <label for="txtSumAssured">Sum Assured</label>
                        <asp:TextBox ID="txtSumAssured" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Sum Assured." ControlToValidate="txtSumAssured"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Can only be Digits." ControlToValidate="txtSumAssured" ValidationExpression="^[0-9]$"></asp:RegularExpressionValidator>


                    </div>

                </div>

            </div>

        </div>

    </main>

</asp:Content>
