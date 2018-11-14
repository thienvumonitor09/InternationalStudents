<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/TuneUpSubpage.master" CodeFile="global2ApplicationForm.aspx.cs" Inherits="InternationalStudents_Standardized_global2ApplicationForm" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script src="https://portal.ccs.spokane.edu/_netapps/internationalsa/Scripts/formRules.js" type="text/javascript"></script>


 
<script type="text/javascript">
    <!--
    function CalculateAge() {
        var mydate = new Date();
        var mm = $("#ContentHolder_txtMonth").val();
        var dd = $("#ContentHolder_txtDay").val();
        var yy = $("#ContentHolder_txtYear").val();
        var age = 18;

        mydate.setFullYear(yy, mm - 1, dd);

        var currdate = new Date();
        currdate.setFullYear(currdate.getFullYear() - age);
        if ((currdate - mydate) < 0) {
            $('.divHideParentAddr').show();
            document.getElementById("ContentHolder_hidUnder18").value = "yes";
        } else {
            $('.divHideParentAddr').hide();
        }
    }

    function checkCode() {
        var schoolCode = document.getElementById("ContentHolder_txtTOEFLschoolCode");
        var schoolCodeMsg = document.getElementById("eSchoolCode");
        if (schoolCode.value != "4739" && schoolCode.value != "4752") {
            schoolCodeMsg.innerHTML = "Enter 4739 or 4752";
            schoolCode.focus();
            return;
        } else {
            schoolCodeMsg.innerHTML = "";
        }
    }

    function checkTheBoxes() {
        var countPay = $("#ContentHolder_chkHowPay input:checked").length;
        if (countPay < 1) {
            $("#ContentHolder_eHowPay").append("You MUST select at least one method of payment");
        } else {
            document.getElementById('ContentHolder_eHowPay').innerHTML = '';
        }
        var countStudy = $("#ContentHolder_chkWhatStudy input:checked").length;
        if (countStudy < 1) {
            $("#ContentHolder_eWhatProg").append("You MUST select at least one program");
        } else {
            document.getElementById('ContentHolder_eWhatProg').innerHTML = '';
        }
    }

    function checkClickPay() {
        var countPay = $("#ContentHolder_chkHowPay input:checked").length;
        // alert("in checkPay: " + countPay);
        if (countPay > 0) {
            document.getElementById('ContentHolder_eHowPay').innerHTML = '';
        } else {
            $("#ContentHolder_eHowPay").append("(2) You MUST select at least one method of payment");
        }
    }

    function checkClickWhatStudy() {
        var countStudy = $("#ContentHolder_chkWhatStudy input:checked").length;
//         alert("in checkWhatStudy: " + countStudy);
        if (countStudy > 0) {
            document.getElementById('ContentHolder_eWhatProg').innerHTML = '';
        } else {
            $("#ContentHolder_eWhatProg").append("(2) You MUST select at least one program");
        }
        var checkedVal = $("#ContentHolder_chkWhatStudy input:checked").val();
        if (checkedVal == "AA University Transfer Degree") {
            $('.divHideTR').show();
        }
        var unChecked = $("#ContentHolder_chkWhatStudy input:checkbox:not(:checked)").val();
        if (unChecked == "AA University Transfer Degree") {
            $('.divHideTR').hide();
        }
    }

    function ValidatePhone(phoneName) {
        var phoneRegExp = /^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/;
        var txtBox = "#ContentHolder_txt" + phoneName;
        var eMsg = "#ContentHolder_e" + phoneName;
        var phoneVal = $(txtBox).val();
        var numbers = phoneVal.split("").length;
        if (10 <= numbers && numbers <= 20 && phoneRegExp.test(phoneVal)) {
            $(eMsg).html("");
        } else {
            //       alert("error eMsg: " + eMsg);
            $(eMsg).html('Please enter a valid phone number (Intl format accepted + ext: or x:)');
            $(txtBox).focus();
        }
    }

    //-->
    </script>

   <style type="text/css">
    #iStudentApp label.error {
	    margin-left: 10px;
	    width: auto;
	    display: inline;
	    color:Red
    }
   </style>  
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" Runat="Server">
<script type="text/javascript">
    window.onload = function () {
        if (document.readyState == 'complete') {
            document.getElementById("hidUsingJS").value = "usingJS";
        };
    };
    </script>

    <h1><b>International Students</b></h1>
    <div id="global_subpage_image">     
            <menu class="SocialBarSub2">
                <ul class="social-boxes">
                    <li><a class="Facebook box" title="Facebook page" href="https://www.facebook.com/Communitycollegesofspokane"></a></li>                            
                   <!-- <li><a class="TwitterBird box" title="Twitter page" href="https://twitter.com/ccs_global"></a></li> -->                           
                    <li><a class="YouTube box" title="YouTube page" href=" https://www.youtube.com/channel/UC_eDihSP-7PT-JEhVQS8--Q"></a></li>
                    <li><a class="Instagram box" href="https://instagram.com/globaleducationccs/"></a></li>  
                </ul>
            </menu>
       </div>
    <h2><b>Application Form</b></h2>

        <asp:Label ID="lblDBmessage" runat="server" Text=""></asp:Label>

        <p class="sectionHeading">Personal Information</p> 
   
        <span style="color:#DD0000"><b><asp:Literal ID="errMsg" runat="server"></asp:Literal></b></span>
        <label for="txtFamilyName" id="familyName" class="fieldTitle">Family name *</label><br />
        <asp:TextBox Width="300px" ID="txtFamilyName" runat="server" BackColor="ControlLight" class="required" MaxLength="30"></asp:TextBox>
        <br /><div id="eFamName" class="divError" runat="server"></div>
        <p>
        <label for="txtFirstName" id="firstName" class="fieldTitle">First Name *</label><span style="font-size:x-small;">&nbsp;&nbsp;(Given Name)</span><br />
        <asp:TextBox ID="txtGivenName" runat="server" BackColor="ControlLight" Width="300px" MaxLength="20"></asp:TextBox>
        </p>
        <div id="eGivenName" class="divError" runat="server"></div>
        <p>
        <label for="txtMiddleNames" id="middleNames" class="fieldTitle">Middle Name(s),&nbsp;&nbsp;</label><span style="font-size:smaller;">if any</span><br />
        <asp:TextBox ID="txtMiddleNames" runat="server" Width="300px" MaxLength="75"></asp:TextBox>
        </p>
        <p>
        <label for="txtPreferredName" id="preferredName" class="fieldTitle">Preferred Name</label><br />        
        <asp:TextBox ID="txtPreferredName" runat="server" Width="300px" MaxLength="30"></asp:TextBox>
        </p>
        <p>
        <label for="txtMonth" id="dob" class="fieldTitle">Date of Birth * </label><span style="font-size:smaller;">&nbsp;&nbsp;(In the form mm/dd/yyyy)<br />
        <b>NOTE: Applicant must be 16 years of age by program start date</b>.</span><br />
        <asp:DropDownList ID="ddBirthMonth" runat="server"  BackColor="ControlLight">
            <asp:ListItem Value="00">Select month</asp:ListItem>
            <asp:ListItem Value="01">January</asp:ListItem>
            <asp:ListItem Value="02">February</asp:ListItem>
            <asp:ListItem Value="03">March</asp:ListItem>
            <asp:ListItem Value="04">April</asp:ListItem>
            <asp:ListItem Value="05">May</asp:ListItem>
            <asp:ListItem Value="06">June</asp:ListItem>
            <asp:ListItem Value="07">July</asp:ListItem>
            <asp:ListItem Value="08">August</asp:ListItem>
            <asp:ListItem Value="09">September</asp:ListItem>
            <asp:ListItem Value="10">October</asp:ListItem>
            <asp:ListItem Value="11">November</asp:ListItem>
            <asp:ListItem Value="12">December</asp:ListItem>
        </asp:DropDownList>
          
        <asp:TextBox ID="txtDay" runat="server" Width="30px" MaxLength="2" Text="DD" BackColor="ControlLight"></asp:TextBox>&nbsp;/&nbsp;
        <asp:TextBox ID="txtYear" runat="server" Width="60px" MaxLength="4" Text="YYYY" BackColor="ControlLight" onblur="CalculateAge()"></asp:TextBox>
        </p>
        <div id="eMM" class="divError" runat="server"></div><div id="eDD" class="divError" runat="server"></div><div id="eYYYY" class="divError" runat="server"></div>
        <p>
        <label for="radGender" id="gender" class="fieldTitle">Gender *</label><br />
        <asp:RadioButtonList ID="radGender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="flowBot" BackColor="ControlLight" Width="100%">
            <asp:ListItem>Male</asp:ListItem>
            <asp:ListItem>Female</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
        </asp:RadioButtonList>
        </p>
        <div id="eGender" class="divError" runat="server"></div>
        <p>
        <label for="radMStatus" id="maritalSTatus" class="fieldTitle">Marital Status *</label>
        <asp:RadioButtonList ID="radMStatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="flowBot" BackColor="ControlLight" Width="100%">
            <asp:ListItem>Married</asp:ListItem>
            <asp:ListItem>Unmarried</asp:ListItem>
        </asp:RadioButtonList>
        </p>
        <div id="eMarried" class="divError" runat="server"></div>
        <p>
        <label for="radStudentStatus" id="studentStatus" class="fieldTitle">Student Status *</label><br />
        <asp:RadioButtonList ID="radStudentStatus" runat="server" BackColor="ControlLight" 
            RepeatDirection="Horizontal" Width="100%" RepeatLayout="Flow" CssClass="flowBot">
                    <asp:ListItem>New Student</asp:ListItem>
                    <asp:ListItem>Transfer student</asp:ListItem>
                    <asp:ListItem>Returning CCS Student</asp:ListItem>
                </asp:RadioButtonList>
        </p>
        <div class="divHideTR">
            <p>Transfer students, please complete this <a href="/_netapps/internationalsa/Transfer_IN.pdf" target="_blank">form</a></p>
        </div>
        <script type="text/javascript">
            $("input:radio[name='ctl00$ContentHolder$radStudentStatus']").click(function () {
                var val = $("input:radio[name='ctl00$ContentHolder$radStudentStatus']:checked").val();
                if (val == "Transfer student") {
                    $('.divHideTR').show();
                }
                else {
                    $('.divHideTR').hide();
                }
            });
    </script>
        <div id="eStatus" class="divError" runat="server"></div>
        <p class="sectionHeading">Immigration Information</p>

        <p>
        <label for="ddCountryBirth" id="countryBirth" class="fieldTitle">Country of Birth *</label><br />
        <asp:DropDownList ID="ddCountryBirth" runat="server" BackColor="ControlLight">
           </asp:DropDownList>
        </p>
        <div id="eCountryOfBirth" class="divError" runat="server"></div>
        <p>
        <label for="ddCountryCitizeship" id="countryCitizenship" class="fieldTitle">Country of Citizenship *</label><br />
        <asp:DropDownList ID="ddCountryCitizenship" runat="server" BackColor="ControlLight">
                </asp:DropDownList>
        </p>
        <div id="eCountryOfCitizenship" class="divError" runat="server"></div>
       

        <p>
        <label for="radVisaType" id="visaType" class="fieldTitle">Visa Type</label><br />
        <asp:RadioButtonList ID="radVisaType" runat="server" RepeatDirection="Horizontal" style="margin-right: 3px" RepeatLayout="Flow" CssClass="flowBot">
                <asp:ListItem  Value="F-1">F-1 Student</asp:ListItem>
                <asp:ListItem  Value="J-1">J-1 Student</asp:ListItem>
                <asp:ListItem  Value="Other">Other</asp:ListItem>
            </asp:RadioButtonList>
        </p>

        <table width="100%">
        <tr>
            <td colspan="2">
            <label for="chkDependents" id="dependents" class="fieldTitle">Total number of dependents arriving <b>to the U.S.</b> with you.<br />
            Please submit a copy of each dependent passport.</label></td>
        </tr>
        <tr>
            <td style="width:48%">
                <asp:CheckBoxList ID="chkDependents" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem>None</asp:ListItem>
                <asp:ListItem>Spouse</asp:ListItem>
                <asp:ListItem>Children</asp:ListItem>
                </asp:CheckBoxList>
             </td>
             <td valign="top" style="width:52%"><b>Total number:</b>&nbsp;
                <asp:DropDownList ID="ddNumDependents" runat="server">
                        <asp:ListItem Value="0">Select one</asp:ListItem>
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
            </table>

        <p class="sectionHeading">Contact Information</p>
        <b>Please enter your permanent home country address</b><br />
        <label for="chkLiveHere" id="liveUS" class="fieldTitle"></label>
        <asp:CheckBox ID="chkLiveHere" runat="server" Text="I live in the US" />

        <p>
        <label for="txtPermAddress" id="permStreet" class="fieldTitle">Street Address *</label><br />
        <asp:TextBox ID="txtPermAddress" runat="server" Width="400px" BackColor="ControlLight" MaxLength="75"></asp:TextBox>
        </p>
        <div id="ePermAddress" class="divError" runat="server"></div>
        <table width="100%">
            <tr>
                <td><label for="txtPermCity" id="permCity" class="fieldTitle">City *</label></td>
                <td><label for="txtPermStateP" id="permStateP" class="fieldTitle">State/Province</label></td>
                <td><label for="txtPermZip" id="permZip" class="fieldTitle">Zip/Postal Code</label></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtPermCity" runat="server" MaxLength="30" Width="250px" BackColor="ControlLight"></asp:TextBox></td>
                <td><asp:TextBox ID="txtPermStateP" Width="250px" runat="server" MaxLength="30" BackColor="ControlLight"></asp:TextBox></td>
                <td><asp:TextBox ID="txtPermZip" Width="100px" runat="server" MaxLength="15" BackColor="ControlLight"></asp:TextBox></td>
            </tr>
            <tr>
                <td><div id="ePermCity" class="divError" runat="server"></div></td>
                <td><div id="ePermStateP" class="divError" runat="server"></div></td>
                <td><div id="ePermZip" class="divError" runat="server"></div></td>
            </tr>
        </table>
        <p>
        <label for="ddPermHomeCountry" id="permHomeCountry" class="fieldTitle">Home Country *</label><br />
        <asp:DropDownList ID="ddPermHomeCountry" runat="server" BackColor="ControlLight">
        </asp:DropDownList>
        </p>
        <div id="ePermHomeCountry" class="divError" runat="server"></div>
        <p>
        <label for="txtPermPhone" id="permPhone" class="fieldTitle">Phone *</label><br />
        <asp:TextBox ID="txtPermPhone" Width="150px" runat="server" BackColor="ControlLight"  onblur="ValidatePhone('PermPhone');"></asp:TextBox>
        </p>
        <div id="ePermPhone" class="divError" runat="server"></div>
        <p>
        <label for="txtPermEmail" id="permEmail" class="fieldTitle">Email *</label><br />
       <asp:TextBox ID="txtPermEmail" Width="200px" runat="server" MaxLength="75" BackColor="ControlLight"></asp:TextBox>
        </p>
        <div id="ePermEmail" class="divError" runat="server"></div>
        

        <div class="divHideParentAddr">
        <p>
        <label id="parentContact" class="fieldTitle"><span style="color:#DD0000;">Since your are under 18, you must enter your parent's address:</span></label>
        </p>
        <p>
        <label for="txtParentsName" id="parentsName" class="fieldTitle">Parent Names</label><br />
        <asp:TextBox ID="txtParentsName" runat="server" MaxLength="75" Width="400px"></asp:TextBox>
        </p>

        <p>
        <label for="txtParentsStreet" id="parentsStreet" class="fieldTitle">Parent's Street Address</label><br />
        <asp:TextBox ID="txtParentsStreet" runat="server" Width="400px" MaxLength="75"></asp:TextBox>
        </p>

        <table width="100%">
            <tr>
                <td><label for="txtParentsCity" id="parentsCity" class="fieldTitle">City</label></td>
                <td><label for="txtParentsState" id="parentsState" class="fieldTitle">State/Province</label></td>
                <td><label for="txtParentsZip" id="parentsZip" class="fieldTitle">Zip/Postal Code</label></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtParentsCity" runat="server" MaxLength="30" Width="250px"></asp:TextBox></td>
                <td><asp:TextBox ID="txtParentsState" Width="250px" runat="server" MaxLength="30"></asp:TextBox></td>
                <td><asp:TextBox ID="txtParentsZip" Width="100px" runat="server" MaxLength="15"></asp:TextBox></td>
            </tr>
        </table>
        
        <p>
        <label for="ddParentsCountry" id="parentsCountry" class="fieldTitle">Parent's Country of Citizenship</label><br />
        <asp:DropDownList ID="ddParentsCountry" runat="server">
                                </asp:DropDownList>
        </p>
        <div id="eParentCountry" class="divError"></div>
        <p>
        <label for="txtParentsPhone" id="Label6" class="fieldTitle">Parent's Phone</label><br />
        <asp:TextBox ID="txtParentsPhone" Width="150px" runat="server" onblur="ValidatePhone('ParentsPhone');"></asp:TextBox>
        </p>
        <div id="eParentsPhone" class="divError" runat="server"></div>
        <p>
        <label for="txtParentsEmail" id="lblParentEmail" class="fieldTitle">Parent's Email</label><br />
       <asp:TextBox ID="txtParentsEmail" Width="200px" runat="server" MaxLength="75"></asp:TextBox>
        </p>
        <div id="eParentEmail" class="divError" runat="server"></div>
        </div>
    
        <p class="sectionHeading">Agency/Advising Center Information (if applicable)</p>

        <table width="100%">
            <tr>
                <td style="width:75%"><label for="radAgency" id="useAgency">Did you use an agency or advising center for help in your application?</label></td>
                <td style="width:25%">
                <input type="radio" name="useAgency" id="useAgency_0" runat="server" class="agencyInfo" value="yes" /> Yes
                <input type="radio" name="useAgency" id="useAgency_1" runat="server" class="agencyInfo" value="no" /> No
                </td>
            </tr>
        </table>

        <div class="divHideAgency">
        <p>
        <label for="txtAgencyName" id="agencyName" class="fieldTitle">Agency Name</label><br />
        <asp:TextBox ID="txtAgencyName" runat="server" Width="300px" MaxLength="75"></asp:TextBox>
        </p>

        <p>
        <label for="txtAgencyContact" id="agencyContact" class="fieldTitle">Agency Contact Person</label><br />
        <asp:TextBox ID="txtAgencyContact" runat="server" Width="300px" MaxLength="75"></asp:TextBox>
        </p>

        <p>
        <label for="txtAgencyAddress" id="agencyAddress" class="fieldTitle">Agency Street Address</label><br />
        <asp:TextBox ID="txtAgencyAddress" runat="server" Width="400px" MaxLength="75"></asp:TextBox>
        </p>

        <table width="100%">
            <tr>
                <td><label for="txtAgencyCity" id="agencyCity" class="fieldTitle">Agency City</label></td>
                <td><label for="txtAgencyState" id="agencyState" class="fieldTitle">Agency State/Province</label></td>
                <td><label for="txtAgencyZip" id="agencyZip" class="fieldTitle">Agency Zip/Postal Code</label></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtAgencyCity" runat="server" Width="250px" MaxLength="30"></asp:TextBox></td>
                <td><asp:TextBox ID="txtAgencyState" Width="250px" runat="server" MaxLength="30"></asp:TextBox></td>
                <td><asp:TextBox ID="txtAgencyZip" Width="100px" runat="server" MaxLength="15"></asp:TextBox></td>
            </tr>
        </table>
        
        <p>
        <label for="ddAgencyCountry" id="agencyCountry" class="fieldTitle">Agency Country</label><br />
        <asp:DropDownList ID="ddAgencyCountry" runat="server">
             </asp:DropDownList>
        </p>

        <p>
        <label for="txtAgencyPhone" id="agencyPhone" class="fieldTitle">Agency Phone</label><br />
        <asp:TextBox ID="txtAgencyPhone" Width="150px" runat="server" onblur="ValidatePhone('AgencyPhone');"></asp:TextBox>
        </p>
        <div id="eAgencyPhone" class="divError" runat="server"></div>

        <p>
        <label for="txtAgencyEmail" id="agencyEmail" class="fieldTitle">Agency Email</label><br />
       <asp:TextBox ID="txtAgencyEmail" Width="200px" runat="server" MaxLength="75"></asp:TextBox>
        </p>
        <div id="eAgencyEmail" class="divError" runat="server"></div>
        </div>
        <script type="text/javascript">
            $("input:radio[name='ctl00$ContentHolder$useAgency']").click(function () {
                var val = $("input:radio[name='ctl00$ContentHolder$useAgency']:checked").val();
                if (val == "yes") {
                    $('.divHideAgency').show();
                }
                else {
                    $('.divHideAgency').hide();
                }
            });
        </script>

        <p class="sectionHeading">Emergency Contact Information</p>
        <p>
            Who should we contact in case of an emergency or medical situation?<br />
            <em>(Can be parents, or relatives/close friends in US)</em>
        </p>

        <p>
        <label for="txtEmergName" id="emergName" class="fieldTitle">Emergency Contact Name</label><br />
        <asp:TextBox ID="txtEmergName" Width="200px" runat="server" MaxLength="75"></asp:TextBox>
        </p>

        <p>
        <label for="txtEmergRelationship" id="emergRelationship" class="fieldTitle">Emergency Contact Relationship</label><br />
        <asp:TextBox ID="txtEmergRelationship" Width="200px" runat="server" MaxLength="30"></asp:TextBox>
        </p>

        <p>
        <label for="txtEmergPhone" id="emergPhone" class="fieldTitle">Emergency Contact Phone</label><br />
        <asp:TextBox ID="txtEmergPhone" Width="150px" runat="server" onblur="ValidatePhone('EmergPhone');"></asp:TextBox>
        </p>
        <div id="eEmergPhone" class="divError" runat="server"></div>
        
        <p>
        <label for="txtEmergEmail" id="emergEmail" class="fieldTitle">Emergency Contact Email</label><br />
        <asp:TextBox ID="txtEmergEmail" Width="200px" runat="server" MaxLength="75"></asp:TextBox>
        </p>
        <div id="eEmergEmail" class="divError" runat="server"></div>

        <p class="sectionHeading">Medical Information</p>

     <p>
        
        <label for="chkHealthIns" id="healthIns" class="fieldTitle">Health Insurance is required for all international students *</label><br />
        <input type="checkbox" name="chkHealthIns" runat="server" id="chkHealthIns" class="pContact" />
        <span class="fieldTitle">I understand I will be required to purchase health insurance through the college<br /></span>
     </p>   

     <div id="eHealthIns" class="divError" runat="server"></div>
     

     <p class="sectionHeading">Educational History</p>
     <p>
        <label for="txtHighSchool" id="highSchool" class="fieldTitle">Name of high school</label><br />
        <asp:TextBox ID="txtHighSchool" runat="server" Width="300px" MaxLength="50"></asp:TextBox>
    </p>

    <p><label for="radHSGrad" id="hsGrad">Did you graduate from high school?</label><br />
        <input type="radio" name="radHSGrad" id="hsGrad_0" runat="server" class="hsGrad" value="yes" /> Yes
        <input type="radio" name="radHSGrad" id="hsGrad_1" runat="server" class="hsGrad" value="no" /> No
    </p>
    <div class="divHideHSGrad">
        <label for="txtHSGradDate" id="gradDate" class="fieldTitle">Month and year of graduation *</label><br />
        <asp:TextBox ID="txtHSGradMonth" runat="server" Text="mm" MaxLength="2" Width="30px" BackColor="ControlLight"></asp:TextBox>
        &nbsp;&nbsp;/&nbsp;&nbsp;<asp:TextBox ID="txtHSGradYear" Text="yyyy" MaxLength="4" Width="60px" BackColor="ControlLight" runat="server"></asp:TextBox>
    </div>
    <div id="hideShowHSCP" class="divHideHSCP" runat="server">
        <p><label for="radHSCP" id="hscp">Do you want to study in the High School Completion Program (HSCP)?</label><br />
            <input type="radio" name="radHSCP" id="hscp_0" runat="server" class="hsGrad" value="yes" /> Yes
            <input type="radio" name="radHSCP" id="hscp_1" runat="server" class="hsGrad" value="no" /> No
        </p>
    </div>
    <div id="eHShistory" class="divError" runat="server"></div>
    <script type="text/javascript">
        $("input:radio[name='ctl00$ContentHolder$radHSGrad']").click(function () {
            var val = $("input:radio[name='ctl00$ContentHolder$radHSGrad']:checked").val();
            //alert("value: " + val);
            if (val == "yes") {
                $('.divHideHSGrad').show();
                $('.divHideHSCP').hide();
            }
            else {
                $('.divHideHSGrad').hide();
                $('.divHideHSCP').show();
            }
        });
        </script>
     <p>
        <label for="radEnglishAbility" id="englishAbility" class="fieldTitle">Do you have English proficiency?<a href="http://www.ccs.spokane.edu/GlobalEducation/Files/ProofProficiency.aspx" target="_blank" title="English proficiency requirements">&nbsp;See English proficiency requirements here</a>.</label>
         <br />
        <asp:RadioButtonList ID="radEnglishAbility" runat="server"
            RepeatDirection="Horizontal" style="margin-right: 3px" Width="500px" RepeatLayout="Flow" CssClass="flowBot">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
     </p>

        <br /><label for="radWhenStudy" id="whenStudy" class="fieldTitle">When would you like to begin your studies? *</label><br />
        <asp:RadioButtonList ID="radWhenStudy" runat="server" BackColor="ControlLight" RepeatDirection="Vertical" RepeatLayout="Flow" Width="100%" >
            <asp:ListItem>Winter/January 2018</asp:ListItem>
            <asp:ListItem>Spring/April 2018</asp:ListItem>
            <asp:ListItem>Summer/July 2018</asp:ListItem>
            <asp:ListItem>Fall/September 2018</asp:ListItem>
            <asp:ListItem>Winter/January 2019</asp:ListItem>
        </asp:RadioButtonList>
        <div id="eWhenStudy" class="divError" runat="server"></div>
<br /><br />
    <table width="100%">
        <tr>
            <td style="width:100%;"><label for="chkWhatStudy" id="lblWhatStudy" class="fieldTitle">What would you like to study? *&nbsp;&nbsp;
            <span style="font-size:smaller">Check all programs that relate to your studies at CCS.&nbsp;&nbsp;
            You may check more than one box.</span></label>
            </td>
        </tr>
        <tr>
            <td style="width:100%;background-color:#f0f0f0;">
            <asp:CheckBoxList ID="chkWhatStudy" name="chkWhatStudy" onclick="checkClickWhatStudy()" BackColor="ControlLight" Width="100%" RepeatDirection="Vertical" RepeatLayout="Flow" runat="server">
            <asp:ListItem Value="AA University Transfer Degree">AA University Transfer Degree</asp:ListItem>
            <asp:ListItem Value="AA Two Year Degree">AA Two-year Degree</asp:ListItem>
            <asp:ListItem Value="Intensive English (IELP)">Intensive English (IELP)</asp:ListItem>
            <asp:ListItem Value="Professional/Technical Degree">Professional/Technical Degree</asp:ListItem>
            <asp:ListItem Value="Certificate">Certificate</asp:ListItem>
            <asp:ListItem Value="HSCP">High School Completion Program (HSCP)</asp:ListItem>
            <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:CheckBoxList>
            </td>
        </tr>
        
        <tr>
            <td><label for="txtStudyOtherProg" id="otherProg" class="fieldTitle">If other, please specify</label>
            <asp:TextBox ID="txtStudyOtherProg" name="txtStudyOtherProgName" runat="server" MaxLength="100" Width="300px"></asp:TextBox>
        </td>
        </tr>
    </table>
    <div class="divHideTR">
        <table width="100%">
            <tr>
                <td style="width:100%;" colspan="2"><label for="chkTRschools" id="lblTRschools" class="fieldTitle">Choose University partners you are interested in for Conditional Admission.&nbsp;&nbsp;
                <span style="font-size:smaller">Check all that apply.</span></label>
                </td>
            </tr>
            <tr>
                <td style="width: 10%">&nbsp;</td>
                <td style="width:90%;">
                <asp:CheckBoxList ID="chkTRschools" BackColor="#c6ddcf" Width="100%" RepeatDirection="Vertical" RepeatLayout="Flow" runat="server">
                    <asp:ListItem Value="Carroll">Carroll College</asp:ListItem>
                    <asp:ListItem Value="EWU">Eastern Washington University</asp:ListItem>
                    <asp:ListItem Value="GU">Gonzaga University</asp:ListItem>
                    <asp:ListItem Value="NAU">Northern Arizona University</asp:ListItem>
                    <asp:ListItem Value="UofI">University of Idaho</asp:ListItem>
                    <asp:ListItem Value="WSU">Washington State University</asp:ListItem>
                    <asp:ListItem Value="WWU">Western Washington University</asp:ListItem>
                    <asp:ListItem Value="Whitworth">Whitworth University</asp:ListItem>
                    
                </asp:CheckBoxList>
                </td>
            </tr>
        </table>
    </div>
    <div id="eWhatProg" class="divError" runat="server"></div>
    <p>
     <label for="radWhereStudy" id="whereStudy" class="fieldTitle">Where would you like to study? * </label><br />
        <asp:RadioButtonList ID="radWhereStudy" runat="server" BackColor="ControlLight" RepeatDirection="Vertical" RepeatLayout="Flow" Width="100%">
        <asp:ListItem Value="SCC">Community Colleges of Spokane, SCC Campus (East Spokane)</asp:ListItem>
            <asp:ListItem Value="SFCC">Community Colleges of Spokane, SFCC Campus (West Spokane)</asp:ListItem>
            <asp:ListItem Value="Pullman">Community Colleges of Spokane, Pullman Campus (located 75 miles from Spokane)</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <div id="eWhereStudy" class="divError" runat="server"></div>
    <p>
        <label for="ddMajor" id="yourMajor" class="fieldTitle">What will be your major? *</label><br />
        <asp:DropDownList ID="ddMajor" name="ddMajor" runat="server" BackColor="ControlLight">
            <asp:ListItem Value="American Honors Program">American Honors Program</asp:ListItem>
            </asp:DropDownList>
   </p>
   <p>
   <label for="txtOtherMajor" id="lblOtherMajor" class="fieldTitle">If other, please specify</label>
   <asp:TextBox ID="txtOtherMajor" name="txtOtherMajor" runat="server" MaxLength="75" Width="300px"></asp:TextBox>
   </p>
   <div id="eWhatMajor" class="divError" runat="server"></div>


    <p class="sectionHeading">Financial Information</p>
    <p>
        <label for="chkHowPay" id="howPay" class="fieldTitle">How will you pay your tuition and living expenses? *</label><br />
        If you are sponsored, complete this <a href='http://www.ccs.spokane.edu/Forms/International-programs/ccs-40-214.aspx' target='_blank'>Affidavit of Financial Support</a>
        <asp:CheckBoxList ID="chkHowPay" name="chkHowPay" onclick="checkClickPay()" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" DisplayMode="HyperLink" BackColor="ControlLight" Width="100%">
            <asp:ListItem Value="Personal">Personal Funds</asp:ListItem>
            <asp:ListItem Value="Family">Family Funds</asp:ListItem>
            <asp:ListItem Value="Government">Government sponsorship from home country</asp:ListItem>
            <asp:ListItem Value="Company">Company sponsorship from home country</asp:ListItem>
            <asp:ListItem Value="US Sponsor" Text="Sponsor within the U.S."></asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
            </asp:CheckBoxList>
    </p>
    
    <p>
        <label for="txtOtherFinancing" id="otherFinancing" class="fieldTitle">If other, please specify</label><br />
        <asp:TextBox ID="txtOtherFinancing" name="txtOtherFinancing" runat="server" MaxLength="150" TextMode="MultiLine" Columns="60" Rows="4"></asp:TextBox>
    </p>
    <div id="eHowPay" class="divError" runat="server"></div>


    <p class="sectionHeading">Release of Information & Admission Policy *</p>
    <p></p>
      
        <table>
            <tr>
                <td style="background-color:ButtonFace;width:100%;"><input type="radio" id="ferpaYes" value="yes" name="ferpa" runat="server" />I authorize CCS to release academic, financial and immigration status information to my sponsor, educational agency and/or parents.
        <br />Review the <a href="http://www.ccs.spokane.edu/Forms/Student-services/ccs-40-200.aspx" target="_blank">FERPA (Family Educational Rights and Privacy Act) authorization</a><br /><br />
    
        <input type="radio" id="ferpaNo" value="no" name="ferpa" runat="server" />I decline to authorize release of any information.</td>
            </tr>
        </table>  
        
    
    
    <div id="eReleaseInformation" class="divError" runat="server"></div>
    <div id="studentApp_text">
    <br /><br />
        <b>ADMISSION POLICY</b><br />
        New students who use CCS's (SFCC or SCC) I-20 to enter the United States must:
        <ol>
            <li>Report in person to CCS's orientation session for new international students</li>
            <li>Enroll and attend as a full time student</li>
            <li>Present originals of passport, visa and CCS I-20**</li>
            <li>Purchase <a href="http://www.lewermark.com/ccspokane" target="_blank">health insurance</a> while enrolled at CCS</li>
            <li>Please <a href="http://www.ccs.spokane.edu/GlobalEducation/Files/Admissions/Admission-Requirements.aspx" target="_blank">view Admissions Requirements</a></li>
        </ol>
        **Students transferring from another U.S. school must submit their most recent I-20 as well as <a href="http://ccs.spokane.edu/Forms/International-programs/Transfer_IN.aspx" target="_blank">this Transfer In (Status Verification) form</a>.
        <br /><br />
        <asp:CheckBox ID="chkAgree" name="chkAgree" runat="server" BackColor="ControlLight" Text="&nbsp;&nbsp;By checking this box, I verify that, to the best of my knowledge, all the statements on this form are true." Width="100%" />
        <p>This school is authorized under Federal law to enroll nonimmigrant students.</p></div>
    <div id="eAgree" class="divError" runat="server"></div>
    <p>
        <label for="ddHowFindCCS" id="lblHowFindCCS" class="fieldTitle">How did you find out about CCS?</label><br />
        <asp:DropDownList ID="ddHowFindCCS" runat="server" CssClass="flowBot">
            <asp:ListItem Value="none selected">Please select one</asp:ListItem>
            <asp:ListItem>Agent</asp:ListItem>
            <asp:ListItem>Quad Learning as Agent</asp:ListItem>
            <asp:ListItem>College/Highschool Counselor</asp:ListItem>
            <asp:ListItem>Friend or Family</asp:ListItem>
            <asp:ListItem>Glocalize</asp:ListItem>
            <asp:ListItem>Internet: Study USA</asp:ListItem>
            <asp:ListItem>Internet: FPP Edufindme</asp:ListItem>
            <asp:ListItem>Internet: CCS Website</asp:ListItem>
            <asp:ListItem>Internet: Other</asp:ListItem>
            <asp:ListItem>Student Fair/Expo</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
        </asp:DropDownList>
    </p>  
    <input type="submit" title="submit form" value="submit" name="submit" class="submit" />
    <input type="hidden" id="hidUsingJS" name="hidUsingJS" value="no" />
    <input type="hidden" id="hidUnder18" name="hidUnder18" runat="server" value="no" />


</asp:Content>
