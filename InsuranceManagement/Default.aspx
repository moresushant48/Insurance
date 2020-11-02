<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="InsuranceManagement._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-center" style="
            height:600px;
            background-image: url('images/main.jpg');
            background-repeat: no-repeat;
            background-size:cover;
            ">
        <div class="overlay text-white d-flex">
            <div class="m-auto">
                <h1 class="text-monospace">Want to get an Insurance ?</h1>
                    
                <blockquote class="text-center">
                    <p class="lead">
                        Talk to our agents, <br /> get yourself secured with your favourite policy.
                    </p>
                </blockquote>

                <i class="fa fa-quote-right my-4"></i>
                <br />

                <a href="/SignUp" class="btn animated pulse slower infinite border border-light text-white">Register</a>

            </div>
        </div>
    </div>

</asp:Content>
