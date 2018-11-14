<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/internationalsubpage.master" CodeFile="xxinternationalReportOne.aspx.cs" Inherits="InternationalStudents_Standardized_xxinternationalReportOne" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link id="Link1" href="/_styles/IntlStudents.css" rel="stylesheet"  type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SubMenuHolder" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" Runat="Server">
    <h1>Application Report Detail</h1>
    <div id="eMsg" class="divError" runat="server"></div>
    <fieldset id="personalInfo" runat="server" visible="true">
    <h3>Basic Information</h3>
    <table width="100%" id="personalI" runat="server" class="position">
        <tr>
            <th align="left" colspan="2" style="width:50%;">Full name:  </th>
            <th align="left" style="width:25%;">DOB/age:  </th>
            <th align="left" style="width:25%;">Gender:  </th>
        </tr>
        <tr>
            <td colspan="2" style="width:50%;"><asp:Label ID="lblFullname" runat="server"></asp:Label></td>
            <td style="width:25%;"><asp:Label ID="lblDOB" runat="server"></asp:Label></td>
            <td style="width:25%;"><asp:Label ID="lblGender" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <th colspan="2" align="left" style="width:50%;">Country of birth:</th>
            <th colspan="2" align="left" style="width:50%;">Country of citizenship:</th>
        </tr>
        <tr>
            <td colspan="2" style="width:50%;"><asp:Label ID="lblCountryBirth" runat="server"></asp:Label></td>
            <td colspan="2" style="width:50%;"><asp:Label ID="lblCountryCitizen" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <th align="left" style="width:25%;">Native language:</th>
            <th align="left" style="width:25%;">English ability:</th>
            <th align="left" style="width:25%;">Live in US?</th>
            <th align="left" style="width:25%;">&nbsp;</th>
        </tr>
        <tr>
            <td style="width:25%;"><asp:Label ID="lblLanguage" runat="server"></asp:Label></td>
            <td style="width:25%;"><asp:Label ID="lblEnglish" runat="server"></asp:Label></td>
            <td style="width:25%;"><asp:Label ID="lblInUS" runat="server"></asp:Label></td>
            <td style="width:25%;"></td>
        </tr>
        <tr>
            <th align="left" style="width:25%;">VISA type:</th>
            <th align="left" style="width:25%;">Dependents:</th>
            <th align="left" style="width:25%;">Spouse:</th>
            <th align="left" style="width:25%;">Children:</th>
        </tr>
        <tr>
            <td style="width:25%;"><asp:Label ID="lblVISA" runat="server"></asp:Label></td>
            <td style="width:25%;"><asp:Label ID="lblNumDependents" runat="server" Text="Label"></asp:Label></td>
            <td style="width:25%;"><asp:Label ID="lblSpouse" runat="server" Text="Label"></asp:Label></td>
            <td style="width:25%;"><asp:Label ID="lblKids" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <th align="left" colspan="2" style="width:50%;">Medical conditions:</th>
            <th align="left" colspan="2" style="width:50%;">Special accommodations:</th>
        </tr>
        <tr>
            <td colspan="2" style="width:50%;"><asp:Label ID="lblMedical" runat="server"></asp:Label></td>
            <td colspan="2" style="width:50%;"><asp:Label ID="lblSpecial" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <th align="left" colspan="2" style="width:50%;">Insurance information:</th>
            <th align="left" colspan="2" style="width:50%;">Release of Information:</th>
        </tr>
        <tr>
            <td colspan="2" style="width:50%;"><asp:Label ID="lblInsurance" runat="server"></asp:Label></td>
            <td colspan="2" style="width:50%;"><asp:Label ID="lblRelease" runat="server"></asp:Label></td>
        </tr>
    </table>
    </fieldset>
    <fieldset id="additionalInfo" runat="server" visible="true">
        <h3>Additional Information</h3>
        <table width="100%" class="position">
            <tr>
                <td><asp:Button ID="btnContacts" runat="server" Text="Contacts" 
                        onclick="btnContacts_Click" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSchool" runat="server" Text="Education" 
                        onclick="btnSchool_Click" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnFinancial" runat="server" Text="Financial" 
                        onclick="btnFinancial_Click" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnHousing" runat="server" Text="Housing" 
                        onclick="btnHousing_Click" /></td>
            </tr>
        </table>
    </fieldset>

    <fieldset id="allContacts" runat="server" visible="false">
    <fieldset id="contactPerm" runat="server" visible="false" style="border:none;">
        <h4>Permanent address</h4>
        <table width="100%" class="position">
            <tr>
                <th colspan="2" align="left">Name</th>
                <th colspan="2" align="left">Country of Permanent Residence</th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblPermName" runat="server"></asp:Label></td>
                <td colspan="2"><asp:Label ID="lblPermCountry" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th colspan="4" align="left">Address</th>
            </tr>
            <tr>
                <td colspan="4"><asp:Label ID="lblPermAddress" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th colspan="2" align="left">City</th>
                <th align="left">State/Province</th>
                <th align="left">Zip/Postal code</th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblPermCity" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPermState" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPermZip" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th align="left">Phone</th>
                <th align="left">Cell phone</th>
                <th align="left">FAX</th>
                <th align="left">Email address</th>
            </tr>
            <tr>
                <td><asp:Label ID="lblPermPhone" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPermCell" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPermFAX" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPermEmail" runat="server"></asp:Label></td>
            </tr>
        </table>
    </fieldset>

    <fieldset id="contactParents" runat="server" visible="false" style="border:none;">
        <h4>Parent's address</h4>
        <table width="100%" class="position">
            <tr>
                <th colspan="2" align="left">Name</th>
                <th colspan="2" align="left">Country</th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblParentName" runat="server"></asp:Label></td>
                <td colspan="2"><asp:Label ID="lblParentCountry" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th colspan="4" align="left">Address</th>
            </tr>
            <tr>
                <td colspan="4"><asp:Label ID="lblParentAddress" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th colspan="2" align="left">City</th>
                <th align="left">State/Province</th>
                <th align="left">Zip/Postal code</th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblParentCity" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblParentState" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblParentZip" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th align="left">Phone</th>
                <th align="left">Cell phone</th>
                <th align="left">FAX</th>
                <th align="left">Email address</th>
            </tr>
            <tr>
                <td><asp:Label ID="lblParentPhone" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblParentCell" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblParentFAX" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblParentEmail" runat="server"></asp:Label></td>
            </tr>
        </table>
    </fieldset>

    <fieldset id="contactAgency" runat="server" visible="false" style="border:none;">
        <h4>Agency address</h4>
        <table width="100%" class="position">
            <tr>
                <th colspan="2" align="left">Agency name</th>
                <th colspan="2" align="left">Agency contact person</th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblAgencyName" runat="server"></asp:Label></td>
                <td colspan="2"><asp:Label ID="lblAgencyContact" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th colspan="4" align="left">Address</th>
            </tr>
            <tr>
                <td colspan="4"><asp:Label ID="lblAgencyAddress" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th colspan="2" align="left">City</th>
                <th align="left">State/Province</th>
                <th align="left">Zip/Postal code</th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblAgencyCity" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblAgencyState" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblAgencyZip" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th colspan="4" align="left">Agency country</th>
            </tr>
            <tr>
                <td colspan="4"><asp:Label ID="lblAgencyCountry" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th align="left">Phone</th>
                <th align="left">Cell phone</th>
                <th align="left">FAX</th>
                <th align="left">Email address</th>
            </tr>
            <tr>
                <td><asp:Label ID="lblAgengyPhone" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblAgencyCell" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblAgencyFAX" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblAgencyEmail" runat="server"></asp:Label></td>
            </tr>
        </table>
    </fieldset>

    <fieldset id="contactRelative" runat="server" visible="false" style="border:none;">
        <h4>Relative's address</h4>
        <table width="100%" class="position">
            <tr>
                <th colspan="2" align="left">Name</th>
                <th colspan="2" align="left">Relationship to you</th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblRelativeName" runat="server"></asp:Label></td>
                <td colspan="2"><asp:Label ID="lblRelativeHow" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th colspan="4" align="left">Address</th>
            </tr>
            <tr>
                <td colspan="4"><asp:Label ID="lblRelativeAddress" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th align="left">Phone</th>
                <th align="left">Cell phone</th>
                <th align="left">FAX</th>
                <th align="left">Email address</th>
            </tr>
            <tr>
                <td><asp:Label ID="lblRelativePhone" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblRelativeCell" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblRelativeFAX" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblRelativeEmail" runat="server"></asp:Label></td>
            </tr>
        </table>
        </fieldset>
    <fieldset id="contactEmergency" runat="server" visible="false" style="border:none;">
        <h4>Emergency contact</h4>
        <table width="100%" class="position">
            <tr>
                <th colspan="2" align="left">Name</th>
                <th colspan="2" align="left">Relationship to you</th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblEmergName" runat="server"></asp:Label></td>
                <td colspan="2"><asp:Label ID="lblEmergRelation" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th align="left">Phone</th>
                <th align="left">Cell phone</th>
                <th align="left">FAX</th>
                <th align="left">Email address</th>
            </tr>
            <tr>
                <td><asp:Label ID="lblEmergPhone" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEmergCell" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEmergFAX" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblEmergEmail" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th colspan="2" align="left">Emergency contact country</th>
                <th colspan="2" align="left">Does he/she speak english</th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblEmergCountry" runat="server"></asp:Label></td>
                <td colspan="2"><asp:Label ID="lblEmergSpeakEngligh" runat="server"></asp:Label></td>
            </tr>
        </table>
    </fieldset>
    </fieldset>
    <fieldset id="schoolInfo" runat="server" visible="false">
    <h4>Educational History</h4>
    <table width="100%" class="position">
            <tr>
                <th align="left" colspan="2">High school graduate?  </th>
                <th colspan="3" align="left">Name of high school attended/attending: </th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblHSGrad" runat="server"></asp:Label></td>
                <td colspan="3"><asp:Label ID="lblHSattend" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th align="left">School Code:  </th>
                <th align="left">TOEFL score:  </th>
                <th align="left">TOEFL test date:  </th>
                <th align="left">IELTS score:  </th>
                <th align="left">IELTS test date:  </th>
            </tr>
            <tr>
                <td><asp:Label ID="lblSchoolCode" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblTOEFLscore" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblTOEFLdate" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblIELTSscore" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblIELTSdate" runat="server"></asp:Label></td>
            </tr>
                <tr>
                <th colspan="2" align="left">Start quarter:  </th>
                <th colspan="3" align="left">How long stay:  </th>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblQtrStart" runat="server"></asp:Label></td>
                <td colspan="3"><asp:Label ID="lblLengthOfStay" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th align="left">School attend:  </th>
                <th colspan="1" align="left">Program:  </th>
                <th colspan="3" align="left">Major:  </th>
            </tr>
            <tr>
               <td><asp:Label ID="lblSchoolAttend" runat="server"></asp:Label></td>
                <td colspan="1"><asp:Label ID="lblProgStudy" runat="server"></asp:Label></td>
                <td colspan="3"><asp:Label ID="lblMajor" runat="server"></asp:Label></td>
            </tr>
        </table>
    </fieldset>

    <fieldset id="financialInfo" runat="server" visible="false">
    <h4>Financial Information</h4>
        <table width="100%" class="position">
            <tr>
                <th align="left" style="width:60%;">How will you pay: </th>
                <th align="left" style="width:40%;">Payment option: </th>
            </tr>
            <tr>
                <td><asp:Label ID="lblHowPay" runat="server"></asp:Label></td>
                <td><asp:Label ID="lblPayOption" runat="server"></asp:Label></td>
            </tr>
        </table>
    </fieldset>

    <fieldset id="housingInfo" runat="server" visible="false">
    <h4>Housing Information</h4>
    <table width="100%" id="tabHousing" runat="server" class="position">
        <tr>
            <th align="left" style="width:50%;">Housing</th>
            <th align="left" style="width:50%;">Address</th>
        </tr>
        <tr>
            <td><asp:Label ID="lblOwnTitle" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblOwnHouse" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <th align="left" style="width:50%;">CCS housing choices: </th>
            <th align="left" style="width:50%;">Family type preference:  </th>
        </tr>
        <tr>
            <td><asp:Label ID="lblCCSchoice" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblFamPreference" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <th align="left" style="width:50%;">Foods I can't/won't eat: </th>
            <th align="left" style="width:50%;">Cook own meals:  </th>
        </tr>
        <tr>
            <td><asp:Label ID="lblBadFood" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblOwnMeals" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <th align="left" style="width:50%;">Smoke:  </th>
            <th align="left" style="width:50%;">Religious requirements:  </th>
        </tr>
        <tr>
            <td><asp:Label ID="lblSmoke" runat="server"></asp:Label></td>
            <td><asp:Label ID="lblReligion" runat="server"></asp:Label></td>
        </tr>
    </table>
    </fieldset>

</asp:Content>
