<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/admin/AdminSidebar.master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="InsuranceManagement.admin.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">
    
    <main class="vh-100">
        <br />

        <div class="d-md-flex">

            <div class="col card m-2">
                <div class="d-flex">
                    <div class="col d-flex">
                        <i class="fa fa-user-shield text-secondary fa-3x m-auto"></i>
                    </div>
                    
                    <div class="col d-flex">
                        <asp:GridView ID="GridView1" runat="server" CssClass="m-auto" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="agents" HeaderStyle-CssClass="border border-white lead p-4 text-secondary" HeaderText="Total Agents" ItemStyle-CssClass="border border-white text-center h3-responsive p-4" ReadOnly="True" SortExpression="agents" />
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insuranceConnectionString %>" SelectCommand="SELECT COUNT(id) AS agents FROM agents"></asp:SqlDataSource>
                    </div>
                </div>
            </div>

            <div class="col card m-2">
                <div class="d-flex">
                    <div class="col d-flex">
                        <i class="fa fa-user-alt text-secondary fa-3x m-auto"></i>
                    </div>
                    
                    <div class="col d-flex">
                        <asp:GridView ID="GridView2" runat="server" CssClass="m-auto" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="customers" HeaderStyle-CssClass="border border-white lead p-4 text-secondary" HeaderText="Total Customers" ItemStyle-CssClass="border border-white text-center h3-responsive p-4" ReadOnly="True" SortExpression="customers" />
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:insuranceConnectionString %>" SelectCommand="SELECT COUNT(id) AS customers FROM customers"></asp:SqlDataSource>
                        </div>
                    </div>
            </div>

        </div>

    </main>

</asp:Content>
