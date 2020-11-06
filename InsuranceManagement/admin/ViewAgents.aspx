<%@ Page Title="Agents" Language="C#" MasterPageFile="~/admin/AdminSidebar.master" AutoEventWireup="true" CodeBehind="ViewAgents.aspx.cs" Inherits="InsuranceManagement.admin.ViewAgents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SidebarContent" runat="server">

    <main class="vh-100">

        <nav class="nav">
            <button type="button" 
                class="btn btn-primary " 
                data-toggle="modal" data-target="#centralModalSm">New Agent</button>
        </nav>

        <div class="tab-pane fade show active" id="donors" role="tabpanel" aria-labelledby="donors-tab">
            <div class="m-2">
                <table class="table table-borderless">

                    <thead class="bg-light">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Gender</th>
                            <th>Password</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        
                        <ItemTemplate>

                            <tbody>
                                <tr>
                                    <td><%#Eval("id") %></td>
                                    <td><%# String.Format("{0} {1} {2}",Eval("fname"), Eval("mname"), Eval("lname")) %></td>
                                    <td><%#Eval("email") %></td>
                                    <td><%#Eval("phone") %></td>
                                    <td><%#Eval("gender") %></td>
                                    <td><%#Eval("password") %></td>
                                    <td>
                                        <asp:Button runat="server" ID="DeleteUser" ValidationGroup="deleteUser" Text="Delete" CommandArgument='<%#Eval("id")%>' CommandName="deleteUser" OnClick="DeleteUser_Click" OnClientClick="javascript:return confirm('Are you sure to delete record?')" CssClass="btn btn-red btn-block p-1" />
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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insuranceConnectionString %>" SelectCommand="SELECT * FROM [agents]"></asp:SqlDataSource>
            
            </div>
        </div>

        <!-- MODAL -->

        <div class="modal fade" id="centralModalSm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">

            <!-- Change class .modal-sm to change the size of the modal -->
            <div class="modal-dialog modal-lg" role="document">

                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title w-100" id="myModalLabel">Add Agents</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                
                    <div class="modal-body">
                
                <div class="mx-auto" style="width:600px">

                    <div class="d-flex">
            
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

                    <div class="d-flex">
            
                        <div class="form-group col">
                    
                            <label for="txtGender">Gender</label>
                            <asp:DropDownList ID="txtGender" runat="server" CssClass="form-control">
                                <asp:ListItem>M</asp:ListItem>
                                <asp:ListItem>F</asp:ListItem>
                            </asp:DropDownList>
                
                        </div>

                        <div class="form-group col">
                    
                            <label for="txtMobNo">Mobile Number</label>
                            <asp:TextBox ID="txtMobNo" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                
                            <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMobNo" ErrorMessage="Please Enter Mobile Number"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtMobNo" ErrorMessage="Enter Valid 10 digit Mobile No." ValidationExpression="^[0-9]{10,10}$"></asp:RegularExpressionValidator>
                
                        </div>

                    </div>

                    <div class="d-flex">

                        <div class="form-group col">
                    
                        <label for="txtEmail">Email Id</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                
                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please enter Valid Email."></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="EmailIdValidator" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter Valid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                
                    </div>

                        <div class="form-group col">
                    
                            <label for="txtPincode">Pin Code</label>
                            <asp:TextBox ID="txtPincode" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                
                            <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPincode" ErrorMessage="Please Enter Pin Code"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtPincode" ErrorMessage="Enter Valid 6 digit Pin Code." ValidationExpression="^[0-9]{6,6}$"></asp:RegularExpressionValidator>
                
                        </div>

                    </div>

                    <div class="form-group m-2">
                
                        <label for="txtAddress">Residential Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control mb-4" ></asp:TextBox>
                
                        <asp:RegularExpressionValidator ForeColor="Red" Display="Dynamic" ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="Minimum 10 & Maximum 90 Characters" ValidationExpression="^[\sA-Za-z0-9,-.:/]{10,90}$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic"  ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please enter your valid residential address."></asp:RequiredFieldValidator>
                
                    </div>

                </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnAddAgent" runat="server" Text="Add"  CssClass="btn btn-primary" OnClick="btnAddAgent_Click"/>
                </div>

            </div>

        </div>

        </div>

    </main>

</asp:Content>
