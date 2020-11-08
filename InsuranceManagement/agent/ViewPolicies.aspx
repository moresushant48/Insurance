<%@ Page Title="" Language="C#" MasterPageFile="~/agent/AgentSidebar.master" AutoEventWireup="true" CodeBehind="ViewPolicies.aspx.cs" Inherits="InsuranceManagement.agent.ViewPolicies" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">

    <main class="vh-100">
        
        <div class="m-2">
            <table class="table table-borderless">

                <thead class="bg-light">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Extra</th>
                    </tr>
                </thead>

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        
                    <ItemTemplate>

                        <tbody>
                            <tr>
                                <td><%#Eval("id") %></td>
                                <td><%#Eval("policy_name") %></td>
                                <td>
                                    <a target="_blank" class="text-primary" href="/admin/ViewPolicyExtra?policyId=<%#Eval("id") %>">View</a>
                                </td>
                            </tr>
                        </tbody>
            
                    </ItemTemplate>

                </asp:ListView>
    
            </table>

            <asp:DataPager ID="DataPager1" PagedControlID="ListView1" PageSize="5" runat="server">
                <Fields>
                    <asp:NumericPagerField CurrentPageLabelCssClass="border border-primary p-2 mx-2"/>
                </Fields>
            </asp:DataPager>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insuranceConnectionString %>" SelectCommand="SELECT * FROM [policies]"></asp:SqlDataSource>
            
        </div>
        
    </main>

</asp:Content>
