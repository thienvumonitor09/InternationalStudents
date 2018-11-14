<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/internationalsubpage.master" CodeFile="xxinternationalReportSummary.aspx.cs" Inherits="InternationalStudents_Standardized_xxinternationalReportSummary" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link id="Link1" href="/_styles/IntlStudents.css" rel="stylesheet"  type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SubMenuHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" Runat="Server">
    <h1>Application Report Summary</h1>

    <table width="100%">
    <tr>
        <td><h3>Individual List</h3></td>
        <td align="right"><asp:Button ID="btnExport" runat="server" Text="Export all data" 
                onclick="btnExport_Click" /></td>
    </tr>
    </table>
          <span style="color:#DD0000;"><asp:Literal ID="errMsg" runat="server"></asp:Literal></span><br />
          <asp:SqlDataSource ID="sqlStudents" runat="server"></asp:SqlDataSource>
          <asp:GridView ID="gridStudents" runat="server" DataSourceID="sqlStudents" AutoGenerateColumns="False" BorderStyle="None" Width="100%">
            <Columns>
                <asp:BoundField HeaderText="" DataField="id" 
                    DataFormatString="<a href='internationalReportOne.aspx?ID={0}'>View</a>" HtmlEncode="false" ItemStyle-VerticalAlign="Top" HeaderStyle-Width="2%" />
                <asp:BoundField HeaderText="Name" DataField="fullName" SortExpression="fullName" ItemStyle-VerticalAlign="top" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left"  />
                <asp:BoundField HeaderText="Citizen" DataField="countryOfCitizenship" SortExpression="countryOfCitizenship" ItemStyle-VerticalAlign="top" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField HeaderText="VISA type" DataField="visaType" SortExpression="visaType" ItemStyle-VerticalAlign="top" HeaderStyle-Width="8%"  HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField HeaderText="Begin" DataField="studiesBegin" SortExpression="studiesBegin" ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="top" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField HeaderText="Program" DataField="studyWhat" SortExpression="studyWhat" ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="top" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField HeaderText="Major" DataField="studyMajor" SortExpression="studyMajor" ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="top" HeaderStyle-Width="35%" HeaderStyle-HorizontalAlign="Left" />
            </Columns>
        </asp:GridView>
            <br />
</asp:Content>
