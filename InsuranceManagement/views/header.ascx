<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="InsuranceManagement.views.header" %>

<li id="liHome" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/">Home</a></li>
<li id="liSignin" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/SignIn">Login</a></li>
<li id="liDashboard" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/admin/AdminDashboard">Admin</a></li>
<li id="liAgentDashboard" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/agent/AgentDashboard">Dashboard</a></li>
<li id="liAccount" runat="server" class="nav-item m-auto"><a class="nav-link" runat="server" href="~/Account">Account</a></li>

<!-- Logout -->
<li class="nav-item"><asp:Button ID="btnLogout" ValidationGroup="logout" runat="server" Text="Logout" CssClass="btn btn-dark nav-link" OnClick="btnLogout_Click" /></li>