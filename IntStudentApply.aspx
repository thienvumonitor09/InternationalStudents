<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IntStudentApply.aspx.cs" Inherits="IntStudentApply" MaintainScrollPositionOnPostback="true" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Internation Student Application Form</title>
    <script type="text/javascript">
    <!--
        function toggleRows(whatID) {
            var tabRow = document.getElementById(whatID);
            if (tabRow.style.display.toString() == 'none') {
                tabRow.style.display = '';
                } else {
                    tabRow.style.display = 'none';
                }
            }

            function GetCheckBoxSelection(whatID) {
                var chkTable = document.getElementById(whatID);
                var chkBox = chkTable.getElementsByTagName("input");
                var chkLabel = chkTable.getElementsByTagName("label");
//                alert("chkBox: " + chkBox[0].checked.toString());
//                alert("label: " + chkLabel[0].innerHTML.toString());
                if (chkBox[0].checked && chkLabel[0].innerHTML == "Credit Card") {
//                    alert("selected = " + chkLabel[0].innerHTML);
                    var tabRowOn = document.getElementById("creditCard");
                    tabRowOn.style.display = '';
                } else {
                    // no boxes are checked so make sure credit card info is hidden
                    var tabRowOff = document.getElementById("creditCard");
                    tabRowOff.style.display = 'none';
                }
            } // end function GetCheckBoxSelection

            function useAgency(whatID) {
                var radTable = document.getElementById(whatID);
 //               alert("Table: " + radTable.tagName.toString());
                var radItem = radTable.getElementsByTagName("input");
 //               alert("Item: " + radItem.length.toString());
                if (whatID == "radAgency")
                    var tabRow = document.getElementById("agencyInfo");
                else if (whatID == "radRelativeInUS")
                    var tabRow = document.getElementById("relativeInfo");
                else if (whatID == "radMedical")
                    var tabRow = document.getElementById("medical");
                else if (whatID == "radAccommodations")
                    var tabRow = document.getElementById("ADA");
                else if (whatID == "radFood")
                    var tabRow = document.getElementById("badFood");
                if (radItem[0].checked) {
//                    alert("selected");
                    tabRow.style.display = '';
                } else {
//                    alert("not selected");
                    tabRow.style.display = 'none';
                }
            }

            // Validates that the input string is a valid date formatted as "mm/dd/yyyy"
            function isValidDate(dateString) {
                alert("in isValidDate");
                // First check for the pattern
                if (!/^\d{2}\/\d{2}\/\d{4}$/.test(dateString))
                    return false;

                // Parse the date parts to integers
                var parts = dateString.split("/");
                var day = parseInt(parts[1], 10);
                var month = parseInt(parts[0], 10);
                var year = parseInt(parts[2], 10);

                // Check the ranges of month and year
                if (year < 1000 || year > 3000 || month == 0 || month > 12)
                    return false;

                var monthLength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

                // Adjust for leap years
                if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
                    monthLength[1] = 29;

                // Check the range of the day
                return day > 0 && day <= monthLength[month - 1];
            };

            function getAge() {
                var typedDOB;
                alert("in getAge");
                typedDOB = document.getElementById("txtDOB");

                var dobSplit = typedDOB.value.split("/");
                var dobYear = dobSplit[2];
                var dobDay = dobSplit[1];
                var dobMonth = dobSplit[0];

                var d = new Date()
                 alert("date: " + d);
                var curr_year = d.getFullYear();

                var curr_month = d.getMonth();
                curr_month = curr_month + 1;

                var curr_day = d.getDate();
                //alert("currDay: " + curr_day);
                //alert (curr_year + " - " + dobYear);
                var enteredAge = curr_year - dobYear;
                //alert("enteredAge: " + enteredAge);
                if (curr_month < dobMonth || (curr_month == dobMonth && curr_day < dobDay)) {
                    enteredAge = enteredAge - 1;
                }
                alert("calculated age: " + enteredAge);
                // pop up High School Release window
                if (enteredAge < 16) {
                    alert("No one under 16 can apply for admissions.");
                    return;
                    //location.href = "http://www.iel.spokane.edu/";
                }
            }

            function checkDate() {
                var typedDOB;

                typedDOB = document.getElementById("txtDOB");
                alert("date: " + typedDOB.value);
                var valid_date = false;
                valid_date = isValidDate(typedDOB.value);
                alert("valid_date: " + valid_date);

                if (valid_date) {
                    getAge();
                    return;
                } else {
                    alert("Please enter your birthdate in the format 'mm/dd/yyyy'");
                    return;
                }
            }
              
        //-->
    </script>
</head>
<body style="font-size: 10pt; font-family: Arial">
    <form id="form1" runat="server">  
    <center>
    <fieldset id="current" runat="server" visible="true" width="820px" title="application form">
    <table width="800px" cellpadding="2" cellspacing="0" border="1">
        <tr>
                    <td colspan="4"><table width="100%">
                            <tr>
                                <td align="left" style="width: 82px"><img src="_images/logo.GIF" alt="Community Colleges of Spokane logo" /></td>
                                <td align="left" valign="middle" colspan="3"><span style="font-size:x-large;"><b>International Student APPLICATION</b></span></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="left"><span style="color:#DD0000"><b><br />* Required information</b></span></td>
                            </tr>
                        </table>
                     </td>
                 </tr>
                 <tr>
                        <td colspan="4" style="background-color:#2a59a5;width:100%;"><span style="color:White;"><b>Personal Information</b></span></td>
                  </tr>
                  <tr>
                    <td colspan="4"><span style="color:#DD0000"><b><asp:Literal ID="errMsg" runat="server"></asp:Literal></b></span></td>
                  </tr>
                  <tr>
                        <td align="left" style="width:30%;">Family name*</td>
                        <td colspan="3" style="text-align:left;width:70%;"><asp:TextBox Width="300px" ID="txtFamilyName" runat="server" onfocus="this.select();"></asp:TextBox></td>
                  </tr>
                  <tr>
                        <td align="left">First Name*   <span style="font-size:x-small;">(Given Name)</span></td>
                        <td colspan="3" align="left"><asp:TextBox ID="txtGivenName" runat="server" Width="300px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left">Middle Name(s), if any</td>
                        <td colspan="3" align="left"><asp:TextBox ID="txtMiddleNames" runat="server" Width="300px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width:30%;" align="left">Date of Birth*</td>
                        <td style="text-align: left; width:70%" colspan="3"><asp:TextBox ID="txtDOB" onchange="checkDate();"  runat="server" Width="100px" MaxLength="10" Text="mm/dd/yyyy"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="left"><b>NOTE: Applicant must be 17 years of age by program start date.</b></td>
                    </tr>
                    <tr>
                        <td style="width:30%;" align="left">Gender *&nbsp;</td>
                        <td colspan="3" align="left" style="width:70%"><asp:RadioButtonList ID="radGender" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td style="width:30%;" align="left">Student Status*</td>
                        <td colspan="3" align="left"><asp:RadioButtonList ID="radStudentStatus" runat="server" 
                                RepeatDirection="Horizontal" Width="450px">
                                        <asp:ListItem>New Student</asp:ListItem>
                                        <asp:ListItem>Transfer student</asp:ListItem>
                                        <asp:ListItem>Returning CCS Student</asp:ListItem>
                                    </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="left" style="background-color:#2a59a5;width:100%"><span style="color:White;"><b>Immigration Information</b>:&nbsp;</span></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="width:50%;">&nbsp;Country of Birth*:&nbsp;&nbsp;</td>
                        <td colspan="2" align="left" style="width:50%;">&nbsp;Country of Citizenship*&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="width:50%"><asp:DropDownList ID="ddCountrybirth" runat="server">
                            </asp:DropDownList></td>
                            <td colspan="2" align="left" style="width:50%"><asp:DropDownList ID="ddCountryCitizenship" runat="server">
                                </asp:DropDownList></td>
                            </tr>
                    <tr>
                        <td align="left" colspan="2" style="width:50%;">Native Language&nbsp;&nbsp;
                        <asp:TextBox ID="txtNativeLanguage" runat="server" MaxLength="100"></asp:TextBox></td>
                        <td colspan="2" style="width:50%" align="left">English Ability&nbsp;&nbsp;
                        <asp:RadioButtonList ID="radEnglishAbility" runat="server" 
                                RepeatDirection="Horizontal" style="margin-right: 3px" Width="200px">
                                        <asp:ListItem>fluent</asp:ListItem>
                                        <asp:ListItem>Average</asp:ListItem>
                                        <asp:ListItem>Poor</asp:ListItem>
                                    </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td align="left"  style="width:30%;" valign="top">Visa Type</td>
                        <td colspan="3" align="left" style="width:70%;"><asp:RadioButtonList ID="radVisaType" 
                                runat="server" RepeatDirection="Horizontal" style="margin-right: 3px">
                                        <asp:ListItem>F-1 Student</asp:ListItem>
                                        <asp:ListItem>M-1 Student</asp:ListItem>
                                        <asp:ListItem>J-1 Student</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                    </asp:RadioButtonList>
                       </td> 
                    </tr>
                    <tr>
                        <td align="left" style="width:30%;" valign="top">Dependents arriving with you</td>
                        <td align="left" valign="top" style="width:20%;"><asp:CheckBoxList ID="chkDependents" RepeatDirection="Horizontal" runat="server">
                            <asp:ListItem>Spouse</asp:ListItem>
                            <asp:ListItem>Children</asp:ListItem>
                            </asp:CheckBoxList></td>
                       <td  colspan="2" align="left" valign="top" style="width:50%;">Number of dependents:&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddYearApp" runat="server">
                                    <asp:ListItem Value="Select">Select one</asp:ListItem>
                                    <asp:ListItem Value="0">0</asp:ListItem>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                    </asp:DropDownList>
                         </td>
                    </tr>
                    <tr>
                        <td colspan="4" align="left" style="background-color:#2a59a5;width:100%"><span style="color:White;"><b>Contact Information</b></span></td>
                    </tr>
                    <tr>
                        <td colspan="4"> <span style="color:#DD0000"><asp:Literal ID="errMsg2" runat="server"></asp:Literal></span></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="left">Please enter your permanent home country address</td>
                    </tr>
                    <tr>
                        <td style="width:30%;" align="left"><asp:CheckBox ID="chkLiveHere" runat="server" Text="I live in the US" /></td>
                        <td colspan="3" style="width:70%;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:30%;" align="left">Street Address*</td>
                        <td colspan="3" align="left"><asp:TextBox ID="txtPermAddress" runat="server" Width="400px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" colspan="2">City*&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtPermCity" runat="server" Width="200px"></asp:TextBox></td>
                        <td align="left" valign="top" colspan="2">State/Province* &nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtPermStateP" Width="200px" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" colspan="2">Zip/Postal Code*&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPermZip" Width="200px" runat="server"></asp:TextBox></td>
                        <td align="left" valign="top" colspan="2">Country*&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddPermHomeCountry" runat="server">
                                </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" colspan="2">Phone*&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPermPhone" Width="200px" runat="server"></asp:TextBox></td>
                        <td align="left" valign="top" colspan="2">Email*&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPermEmail" Width="200px" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="left">If your parents have different contact information, please click here:   
                            <asp:CheckBox ID="chkParentsContact" runat="server" onclick='toggleRows("parentAddr")' /></td>
                    </tr>
                    <tbody id="parentAddr" style="display:none">
                   <tr>
                        <td style="width:30%;" align="left">Parent's Street Address</td>
                        <td colspan="3" align="left"><asp:TextBox ID="txtParentsStreet" runat="server" Width="400px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" colspan="2">City&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtParentsCity" runat="server" Width="150px"></asp:TextBox></td>
                        <td align="left" valign="top" colspan="2">State/Province&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtParentsState" Width="150px" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" colspan="2">Zip/Postal Code&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtParentsZip" Width="150px" runat="server"></asp:TextBox></td>
                        <td align="left" valign="top" colspan="2">Parent's Country<br /><asp:DropDownList ID="ddParentsCountry" runat="server" BackColor="controllightlight">
                                </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" colspan="2">Parent's Phone&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtParentsPhone" Width="150px" runat="server"></asp:TextBox></td>
                        <td align="left" valign="top" colspan="2">Parent's FAX&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtParentsFAX" Width="150px" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" valign="top" colspan="2">Parent's Email&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtParentsEmail" Width="150px" runat="server"></asp:TextBox></td>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    </tbody>
                    <tr>
                        <td colspan="4" align="left" style="background-color:#2a59a5;width:100%;"><span style="color:White;"><b>Agency/Advising Center Information (if applicable)</b></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">Did you use an agency or advising center for help in your application?</td>
                        <td colspan="2" align="left"><asp:RadioButtonList ID="radAgency" runat="server" onclick="useAgency('radAgency')" RepeatDirection="Horizontal">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
                    </tr>
                    <tbody id="agencyInfo" style="display:none">
                    <tr>
                        <td colspan="2" align="left">Agency Name&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAgencyName" runat="server" Width="150px"></asp:TextBox></td>
                        <td colspan="2" align="left">Agency Contact Person&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAgencyPerson" runat="server" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width:30%;" align="left">Agency Address</td>
                        <td colspan="3" align="left"><asp:TextBox ID="txtAgencyAddress" runat="server" Width="400px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">Agency City&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAgencyCity" runat="server" Width="150px"></asp:TextBox></td>
                        <td colspan="2" align="left">Agency State/Province&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAgencyState" runat="server" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">Agency Zip/Postal Code&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAgencyZip" runat="server" Width="150px"></asp:TextBox></td>
                        <td colspan="2" align="left">Agency Country<br /><asp:DropDownList ID="ddAgencyCountry" runat="server" BackColor="controllightlight">
                                </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">Agency Phone&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAgencyPhone" runat="server" Width="150px"></asp:TextBox></td>
                        <td colspan="2" align="left">Agency FAX&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtAgencyFAX" runat="server" Width="150px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width:30%;" align="left">Agency Email</td>
                        <td colspan="3" align="left"><asp:TextBox ID="txtAgencyEmail" runat="server" Width="300px"></asp:TextBox></td>
                    </tr>
                    </tbody>
                    <tr>
                        <td colspan="4" align="left" style="background-color:#2a59a5;">
                                <span style="color:White;"><b>Where would you like your I-20 sent?*</b></span><br />
                        <span style="text-align:left;">
                            <asp:RadioButtonList ID="radI20" runat="server" RepeatDirection="Horizontal" style="color:#FFFFFF;Width:500px">
                        <asp:ListItem>Current Address</asp:ListItem>
                        <asp:ListItem>Parent's Address</asp:ListItem>
                        <asp:ListItem>Agency/Advising Center/Other</asp:ListItem>
                    </asp:RadioButtonList></span></td>
                    </tr>
                    <tr>
                        <td colspan="4"><span style="color:#DD0000"><asp:Literal ID="errMsg3" runat="server"></asp:Literal></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">Do you have a relative in the U.S.? If so, enter their contact information</td>
                        <td align="left" colspan="2"><asp:RadioButtonList ID="radRelativeInUS" onclick="useAgency('radRelativeInUS')" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
                    </tr>
                    <tbody id="relativeInfo" style="display:none;">
                    <tr>
                        <td colspan="2" align="left">Relative's Name&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtRelativeName" runat="server" Width="150px"></asp:TextBox></td>
                        <td colspan="2" align="left">Relative's Email&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtRelativeEmail" Width="150px" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width:30%;" align="left">Relative's Address</td>
                        <td colspan="3" align="left"><asp:TextBox ID="txtRelativeAddress" Width="400px" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">Relative's Phone&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtRelativePhone" runat="server" Width="150px"></asp:TextBox></td>
                        <td colspan="2" align="left">Relative's FAX&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtRelativeFAX" Width="150px" runat="server"></asp:TextBox></td>
                    </tr>
                    </tbody>
                    <tr>
                        <td colspan="4" align="left">Who should we contact in case of an emergency or medical situation?</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">Emergency Contact Name&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtEmergName" runat="server" Width="150px"></asp:TextBox></td>
                        <td colspan="2" align="left">Relationship&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtEmergRelationship" Width="150px" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">Emergency Contact Phone&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtEmergPhone" runat="server" Width="150px"></asp:TextBox></td>
                        <td colspan="2" align="left">Emergency Contact Cell Phone&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtEmergCell" Width="150px" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" valign="top">Emergency Contact Email&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtEmergEmail" runat="server" Width="150px"></asp:TextBox></td>
                        <td colspan="2" align="left">Emergency Contact Country<br /><asp:DropDownList ID="ddEmergCountry" runat="server">
                                </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="width:50%;">Is your Emergency Contact English Speaking?</td>
                        <td colspan="2" align="left" style="width:50%;"><asp:RadioButtonList ID="radEmergencyEnglish" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="left" style="background-color:#2a59a5;width:100%;"><span style="color:White;"><b>Medical Information</b></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="width:50%;">Do you have any medical conditions or allergies?</td>
                        <td colspan="2" align="left"><asp:RadioButtonList ID="radMedical" runat="server" RepeatDirection="Horizontal" onclick="useAgency('radMedical')">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
                    </tr>
                    <tbody id="medical" style="display:none">
                    <tr>
                        <td colspan="4" align="left" style="width:100%;">Please describe your medical condition or allergy
                        <p><asp:TextBox ID="txtAreaMedical" runat="server" Columns="80" Rows="5" TextMode="MultiLine"></asp:TextBox></p></td>
                    </tr>
                    </tbody>
                    <tr>
                        <td colspan="2" align="left" style="width:50%;">Do you require any special physical or learning accommodations?</td>
                        <td colspan="2" align="left"><asp:RadioButtonList ID="radAccommodations" onclick="useAgency('radAccommodations')" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
                    </tr>
                    <tbody id="ADA" style="display:none">
                    <tr>
                        <td colspan="4" align="left" style="width:100%;">Please describe what special physical or learning accommodations you need.
                        <p><asp:TextBox ID="txtAreaAccommodations" runat="server" Columns="80" Rows="5" TextMode="MultiLine"></asp:TextBox></p></td>
                    </tr>
                    </tbody>
                    <tr>
                        <td colspan="4" align="left" style="width:100%;">Health Insurance <span style="color:Red;">is required</span> for all international students.</td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" valign="top" style="width:50%;">Choose your health insurance coverage</td>
                        <td colspan="2" align="left" style="width:50%;"><asp:RadioButtonList ID="radHealthIns" runat="server">
                        <asp:ListItem Value="CCS insurance">I will purchase health insurance through CCS</asp:ListItem>
                        <asp:ListItem Value="own insurance">I will bring my own health insurance</asp:ListItem>
                    </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="left" style="background-color:#2a59a5;width:100%;"><span style="color:White;"><b>Educational History</b></span></td>
                    </tr>
                    <tr>
                        <td colspan="4"><span style="color:#DD0000"><asp:Literal ID="errMsg4" runat="server"></asp:Literal></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" >Name of high school you are/have attended</td>
                        <td colspan="2" align="left"><asp:TextBox ID="txtHighSchool" runat="server" Width="300px"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">Are you a high school graduate?*&nbsp;&nbsp;&nbsp;
                        <asp:RadioButtonList ID="radHSGrad" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:RadioButtonList></td>
                    <td colspan="2" align="left">If yes, month and year of graduation*<br /><asp:TextBox ID="txtHSGradDate" runat="server" Width="100px" Text="mm/yyyy" MaxLength="7"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" valign="top">TOEFL Score&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtTOEFLscore" runat="server" Width="50px"></asp:TextBox><br />
                        School Code: <span style="font-size:x-small;">SCC code: 4739 or SFCC School Code: 4752</span>&nbsp;&nbsp;<asp:TextBox
                            ID="txtTOEFLschoolCode" runat="server" Width="50px"></asp:TextBox></td>
                        <td colspan="2" align="left" valign="top">TOEFL Test Date&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddTOEFLmm" runat="server">
                    <asp:ListItem Selected="True">MM</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>&nbsp;&nbsp;/&nbsp;&nbsp;<asp:DropDownList ID="ddTOEFLdd" runat="server">
                    <asp:ListItem Selected="True">DD</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddTOEFLyy" runat="server">
                    <asp:ListItem Selected="True">YYYY</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">IELTS Score&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtIELTSscore" runat="server" Width="50px"></asp:TextBox></td>
                        <td colspan="2" align="left">IELTS Test Date&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddIELTSmm" runat="server">
                    <asp:ListItem Selected="True">MM</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>&nbsp;&nbsp;/&nbsp;&nbsp;<asp:DropDownList ID="ddIELTSdd" runat="server">
                    <asp:ListItem Selected="True">DD</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddIELTSyy" runat="server">
                    <asp:ListItem Selected="True">YYYY</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2009</asp:ListItem>
                    <asp:ListItem>2008</asp:ListItem>
                    <asp:ListItem>2007</asp:ListItem>
                    <asp:ListItem>2006</asp:ListItem>
                    <asp:ListItem>2005</asp:ListItem>
                    <asp:ListItem>2004</asp:ListItem>
                    <asp:ListItem>2003</asp:ListItem>
                    <asp:ListItem>2002</asp:ListItem>
                    <asp:ListItem>2001</asp:ListItem>
                    </asp:DropDownList></td>
                    </tr>
                    <tr>
                       <td colspan="2" align="left" valign="top">When would you like to begin your studies?*</td>
                       <td colspan="2" align="left" ><asp:RadioButtonList ID="radWhenStudy" runat="server" 
                               RepeatColumns="2">
                        <asp:ListItem>Spring/April 2014</asp:ListItem>
                        <asp:ListItem>Summer/July 2014</asp:ListItem>
                        <asp:ListItem>Fall/September 2014</asp:ListItem>
                        <asp:ListItem>Winter/January 2014</asp:ListItem>
                        <asp:ListItem>Spring/April 2015</asp:ListItem>
                        <asp:ListItem>Summer/June 2015</asp:ListItem>
                    </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" valign="top">What would you like to study?*<br />
                         <span style="font-size:smaller">Check all programs that relate to your studies at CCS.<br />
                         You may check more than one box.</span></td>
                         <td colspan="2" align="left"><asp:CheckBoxList ID="chkWhatStudy" runat="server" RepeatColumns="2">
                         <asp:ListItem>University Transfer</asp:ListItem>
                         <asp:ListItem>High School Plus</asp:ListItem>
                         <asp:ListItem>American Honors</asp:ListItem>
                         <asp:ListItem>Intensive English (IELP)</asp:ListItem>
                         <asp:ListItem>Professional/Technical Degree</asp:ListItem>
                         <asp:ListItem>Certificate</asp:ListItem>
                    </asp:CheckBoxList><br />
                    If other, please specify&nbsp;&nbsp;<asp:TextBox ID="txtStudyOtherProg" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" valign="top">Where would you like to study?*</td>
                        <td colspan="2" align="left"><asp:CheckBoxList ID="chkWhereStudy" runat="server" RepeatDirection="Vertical">
                        <asp:ListItem Value="SCC">Spokane Community College (SCC)</asp:ListItem>
                        <asp:ListItem Value="SFCC">Spokane Falls Community College (SFCC)</asp:ListItem>
                        <asp:ListItem Value="Pullman">Pullman</asp:ListItem>
                        </asp:CheckBoxList></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">What will be your major?*</td>
                        <td colspan="2" align="left"><asp:DropDownList ID="ddMajor" runat="server">
                        <asp:ListItem Value="American Honors Program">American Honors Program</asp:ListItem>
                        </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left" style="width:50%;">How long do you plan to attend CCS?*</td>
                        <td colspan="2" align="left"><asp:DropDownList ID="ddHowLongStay" runat="server">
                        <asp:ListItem Value="">Choose One</asp:ListItem>
                        <asp:ListItem>3 months/1 quarter</asp:ListItem>
                        <asp:ListItem>6 months/2 quarter</asp:ListItem>
                        <asp:ListItem>9 months/Academic Year</asp:ListItem>
                        <asp:ListItem>More than 1 year</asp:ListItem>
                        </asp:DropDownList></td> 
                    </tr>
                    <tr>
                        <td colspan="4" style="background-color:#2a59a5;width:100%;" align="left"><span style="color:White;"><b>Financial Information</b></span></td>
                  </tr>
                  <tr>
                        <td colspan="4"><span style="color:#DD0000"><asp:Literal ID="errMsg6" runat="server"></asp:Literal></span></td>
                    </tr>
                  <tr>
                    <td colspan="2" align="left" valign="top">How will you pay your tuition and living expenses?*</td>
                    <td colspan="2" align="left"><asp:CheckBoxList ID="chkHowPay" runat="server" RepeatColumns="2" DisplayMode="HyperLink">
                    <asp:ListItem Value="Personal">Personal Funds</asp:ListItem>
                    <asp:ListItem Value="Family">Family Funds</asp:ListItem>
                    <asp:ListItem Value="Government">Government sponsorship from home country</asp:ListItem>
                    <asp:ListItem Value="Company">Company sponsorship from home country</asp:ListItem>
                    <asp:ListItem Value="US Sponsor" Text="Sponsor with the U.S. (<a href='http://www.uscis.gov/portal/site/uscis/menuitem.5af9bb95919f35e66f614176543f6d1a/?vgnextoid=fe3647a55773d010VgnVCM10000048f3d6a1RCRD&vgnextchannel=db029c7755cb9010VgnVCM10000045f3d6a1RCRD' target='_blank'>I-134 Required</a>)"></asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                    </asp:CheckBoxList></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top">If other, please specify</td>
                    <td align="left" colspan="3"><asp:TextBox ID="txtOtherFinancing" runat="server" TextMode="MultiLine" Columns="60" Rows="4"></asp:TextBox></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="left" valign="top">Which payment option will you use to pay for your application and placement fees?</td>
                    <td colspan="2" align="left"><asp:CheckBoxList ID="chkPaymentOption" runat="server" onclick="GetCheckBoxSelection('chkPaymentOption')">
                    <asp:ListItem Value="Credit card">Credit Card</asp:ListItem>
                    <asp:ListItem Value="Check or Draft">Check/Draft (on U.S. drawn bank)</asp:ListItem>
                    <asp:ListItem Value="Money Order">Money Order (from U.S. based money order)</asp:ListItem>
                      </asp:CheckBoxList></td>
                  </tr>
                  <tbody id="creditCard" style="display:none">
                  <tr>
                    <td colspan="4" align="left" style="background-color:#fff8dc">
                    <span style="font-size:larger"><b>Your payment option is: Credit Card</b></span><br /><br />
                    CCS accepts payments by Visa or Mastercard. Download and print the <a href="ccAuthorizationForm.pdf" target="_blank">Credit Card Authorization Form</a> and 
                    <ul>
                        <li>fax it to (509) 533-8683 or</li>
                        <li>email it to globalprograms@ccs.spokane.edu</li>
                    </ul></td>
                  </tr>
                  </tbody>
                  <tr>
                    <td colspan="4" style="background-color:#2a59a5;width:100%" align="left"><span style="color:White;"><b>Housing Section</b></span></td>
                  </tr>
                  <tr>
                    <td colspan="4" align="left">Housing placements are made in the order completed applications and placement fees are received. <br />
                    Preferences are met based on availability.</td>
                  </tr>
                  <tr>
                        <td colspan="4" style="background-color:#2a59a5;width:100%" align="left"><span style="color:White;"><b>
                        <asp:CheckBox ID="chkOwnHousing" runat="server" Text="I have or will find my own housing" /><br />
                        Please provide the U.S. address if known.</b></span></td>
                  </tr>
                   <tr id="USaddress">
                    <td align="left" colspan="4"><asp:TextBox ID="txtUSaddress" runat="server" Columns="80" Rows="4" TextMode="MultiLine"></asp:TextBox></td>
                  </tr>
                  <tr>
                    <td colspan="4" align="left"><b>CCS has two housing choices for new applicants. What is your preference?</b></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="left">Homestay Program - <span style="font-size:x-small">Please complete the Homestay section</span></td>
                    <td colspan="2" align="left"><asp:RadioButtonList ID="radHomestay" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">1st</asp:ListItem>
                    <asp:ListItem Value="2">2nd</asp:ListItem>
                </asp:RadioButtonList></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="left">Apartment living</td>
                    <td colspan="2" align="left"><asp:RadioButtonList ID="radApartmentLiving" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Value="1">1st</asp:ListItem>
                    <asp:ListItem Value="2">2nd</asp:ListItem>
                </asp:RadioButtonList></td>
                  </tr>
                  <tr>
                    <td colspan="4" align="left"><b>Homestay Applicants Complete This Section</b></td>
                  </tr>
                   <tr>
                    <td colspan="2" align="left">What type of family do you prefer?<br />
                    <span style="font-size:small">This information will be provided to your prospective Homestay family.</span></td>
                    <td colspan="2" align="left"><asp:CheckBoxList ID="chkFamilyType" runat="server" RepeatColumns="2">
                    <asp:ListItem Value="no kids">Family (without children)</asp:ListItem>
                    <asp:ListItem Value="small kids">Family (with small children)</asp:ListItem>
                    <asp:ListItem Value="teenagers">Family (with teenagers)</asp:ListItem>
                    <asp:ListItem Value="intnatl_students">Family (with international students)</asp:ListItem>
                </asp:CheckBoxList></td>
                  </tr>
                  <tr>
                    <td colspan="2" align="left">Are there foods you cannot or will not eat?</td>
                    <td colspan="2" align="left"><asp:RadioButtonList ID="radFood" runat="server" RepeatDirection="Horizontal" onclick="useAgency('radFood')">
                    <asp:ListItem>Yes</asp:ListItem>
                     <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList></td>
                </tr>
                <tbody id="badFood" style="display:none">
                <tr>
                <td colspan="2" align="left" valign="top">If yes, please list the foods:</td>
                <td colspan="2" align="left"><asp:TextBox ID="txtNoFoods" TextMode="MultiLine" Columns="60" Rows="4" runat="server"></asp:TextBox></td>
                </tr>
                </tbody>
                <tr>
                <td colspan="2" align="left">Do you like to cook your own meals?</td>
                <td colspan="2" align="left"><asp:RadioButtonList ID="radCookOwnMeals" 
                        runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Sometimes</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                </tr>
                <tr>
                <td colspan="2" align="left">Do you smoke?</td>
                <td colspan="2" align="left"><asp:RadioButtonList ID="radSmoke" runat="server" 
                        RepeatDirection="Horizontal">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList></td>
                </tr>
                <tr>
                <td colspan="2" align="left" valign="top">Do you have any religious requirements or preferences?</td>
                <td colspan="2" align="left"><asp:TextBox ID="txtReligion" Columns="40" Rows="4" TextMode="MultiLine" runat="server"></asp:TextBox></td>
                </tr>
                  <tr>
                        <td colspan="4" style="background-color:#2a59a5;width:100%;" align="left"><span style="color:White;"><b>Release of Information & Admission Policy</b></span></td>
                  </tr>
                  <tr>
                        <td colspan="4"><span style="color:#DD0000"><asp:Literal ID="errMsg7" runat="server"></asp:Literal></span></td>
                  </tr>
                  <tr>
                    <td colspan="4" align="left">Please choose to authorize or decline the release of information*<br /><asp:RadioButtonList ID="radReleaseInformation" runat="server">
                <asp:ListItem Value="Yes">I authorize CCS to release academic records and immigration status information to my sponsor, educational agency and/or parents.</asp:ListItem>
                <asp:ListItem Value="No">I decline to authorize release of any information.</asp:ListItem>
                </asp:RadioButtonList></td>
                  </tr>
                  <tr>
                  <td colspan="4" style="background-color:#2a59a5;width:100%" align="left"><span style="color:White;"><b>ADMISSION POLICY</b><br />
                  New students who use CCS's I-20 to enter the United States must:
                  <ol>
                    <li>Report in person to CCS's orientation session for new international students</li>
                    <li>Enroll for and attend the first quarter at CCS</li>
                    <li>Present originals of passport, visa, I-94 and CCS I-20**</li>
                    <li>Carry <b><a href="http://www.lewermark.com/ccs" target="_blank"><span style="color:#11e8fb">health insurance</span></a></b> while enrolled at CCS</li>
                  </ol>
                  **Students transferring from other U.S. schools must present their most recent I-20 instead of a CCS I-20.
                  <p>By checking the box below, I verify that, to the best of my knowledge, all of the statements on this form 
                  are true. I have read and agree to the published International Student Admission Policies.</p></span></td>
                  </tr>
                  <tr>
                    <td colspan="4" align="left"><asp:CheckBox ID="chkAgree" runat="server" TextAlign="Right" Text="All statements are true and I agree to the policies.*" /></td>
                  </tr>
                  <tr>
                    <td colspan="4" align="left"><span style="color:#DD0000"><asp:Literal ID="errMsg8" runat="server"></asp:Literal></span></td>
                  </tr>
        
        
                    <tr>
                        <td align="left" colspan="4">
                            <strong>Please print a copy for your records.</strong></td>
                    </tr>
            
                    <tr>
                            <td colspan="4" style="text-align: left">
                            <b><span style="color:#DD0000"><asp:Literal ID="errGPA" runat="server"></asp:Literal></span>
                                <span style="color:#DD0000"><asp:Literal ID="errMsg5" runat="server"></asp:Literal></span></b></td>
                    </tr>
            <tr>
                <td colspan="4" align="left"><asp:Button ID="btnSubmit" runat="server" Text="Submit Application" OnClick="btnSubmit_Click" /></td>
            </tr>
     </table>
    </fieldset>
    </center>
    </form>
</body>
</html>
