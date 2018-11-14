<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/internationalGlobal2subpage.master" CodeFile="global2ApplicationForm.aspx.cs" Inherits="InternationalStudents_Standardized_ctcLinkReDo_global2ApplicationForm" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script src="../../../Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.validate.js" type="text/javascript"></script>
    <script src="../../../Scripts/additional-methods.js" type="text/javascript"></script>
    <script src="../../../Scripts/formRules.js" type="text/javascript"></script>


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
        //  alert("in check boxes");
        var countPay = $("#ContentHolder_chkHowPay input:checked").length;
        if (countPay < 1) {
            //   alert("countPay: " + countPay);
            $("#ContentHolder_eHowPay").append("You MUST select at least one method of payment");
        } else {
            document.getElementById('ContentHolder_eHowPay').innerHTML = '';
        }
        var countStudy = $("#ContentHolder_chkWhatStudy input:checked").length;
        if (countStudy < 1) {
            //  alert("countStudy: " + countStudy);
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
        // alert("in checkWhatStudy: " + countStudy);
        if (countStudy > 0) {
            document.getElementById('ContentHolder_eWhatProg').innerHTML = '';
        } else {
            $("#ContentHolder_eWhatProg").append("(2) You MUST select at least one program");
        }
        var checkedVal = $("#ContentHolder_chkWhatStudy input:checked").val();
       // alert("checked value: " + checkedVal);
        if (checkedVal == "University Transfer") {
            $('.divHideTR').show();
        }
        var unChecked = $("#ContentHolder_chkWhatStudy input:checkbox:not(:checked)").val();
       // alert("unchecked: " + unChecked);
        if (unChecked == "University Transfer") {
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


    <h1><b>Application Form</b></h1>

  <!--  <fieldset id="current" runat="server" visible="true" width="100%" title="application form" border="0"> -->
        <asp:Label ID="lblDBmessage" runat="server" Text=""></asp:Label>
        <p class="sectionHeading">Personal Information</p>    
        <span style="color:#DD0000"><b><asp:Literal ID="errMsg" runat="server"></asp:Literal></b></span>
        <label for="txtFamilyName" id="familyName" class="fieldTitle">Family name *</label><br />
        <asp:TextBox Width="300px" ID="txtFamilyName" runat="server" BackColor="ControlLight" class="required"></asp:TextBox>
        <br /><div id="eFamName" class="divError" runat="server"></div>
        <p>
        <label for="txtFirstName" id="firstName" class="fieldTitle">First Name *</label><span style="font-size:x-small;">&nbsp;&nbsp;(Given Name)</span><br />
        <asp:TextBox ID="txtGivenName" runat="server" BackColor="ControlLight" Width="300px"></asp:TextBox>
        </p>
        <div id="eGivenName" class="divError" runat="server"></div>
        <p>
        <label for="txtMiddleNames" id="middleNames" class="fieldTitle">Middle Name(s),&nbsp;&nbsp;</label><span style="font-size:smaller;">if any</span><br />
        <asp:TextBox ID="txtMiddleNames" runat="server" Width="300px"></asp:TextBox>
        </p>

        <p>
        <label for="txtMonth" id="dob" class="fieldTitle">Date of Birth * </label><span style="font-size:smaller;">&nbsp;&nbsp;(In the form mm/dd/yyyy)<br />
        <b>NOTE: Applicant must be 17 years of age by program start date</b>.</span><br />
        <asp:TextBox ID="txtMonth" runat="server" Width="30px" MaxLength="2" Text="MM" BackColor="ControlLight"></asp:TextBox>&nbsp;/&nbsp;
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
                <asp:ListItem Value="F-1">F-1 Student</asp:ListItem>
                <asp:ListItem Value="M-1">M-1 Student</asp:ListItem>
                <asp:ListItem Value="J-1">J-1 Student</asp:ListItem>
                <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:RadioButtonList>
        </p>

        <table width="100%">
        <tr>
            <td colspan="2">
            <label for="chkDependents" id="dependents" class="fieldTitle">Total number of dependents arriving with you</label></td>
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
        <asp:TextBox ID="txtPermAddress" runat="server" Width="400px" BackColor="ControlLight"></asp:TextBox>
        </p>
        <div id="ePermAddress" class="divError" runat="server"></div>
        <table width="100%">
            <tr>
                <td><label for="txtPermCity" id="permCity" class="fieldTitle">City *</label></td>
                <td><label for="txtPermStateP" id="permStateP" class="fieldTitle">State/Province</label></td>
                <td><label for="txtPermZip" id="permZip" class="fieldTitle">Zip/Postal Code</label></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtPermCity" runat="server" Width="250px" BackColor="ControlLight"></asp:TextBox></td>
                <td><asp:TextBox ID="txtPermStateP" Width="250px" runat="server" BackColor="ControlLight"></asp:TextBox></td>
                <td><asp:TextBox ID="txtPermZip" Width="100px" runat="server" BackColor="ControlLight"></asp:TextBox></td>
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
       <asp:TextBox ID="txtPermEmail" Width="200px" runat="server" BackColor="ControlLight"></asp:TextBox>
        </p>
        <div id="ePermEmail" class="divError" runat="server"></div>
        

        <div class="divHideParentAddr">
        <p>
        <label id="parentContact" class="fieldTitle"><span style="color:#DD0000;">If you are under 18, you must enter your parent's address:</span></label>
        </p>
        <p>
        <label for="txtParentsName" id="parentsName" class="fieldTitle">Parent Names</label><br />
        <asp:TextBox ID="txtParentsName" runat="server" Width="400px"></asp:TextBox>
        </p>

        <p>
        <label for="txtParentsStreet" id="parentsStreet" class="fieldTitle">Parent's Street Address</label><br />
        <asp:TextBox ID="txtParentsStreet" runat="server" Width="400px"></asp:TextBox>
        </p>

        <table width="100%">
            <tr>
                <td><label for="txtParentsCity" id="parentsCity" class="fieldTitle">City</label></td>
                <td><label for="txtParentsState" id="parentsState" class="fieldTitle">State/Province</label></td>
                <td><label for="txtParentsZip" id="parentsZip" class="fieldTitle">Zip/Postal Code</label></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtParentsCity" runat="server" Width="250px"></asp:TextBox></td>
                <td><asp:TextBox ID="txtParentsState" Width="250px" runat="server"></asp:TextBox></td>
                <td><asp:TextBox ID="txtParentsZip" Width="100px" runat="server"></asp:TextBox></td>
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
       <asp:TextBox ID="txtParentsEmail" Width="200px" runat="server"></asp:TextBox>
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
        <asp:TextBox ID="txtAgencyName" runat="server" Width="300px"></asp:TextBox>
        </p>

        <p>
        <label for="txtAgencyContact" id="agencyContact" class="fieldTitle">Agency Contact Person</label><br />
        <asp:TextBox ID="txtAgencyContact" runat="server" Width="300px"></asp:TextBox>
        </p>

        <p>
        <label for="txtAgencyAddress" id="agencyAddress" class="fieldTitle">Agency Street Address</label><br />
        <asp:TextBox ID="txtAgencyAddress" runat="server" Width="400px"></asp:TextBox>
        </p>

        <table width="100%">
            <tr>
                <td><label for="txtAgencyCity" id="agencyCity" class="fieldTitle">Agency City</label></td>
                <td><label for="txtAgencyState" id="agencyState" class="fieldTitle">Agency State/Province</label></td>
                <td><label for="txtAgencyZip" id="agencyZip" class="fieldTitle">Agency Zip/Postal Code</label></td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtAgencyCity" runat="server" Width="250px"></asp:TextBox></td>
                <td><asp:TextBox ID="txtAgencyState" Width="250px" runat="server"></asp:TextBox></td>
                <td><asp:TextBox ID="txtAgencyZip" Width="100px" runat="server"></asp:TextBox></td>
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
        <!--
        <p>
        <label for="txtAgencyFAX" id="agencyFAX" class="fieldTitle">Agency FAX</label><br />
       <asp:TextBox ID="txtAgencyFAX" Width="150px" runat="server"></asp:TextBox>
        </p>
        <div id="eAgencyFAX" class="divError" runat="server"></div>
        -->
        <p>
        <label for="txtAgencyEmail" id="agencyEmail" class="fieldTitle">Agency Email</label><br />
       <asp:TextBox ID="txtAgencyEmail" Width="200px" runat="server"></asp:TextBox>
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
<!--
        <p class="sectionHeading">Where would you like your I-20 sent? *<br />
            <asp:RadioButtonList ID="radI20" runat="server" BackColor="#2a59a5" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="flowBot" Width="100%" Height="25px">
            <asp:ListItem Value="current">Current Address</asp:ListItem>
            <asp:ListItem Value="parent">Parent's Address</asp:ListItem>
            <asp:ListItem Value="agency">Agency/Advising Center/Other</asp:ListItem>
    </asp:RadioButtonList></p>
    <br />
    <div id="eRadI20" class="divError" runat="server"></div>
-->
        <p class="sectionHeading">Emergency Contact Information</p>
        <p>
            Who should we contact in case of an emergency or medical situation?<br />
            <em>(Can be parents, or relatives/close friends in US (preferred) or home country)</em>
        </p>

        <p>
        <label for="txtEmergName" id="emergName" class="fieldTitle">Emergency Contact Name</label><br />
        <asp:TextBox ID="txtEmergName" Width="200px" runat="server"></asp:TextBox>
        </p>

        <p>
        <label for="txtEmergRelationship" id="emergRelationship" class="fieldTitle">Emergency Contact Relationship</label><br />
        <asp:TextBox ID="txtEmergRelationship" Width="200px" runat="server"></asp:TextBox>
        </p>

        <p>
        <label for="txtEmergPhone" id="emergPhone" class="fieldTitle">Emergency Contact Phone</label><br />
        <asp:TextBox ID="txtEmergPhone" Width="150px" runat="server" onblur="ValidatePhone('EmergPhone');"></asp:TextBox>
        </p>
        <div id="eEmergPhone" class="divError" runat="server"></div>
        
        <p>
        <label for="txtEmergEmail" id="emergEmail" class="fieldTitle">Emergency Contact Email</label><br />
        <asp:TextBox ID="txtEmergEmail" Width="200px" runat="server"></asp:TextBox>
        </p>
        <div id="eEmergEmail" class="divError" runat="server"></div>

        <p class="sectionHeading">Medical Information</p>
<!--
        <p><label for="radSpecialNeeds" id="specialNeeds">Do you require any special physical or learning accommodations??</label><br />
                <input type="radio" runat="server" name="radSpecialNeeds" id="specialNeeds_0" class="specialNeedsBox" value="yes" /> Yes
                <input type="radio" runat="server" name="radSpecialNeeds" id="specialNeeds_1" class="specialNeedsBox" value="no" /> No
        </p>
    <div class="divHideSpecialNeeds">
        <p>
        <label for="txtAreaNeeds" id="sNeeds" class="fieldTitle">Please describe what special physical or learning accommodations you need.</label><br />
        <asp:TextBox ID="txtAreaNeeds" runat="server" Columns="80" Rows="5" TextMode="MultiLine"></asp:TextBox>
        </p>
    </div>

    <script type="text/javascript">
        $("input:radio[name='ctl00$ContentHolder$radSpecialNeeds']").click(function () {
            var val = $("input:radio[name='ctl00$ContentHolder$radSpecialNeeds']:checked").val();
            if (val == "yes") {
                $('.divHideSpecialNeeds').show();
            }
            else {
                $('.divHideSpecialNeeds').hide();
            }
        });
     </script>
-->
     <p>
        
        <label for="chkHealthIns" id="healthIns" class="fieldTitle">Health Insurance is required for all international students *</label><br />
        <input type="checkbox" name="chkHealthIns" runat="server" id="chkHealthIns" class="pContact" />
        <span class="fieldTitle">I understand I will be required to purchase health insurance through the college<br />
        <span style="font-style:italic; font-size:smaller;">(only exception is for students attending through government-sponsored programs such as SACM)</span></span>
     </p>   

     <div id="eHealthIns" class="divError" runat="server"></div>
     

     <p class="sectionHeading">Educational History</p>
     <p>
        <label for="txtHighSchool" id="highSchool" class="fieldTitle">Name of high school you are/have attended</label><br />
        <asp:TextBox ID="txtHighSchool" runat="server" Width="300px"></asp:TextBox>
    </p>

    <p><label for="radHSGrad" id="hsGrad">Are you a high school graduate?</label><br />
        <input type="radio" name="radHSGrad" id="hsGrad_0" runat="server" class="hsGrad" value="yes" /> Yes
        <input type="radio" name="radHSGrad" id="hsGrad_1" runat="server" class="hsGrad" value="no" /> No
    </p>
    <div class="divHideHSGrad">
        <label for="txtHSGradDate" id="gradDate" class="fieldTitle">Month and year of graduation *</label><br />
        <asp:TextBox ID="txtHSGradMonth" runat="server" Text="mm" MaxLength="2" Width="30px" BackColor="ControlLight"></asp:TextBox>
        &nbsp;&nbsp;/&nbsp;&nbsp;<asp:TextBox ID="txtHSGradYear" Text="yyyy" MaxLength="4" Width="60px" BackColor="ControlLight" runat="server"></asp:TextBox>
    </div>

    <script type="text/javascript">
        $("input:radio[name='ctl00$ContentHolder$radHSGrad']").click(function () {
            var val = $("input:radio[name='ctl00$ContentHolder$radHSGrad']:checked").val();
            //alert("value: " + val);
            if (val == "yes") {
                $('.divHideHSGrad').show();
            }
            else {
                $('.divHideHSGrad').hide();
            }
        });
        </script>

    <p>
        <label for="radEnglishAbility" id="englishAbility" class="fieldTitle">Do you have English proficiency? 
        <a href="http://www.ccs.spokane.edu/GlobalEducation/Files/ProofProficiency.aspx" target="_blank" title="English proficiency requirements">See English proficiency requirements here</a>.</label><br />
        <asp:RadioButtonList ID="radEnglishAbility" runat="server"
            RepeatDirection="Horizontal" style="margin-right: 3px" Width="500px" RepeatLayout="Flow" CssClass="flowBot">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:RadioButtonList>
        </p>

        <br /><label for="radWhenStudy" id="whenStudy" class="fieldTitle">When would you like to begin your studies? *</label><br />
        <asp:RadioButtonList ID="radWhenStudy" runat="server" BackColor="ControlLight" RepeatDirection="Vertical" RepeatLayout="Flow" Width="100%" >
            <asp:ListItem>Fall/September 2015</asp:ListItem>
            <asp:ListItem>Winter/January 2016</asp:ListItem>
            <asp:ListItem>Spring/April 2016</asp:ListItem>
            <asp:ListItem>Summer/July 2016</asp:ListItem>
            <asp:ListItem>Fall/September 2016</asp:ListItem>
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
            <asp:ListItem Value="University Transfer">Two-year Transfer Degree</asp:ListItem>
            <asp:ListItem Value="American Honors">American Honors</asp:ListItem>
            <asp:ListItem Value="Intensive English (IELP)">Intensive English (IELP)</asp:ListItem>
            <asp:ListItem Value="Professional/Technical Degree">Professional/Technical Degree</asp:ListItem>
            <asp:ListItem Value="Certificate">Certificate</asp:ListItem>
            <asp:ListItem Value="Other">Other</asp:ListItem>
            </asp:CheckBoxList>
            </td>
        </tr>
        
        <tr>
            <td><label for="txtStudyOtherProg" id="otherProg" class="fieldTitle">If other, please specify</label>
            <asp:TextBox ID="txtStudyOtherProg" name="txtStudyOtherProg" runat="server" Width="300px"></asp:TextBox>
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
                    <asp:ListItem Value="EWU">Eastern Washington University</asp:ListItem>
                    <asp:ListItem Value="GU">Gonzaga University</asp:ListItem>
                    <asp:ListItem Value="UofI">University of Idaho</asp:ListItem>
                    <asp:ListItem Value="WSU">Washington State University</asp:ListItem>
                    <asp:ListItem Value="Whitworth">Whitworth University</asp:ListItem>
                    <asp:ListItem Value="NAU">Northern Arizona University</asp:ListItem>
                </asp:CheckBoxList>
                </td>
            </tr>
        </table>
    </div>

    <p>
        <div id="eWhatProg" class="divError" runat="server"></div>
    </p>
    <p>
     <label for="radWhereStudy" id="whereStudy" class="fieldTitle">Where would you like to study? * </label><br />
        <asp:RadioButtonList ID="radWhereStudy" runat="server" BackColor="ControlLight" RepeatDirection="Vertical" RepeatLayout="Flow" Width="100%">
        <asp:ListItem Value="SCC">Community Colleges of Spokane, SCC Campus (East Spokane)</asp:ListItem>
            <asp:ListItem Value="SFCC">Community Colleges of Spokane, SFCC Campus (West Spokane)</asp:ListItem>
            <asp:ListItem Value="Pullman">Community Colleges of Spokane, Pullman Campus (Pullman, WA)</asp:ListItem>
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
   <asp:TextBox ID="txtOtherMajor" name="txtOtherMajor" runat="server" Width="300px"></asp:TextBox>
   </p>
   <div id="eWhatMajor" class="divError" runat="server"></div>

   <!--
   <p>
        <label for="ddHowLongStay" id="howLongStay" class="fieldTitle">How long to you plan attending CCS? *</label><br />
        <asp:DropDownList ID="ddHowLongStay" name="ddHowLongStay" runat="server" BackColor="ControlLight">
            <asp:ListItem Value="">Choose One</asp:ListItem>
            <asp:ListItem>3 months/1 quarter</asp:ListItem>
            <asp:ListItem>6 months/2 quarter</asp:ListItem>
            <asp:ListItem>9 months/Academic Year</asp:ListItem>
            <asp:ListItem>More than 1 year</asp:ListItem>
            </asp:DropDownList>
    </p>
    <div id="eHowLongStay" class="divError" runat="server"></div>
    -->

    <p class="sectionHeading">Financial Information</p>
    <p>
        <label for="chkHowPay" id="howPay" class="fieldTitle">How will you pay your tuition and living expenses? *</label><br />
        <asp:CheckBoxList ID="chkHowPay" name="chkHowPay" onclick="checkClickPay()" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" DisplayMode="HyperLink" BackColor="ControlLight" Width="100%">
            <asp:ListItem Value="Personal">Personal Funds</asp:ListItem>
            <asp:ListItem Value="Family">Family Funds</asp:ListItem>
            <asp:ListItem Value="Government">Government sponsorship from home country</asp:ListItem>
            <asp:ListItem Value="Company">Company sponsorship from home country</asp:ListItem>
            <asp:ListItem Value="US Sponsor" Text="Sponsor with the U.S. (<a href='http://www.uscis.gov/portal/site/uscis/menuitem.5af9bb95919f35e66f614176543f6d1a/?vgnextoid=fe3647a55773d010VgnVCM10000048f3d6a1RCRD&vgnextchannel=db029c7755cb9010VgnVCM10000045f3d6a1RCRD' target='_blank'>I-134 Required</a>)"></asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
            </asp:CheckBoxList>
    </p>
    
    <p>
        <label for="txtOtherFinancing" id="otherFinancing" class="fieldTitle">If other, please specify</label><br />
        <asp:TextBox ID="txtOtherFinancing" name="txtOtherFinancing" runat="server" TextMode="MultiLine" Columns="60" Rows="4"></asp:TextBox>
    </p>
    <div id="eHowPay" class="divError" runat="server"></div>

    <p><label for="radPaymentOption" id="lblPayOption" class="fieldTitle">Which payment option will you use to pay for the application fee? *</label><br />
        <asp:RadioButtonList ID="radPayOption" name="radPayOption" runat="server" BackColor="ControlLight" RepeatDirection="Vertical" RepeatLayout="Flow" Width="100%">
            <asp:ListItem Value="credit card"></asp:ListItem>
            <asp:ListItem Value="check"></asp:ListItem>
            <asp:ListItem Value="money order">Money Order (from U.S bank)</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    
    <div class="divHideCC">
        <span style="font-size:larger"><b>Your payment option is: Credit Card</b></span><br /><br />
            CCS accepts payments by Visa or Mastercard. Download and print the <a href="../../Credit_card_authorization_form.pdf" target="_blank">Credit Card Authorization Form</a> and 
            <ul>
                <li>fax it to (509) 533-8683 or</li>
                <li>email it to globalprograms@ccs.spokane.edu</li>
            </ul>
    </div>
    <script type="text/javascript">
        $("input:radio[name='ctl00$ContentHolder$radPayOption']").click(function () {
            var val = $("input:radio[name='ctl00$ContentHolder$radPayOption']:checked").val();
            if (val == "credit card") {
                $('.divHideCC').show();
            }
            else {
                $('.divHideCC').hide();
            }
        });
        </script>
    <div id="ePaymentOption" class="divError" runat="server"></div>

   <!--

        <p class="sectionHeading">Housing Information</p>
    <p>Housing placements are made in the order completed applications and placement fees are received. &nbsp;
    Preferences are met based on availability.</p>
    <p>
   <label for="chkOwnHousing" id="ownHousing">I have or will find my own housing</label>
   <input type="checkbox" runat="server" name="chkOwnHousing" id="chkOwnHousing" class="oHousing" /> 
   </p>
    <div class="divHideHousingAddress">
        <p>
            <label for="txtUSaddress" id="USaddress" class="fieldTitle">Please provide the U.S. address if known.</label><br />
            <asp:TextBox ID="txtUSaddress" runat="server" Columns="60" Rows="5" TextMode="MultiLine"></asp:TextBox>
        </p>
    </div>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.oHousing').change(function () {
                    $('.divHideHousingAddress').toggle();
                });
            });
        </script>

    <b>CCS has two housing choices for new applicants. What is your preference?</b>
    <br />
    <table width="100%">
        <tr>
            <td colspan="2">Homestay Program - <span style="font-size:x-small">Please complete the Homestay section</span></td>
        </tr>
        <tr>
            <td colspan="2"><asp:RadioButtonList ID="radHomeStay" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <asp:ListItem Value="1">1st&nbsp;&nbsp;</asp:ListItem>
                <asp:ListItem Value="2">2nd&nbsp;&nbsp;</asp:ListItem>
            </asp:RadioButtonList></td>
            
        </tr>
        <tr>
            <td colspan="2">Apartment living</td>
        </tr>
        <tr>
            <td colspan="2">
            <asp:RadioButtonList ID="radApartmentLiving" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Value="1">1st&nbsp;&nbsp;</asp:ListItem>
            <asp:ListItem Value="2">2nd</asp:ListItem>
            </asp:RadioButtonList></td>
        </tr>
    </table>
    <div id="eHomeApt" class="divError" runat="server"></div>
    -->
<!--
<input type="radio" name="radHomeStay" id="radHomeStay_0" runat="server" class="homeStay" value="1" /> 1st
<input type="radio" name="radHomeStay" id="radHomeStay_1" class="homeStay" runat="server" value="2" /> 2nd
<input type="radio" name="radApartmentLiving" id="radApartmentLiving_0" runat="server" class="aptLiving" value="1" /> 1st
<input type="radio" name="radApartmentLiving" id="radApartmentLiving_1" class="aptLiving" runat="server" value="2" /> 2nd
-->
<!--
    <div class="divHideShowHomeStay">
    <p><b>Home Stay Applicants complete this section</b></p>
    <table width="100%">
        <tr>
            <td class="homeStay">
                <b>What type of family do you prefer?</b><br />
    This information will be provided to your prospective Homestay family.<br /> 
    -->
    <!--
    <input type="checkbox" name="chkFamilyType" id="chkFamilyType_0" class="familyType" value="no kids" /> Famlily (without children)<br />
    <input type="checkbox" name="chkFamilyType" id="chkFamilyType_1" class="familyType" value="small kids" /> Family (with small children)<br />
    <input type="checkbox" name="chkFamilyType" id="chkFamilyType_2" class="familyType" value="teenagers" /> Family (with teenagers)<br />
    <input type="checkbox" name="chkFamilyType" id="chkFamilyType_3" class="familyType" value="international" /> Family (with international students)<br />
    -->
    <!--
    <asp:CheckBoxList ID="chkFamilyType" name="chkFamilyType" runat="server" Width="100%" RepeatDirection="Vertical" RepeatLayout="Flow">
    <asp:ListItem Value="no kids">Famlily without children</asp:ListItem>
    <asp:ListItem Value="small kids">Family with small children</asp:ListItem>
    <asp:ListItem Value="teenagers">Family with teenagers</asp:ListItem>
    <asp:ListItem Value="international">Family with international students</asp:ListItem>
    </asp:CheckBoxList>
    <br /><br />
    <label for="radFood" id="labelRadFood">Are there foods you cannot or will not eat?</label>
    <input type="radio" name="radFood" id="radFood_0" runat="server" class="foodEat" value="yes" /> Yes
    <input type="radio" name="radFood" id="radFood_2" runat="server" class="foodEat" value="no" /> No
      <div class="divHideFoodEat">
        <label for="txtNoFood" id="labelNoFood" class="fieldTitle">Please list the foods</label><br />
        <asp:TextBox ID="txtNoFood" runat="server" Columns="40" Rows="5" TextMode="MultiLine"></asp:TextBox>
      </div>
-->
    <!--
    <p class="homeStay">
    <label for="radCookOwnMeals" id="labelCookOwn">Do you like to cook your own meals?</label>
    <input type="radio" name="radCookOwnMeals" id="radCookOwnMeals_0" value="yes" /> Yes
    <input type="radio" name="radCookOwnMeals" id="radCookOwnMeals_1" value="no" /> No
    <input type="radio" name="radCookOwnMeals" id="radCookOwnMeals_2" value="sometimes" /> Sometimes
    </p>
    -->
    <!--
    <p class="homeStay">
    <label for="radCookOwnMeals" id="label1">Do you like to cook your own meals?</label>
        <asp:RadioButtonList ID="radCookOwnMeals" name="radCookOwnMeals" runat="server" BackColor="ControlLight" Width="100%"
         RepeatDirection="Vertical" RepeatLayout="Flow">
            <asp:ListItem Value="yes">Yes</asp:ListItem>
            <asp:ListItem Value="no">No</asp:ListItem>
            <asp:ListItem Value="sometimes">Sometimes</asp:ListItem>
        </asp:RadioButtonList>
    </p>

    <p class="homeStay">
    <label for="radSmoke" id="labelSmoke">Do you smoke?</label>
    <input type="radio" name="radSmoke" id="radSmoke_0" runat="server" value="yes" /> Yes
    <input type="radio" name="radSmoke" id="radSmoke_1" runat="server" value="no" /> No
    </p>

    <p class="homeStay">
    <label for="txtReligion" id="labelRelition">Do you have any religious requirements or preferences?</label><br />
    <asp:TextBox ID="txtReligion" Columns="40" Rows="4" TextMode="MultiLine" runat="server"></asp:TextBox>
    </p>
            </td>
        </tr>
    </table>
    

    </div>
    <script type="text/javascript">
        $("input:radio[name='ctl00$ContentHolder$radHomeStay']").click(function () {
            var val = $("input:radio[name='ctl00$ContentHolder$radHomeStay']:checked").val();
            //           alert("value: " + val);
            if (val == "1") {
                $('.divHideShowHomeStay').show();
            }
            if (val == "2") {
                $('.divHideShowHomeStay').show();
            }
        });

        $("input:radio[name='ctl00$ContentHolder$radFood']").click(function () {
            var val = $("input:radio[name='ctl00$ContentHolder$radFood']:checked").val();
            //           alert("value: " + val);
            if (val == "yes") {
                $('.divHideFoodEat').show();
            }
            else {
                $('.divHideFoodEat').hide();
            }
        });
        </script>

    -->
 
    <p class="sectionHeading">Release of Information & Admission Policy *</p>
    <p>   
        <asp:RadioButtonList ID="radReleaseInformation" runat="server" BackColor="ControlLight" Width="100%" RepeatDirection="Vertical" RepeatLayout="Flow">
        <asp:ListItem Value="yes">I authorize CCS to release academic records and immigration status information to my sponsor, educational agency and/or parents</asp:ListItem>
        <asp:ListItem Value="no">I decline to authorize release of any information</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <div id="eReleaseInformation" class="divError" runat="server"></div>
    <div id="studentApp_text">
    <br /><br />
        <b>ADMISSION POLICY</b><br />
        New students who use CCS's (SFCC or SCC) I-20 to enter the United States must:
        <ol>
        <li>Report in person to CCS's orientation session for new international students</li>
        <li>Enroll and attend the first quarter at CCS</li>
        <li>Present originals of passport, visa, I-94 and CCS I-20**</li>
        <li>Carry <b><a href="http://www.lewermark.com/ccs" target="_blank">health insurance</a></b> while enrolled at CCS</li>
        </ol>
        **Students transferring from another U.S. school must present their most recent I-20 as well as <a href="https://portal.ccs.spokane.edu/_netapps/internationalsa/Transfer_IN.pdf" target="_blank">this Transfer In (Status Verification) form</a>.
        <br /><br />
        <asp:CheckBox ID="chkAgree" name="chkAgree" runat="server" BackColor="ControlLight" Text="&nbsp;&nbsp;By checking this box, I verify that, to the best of my knowledge, all the statements on this form are true." Width="100%" />
        <p>This school is authorized under Federal law to enroll nonimmigrant students.</p></div>
    <div id="eAgree" class="divError" runat="server"></div>
    <p>
        <label for="ddHowFindCCS" id="lblHowFindCCS" class="fieldTitle">How did you find out about CCS?</label><br />
        <asp:DropDownList ID="ddHowFindCCS" runat="server" CssClass="flowBot">
            <asp:ListItem Value="none selected">Please select one</asp:ListItem>
            <asp:ListItem>Agent</asp:ListItem>
            <asp:ListItem>American Honors as Agent</asp:ListItem>
            <asp:ListItem>Internet: Study USA</asp:ListItem>
            <asp:ListItem>Internet: CHEGG</asp:ListItem>
            <asp:ListItem>Internet: FPP Edufindme</asp:ListItem>
            <asp:ListItem>Internet: CCS Website</asp:ListItem>
            <asp:ListItem>Internet: Other</asp:ListItem>
            <asp:ListItem>College/Highschool Counselor</asp:ListItem>
            <asp:ListItem>Student Fair/Expo</asp:ListItem>
            <asp:ListItem>Friend or Family</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
        </asp:DropDownList>
    </p>  
        <input type="submit" title="submit form" value="submit" name="submit" class="submit" />
    <input type="hidden" id="hidUsingJS" name="hidUsingJS" value="no" />
    <input type="hidden" id="hidUnder18" name="hidUnder18" runat="server" value="no" />
<!--    </fieldset> -->
</asp:Content>
