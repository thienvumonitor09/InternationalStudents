<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HMccs.master" CodeFile="applicationConfirmation.aspx.cs" Inherits="InternationalStudents_Standardized_applicationConfirmation" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" Runat="Server"></asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" Runat="Server">
    <% var siteName = Request.QueryString["site"].ToUpper(); %>
    <section class="two-column">
    <div class="container">
        <div class="row">
            <section class="col-xs-12">
                <ol class="breadcrumb">
                    <% if(siteName=="SCC") { %>
                    <a href="http://sccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student" class="CMSBreadCrumbsLink">International Student</a> 
                    <% } else if(siteName=="SFCC") { %>
                     <a href="http://sfccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student" class="CMSBreadCrumbsLink">International Student</a>
                    <% } else { %>
                     <a href="http://sharedbeta.spokane.edu/Become-a-Student/I-am-an-International-Student" class="CMSBreadCrumbsLink">International Student</a>
                    <% } %>&nbsp;>&nbsp;
                    <% if(siteName=="SCC") { %>
                    <a href="http://sccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start" class="CMSBreadCrumbsLink">How Do I Start?</a>
                    <% } else if(siteName=="SFCC") { %>
                     <a href="http://sfccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start" class="CMSBreadCrumbsLink">How Do I Start?</a>
                    <% } else { %>
                    <a href="http://sharedbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start" class="CMSBreadCrumbsLink">How Do I Start?</a>
                    <% } %>
                    &nbsp;>&nbsp;
                    <span class="CMSBreadCrumbsCurrentItem">Application Form</span>
                </ol>
                <div class="page-title interior"><h1>International Student Application Form</h1></div>
            </section>
            <section class="left-nav-main col-xs-12 col-sm-8 col-sm-push-4 col-md-9 col-md-push-3">
                <section class="white-bg">
                    <div class="container">
                        <div class="content-block">  
                            <center><h1><b>SUCCESS!</b></h1>
                                <img src="../../App_Themes/images/MasterAssets/Skitch.png" alt="success" />
                                <p><h3>Thank you, Your application form has been successfully submitted.</h3></p>
                            </center>
                                </div>
                        </div>
                    </section>
                </section>
                <section class="col-xs-12 col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
                <div class="left-nav">
                    <h2><a href="http://sharedbeta.spokane.edu/Become-a-Student/I-am-an-International-Student">International</a></h2>
                    <ul>
                        <% if(siteName=="SCC") { %>
                        <li><a href="http://sccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start">How Do I Start?</a></li>
                        <% } else if(siteName=="SFCC") { %> 
                        <li><a href="http://sfccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start">How Do I Start?</a></li>
                        <% } else { %>
                        <li><a href="http://sharedbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start">How Do I Start?</a></li>
                        <% } %>
                        <% if(siteName=="SCC") { %>
                        <li><a href="http://sccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/Discover-Spokane">Discover Spokane</a></li>
                        <% } else if(siteName=="SFCC") { %>
                        <li><a href="http://sfccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/Discover-Spokane">Discover Spokane</a></li>
                        <% } else { %>
                        <li><a href="http://sharedbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/Discover-Spokane">Discover Spokane</a></li>
                        <% } %>
                        <% if(siteName=="SCC") { %>
                        <li><a href="http://sccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/Contact-Us">Contact Us</a></li>
                         <% } else if(siteName=="SFCC") { %> 
                        <li><a href="http://sfccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/Contact-Us">Contact Us</a></li>
                        <% } else { %>
                        <li><a href="http://sharedbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/Contact-Us">Contact Us</a></li>
                        <% } %>
                    </ul>
                </div>
            </section>
            </div>
         </div>
    </section>

    
    </asp:Content>
