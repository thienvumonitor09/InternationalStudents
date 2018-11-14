<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/internationalGlobal2subpage.master" CodeFile="iStudentReports.aspx.cs" Inherits="InternationalStudents_Standardized_ctcLinkReDo_iStudentReports" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link id="Link1" href="../../../App_Themes/GlobalEd/IntlStudents.css" rel="stylesheet"  type="text/css" />
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" Runat="Server">

<table width="100%">
    <tr>
        <td><h3>Student Application Report</h3></td>
        <td align="right" valign="top"><asp:Button ID="btnExport" runat="server" Text="Export all data" 
                onclick="btnExport_Click" /></td>
    </tr>
</table>
          <span style="color:#DD0000;"><asp:Literal ID="errMsg" runat="server"></asp:Literal></span><br />
          <asp:SqlDataSource ID="sqlStudents" runat="server"></asp:SqlDataSource>
          <asp:GridView ID="gridStudents" name="gridStudents" runat="server" 
        DataSourceID="sqlStudents" AutoGenerateColumns="False" 
        OnPageIndexChanging="gridStudents_PageIndexChanging" OnSorting="gridStudents_OnSorting" BorderStyle="None" 
        AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:BoundField HeaderText="" DataField="id" 
                    DataFormatString="<a href='iStudentReportAll.aspx?ID={0}'>View</a>" HtmlEncode="false" ItemStyle-VerticalAlign="Top" HeaderStyle-Width="3%" />
                <asp:BoundField HeaderText="Name" DataField="fullName" SortExpression="fullName" ItemStyle-VerticalAlign="top" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left"  />
                <asp:BoundField HeaderText="Citizen" DataField="countryOfCitizenship" SortExpression="countryOfCitizenship" ItemStyle-VerticalAlign="top" HeaderStyle-Width="15%" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField HeaderText="VISA type" DataField="visaType" SortExpression="visaType" ItemStyle-VerticalAlign="top" HeaderStyle-Width="7%"  HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField HeaderText="Begin" DataField="studiesBegin" SortExpression="studiesBegin" ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="top" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField HeaderText="Program" DataField="studyWhat" SortExpression="studyWhat" ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="top" HeaderStyle-Width="20%" HeaderStyle-HorizontalAlign="Left" />
                <asp:BoundField HeaderText="Major" DataField="studyMajor" SortExpression="studyMajor" ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="top" HeaderStyle-Width="25%" HeaderStyle-HorizontalAlign="Left" />
            </Columns>
        </asp:GridView>
            <br />
</asp:Content>


