<%@ Page Title="Policies" Language="C#" MasterPageFile="~/admin/AdminSidebar.master" AutoEventWireup="true" CodeBehind="ViewPolicies.aspx.cs" Inherits="InsuranceManagement.admin.ViewPolicies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SidebarContent" runat="server">

    <main class="vh-100">

        <nav class="nav">
            <button type="button" 
                class="btn btn-primary " 
                data-toggle="modal" data-target="#centralModalSm">New Policy</button>
        </nav>

        
        <div class="m-2">
                <table class="table table-borderless">

                    <thead class="bg-light">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Extra</th>
                            <th class="text-center">Actions</th>
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
                                    <td class="text-center">
                                        <asp:Button runat="server" ID="DeletePolicy" Text="Delete" CommandArgument='<%#Eval("id")%>' CommandName="deletePolicy" OnClick="DeletePolicy_Click" OnClientClick="javascript:return confirm('Are you sure to delete record?')" CssClass="btn btn-red btn-block p-1" />
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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insuranceConnectionString %>" SelectCommand="SELECT * FROM [policies]"></asp:SqlDataSource>
            
            </div>
        

        <!-- MODAL -->

        <div class="modal fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">

            <!-- Change class .modal-sm to change the size of the modal -->
            <div class="modal-dialog modal-lg" role="document">

                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title w-100" id="myModalLabel">Add Policy</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                
                    <div class="modal-body">
                
                        <div class="mx-auto" style="width:600px">

                            <div class="form-group">
                
                                <label for="txtPolicyName">Policy Name</label>
                                <asp:TextBox ID="txtPolicyName" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                
                                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPolicyName" ErrorMessage="Only 50 Characters allowed." ValidationExpression="^[A-Za-z0-9\s*]{1,50}$"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPolicyName" ErrorMessage="Please Enter Policy Name"></asp:RequiredFieldValidator>
                
                            </div>

                            <div class="form-group">
                
                                <label for="txtPolicyDesc">Policy Description</label>
                                <asp:TextBox ID="txtPolicyDesc" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control mb-4" ></asp:TextBox>
                
                                <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtPolicyDesc" ErrorMessage="Minimum 10 & Maximum 500 Characters" ValidationExpression="^{10,500}$"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPolicyDesc" ErrorMessage="Please enter your Policy Description."></asp:RequiredFieldValidator>
                
                            </div>
                        </div>
                    </div>
                

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnAddPolicy" runat="server" Text="Add"  CssClass="btn btn-primary" OnClick="btnAddPolicy_Click"/>
                </div>

            </div>

        </div>


    </main>

</asp:Content>
