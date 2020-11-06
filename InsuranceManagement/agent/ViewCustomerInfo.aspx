<%@ Page Title="" Language="C#" MasterPageFile="~/agent/AgentSidebar.master" AutoEventWireup="true" CodeBehind="ViewCustomerInfo.aspx.cs" Inherits="InsuranceManagement.agent.ViewCustomerInfo" %>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">

    <div class="d-flex vh-100">

        <div class="m-auto">

            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />

            </asp:DetailsView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insuranceConnectionString %>" 
                SelectCommand="SELECT * FROM [customers] WHERE id = @custId">
                <SelectParameters>
                    <asp:QueryStringParameter DbType="Int32" Name="custId" QueryStringField="custId"/>
                </SelectParameters>
            </asp:SqlDataSource>

        </div>

    </div>

</asp:Content>
