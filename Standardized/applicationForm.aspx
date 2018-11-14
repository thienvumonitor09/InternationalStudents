<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/HMccs.master" CodeFile="applicationForm.aspx.cs" Inherits="InternationalStudents_Standardized_applicationForm" %>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" Runat="Server">
    <script src="https://portal.ccs.spokane.edu/_netapps/internationalsa/Scripts/formRules.js" type="text/javascript"></script>
<script type="text/javascript">
    <!--
    function CalculateAge() {
        var mydate = new Date();
        var mm = $("#ContentHolder_ddBirthMonth").val();
        var dd = $("#ContentHolder_txtDay").val();
        var yy = $("#ContentHolder_txtYear").val();
        var stdAge = 18;

        var currdate = new Date();
        var currMM = currdate.getMonth() + 1;
        var currDD = currdate.getDate();
        var currYY = currdate.getFullYear();

        var age = currYY - yy;
        if(currMM < mm)
        {
            age--;
        }
        if(mm == currMM && currDD < dd)
        {
            age--;
        }
        if (age < stdAge) {
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
    .intlRadioList
    {
        padding-left:10px;
    }

    label
    {
        margin-left: 5px;
        margin-right: 15px;
    }
    input[type="radio"],
    input[type="checkbox"]
    {
        margin-left: 5px;
        margin-right: 10px;
    }

       .hsGrad
       {
           margin-left: 15px !important;
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
                            <div id="global_subpage_image">     
                        
                   </div>
              <!--  <h2><b>Application Form</b></h2>  -->

                    <asp:Label ID="lblDBmessage" runat="server" Text=""></asp:Label>

                    <h2>Personal Information</h2> 
   
                    <span style="color:#DD0000"><b><asp:Literal ID="errMsg" runat="server"></asp:Literal></b></span>
                    <p><label for="txtFamilyName" id="familyName" class="fieldTitle">Family name *</label><br />
                    <asp:TextBox Width="500px" ID="txtFamilyName" runat="server" BackColor="ghostwhite" class="required" MaxLength="30"></asp:TextBox>
                    </p>
                    <div id="eFamName" class="divError" runat="server"></div>
                    <p>
                    <label for="txtFirstName" id="firstName" class="fieldTitle">First Name *</label><span style="font-size:small;">&nbsp;&nbsp;(Given Name)</span><br />
                    <asp:TextBox ID="txtGivenName" runat="server" BackColor="ghostwhite" Width="500px" MaxLength="20"></asp:TextBox>
                    </p>
                    <div id="eGivenName" class="divError" runat="server"></div>
                    <p>
                    <label for="txtMiddleNames" id="middleNames" class="fieldTitle">Middle Name(s),&nbsp;</label><span style="font-size:small;">(if any)</span><br />
                    <asp:TextBox ID="txtMiddleNames" runat="server" Width="500px" MaxLength="75"></asp:TextBox>
                    </p>
                    <p>
                    <label for="txtPreferredName" id="preferredName" class="fieldTitle">Preferred Name</label><br />        
                    <asp:TextBox ID="txtPreferredName" runat="server" Width="500px" MaxLength="30"></asp:TextBox>
                    </p>
                    <p>
                    <label for="txtMonth" id="dob" class="fieldTitle">Date of Birth * </label><span style="font-size:small;">&nbsp;&nbsp;(In the form mm/dd/yyyy)<br />
                    <b>NOTE: Applicant must be 16 years of age by program start date</b>.</span><br />
                    <asp:DropDownList ID="ddBirthMonth" runat="server"  BackColor="ghostwhite" style="height:36px;margin-right:10px;">
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
          
                    <asp:TextBox ID="txtDay" runat="server" Width="36px" MaxLength="2" Text="DD" BackColor="ghostwhite"></asp:TextBox>&nbsp;/&nbsp;
                    <asp:TextBox ID="txtYear" runat="server" Width="60px" MaxLength="4" Text="YYYY" BackColor="ghostwhite"></asp:TextBox>
                    </p>
                    <div id="eMM" class="divError" runat="server"></div><div id="eDD" class="divError" runat="server"></div><div id="eYYYY" class="divError" runat="server"></div>
                    <p>
                    <label for="radGender" id="gender" class="fieldTitle">Gender *</label><br />
                    <asp:RadioButtonList ID="radGender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" class="intlRadioList" BackColor="ghostwhite" Width="100%">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:RadioButtonList>
                    </p>
                    <div id="eGender" class="divError" runat="server"></div>
                    <p>
                    <label for="radMStatus" id="maritalSTatus" class="fieldTitle">Marital Status *</label>
                    <asp:RadioButtonList ID="radMStatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" class="intlRadioList" BackColor="ghostwhite" Width="100%">
                        <asp:ListItem>Married</asp:ListItem>
                        <asp:ListItem>Unmarried</asp:ListItem>
                    </asp:RadioButtonList>
                    </p>
                    <div id="eMarried" class="divError" runat="server"></div>
                    <p>
                    <label for="radStudentStatus" id="studentStatus" class="fieldTitle">Student Status *</label><br />
                    <asp:RadioButtonList ID="radStudentStatus" runat="server" BackColor="ghostwhite" 
                        RepeatDirection="Horizontal" Width="100%" RepeatLayout="Flow" class="intlRadioList">
                                <asp:ListItem>New Student</asp:ListItem>
                                <asp:ListItem>Transfer student</asp:ListItem>
                                <asp:ListItem>Returning CCS Student</asp:ListItem>
                            </asp:RadioButtonList>
                    </p>
                    <p><span style="font-size:smaller;">(<em><b>If you are already in the U.S. on an F-1 visa, we consider you a transfer student</b></em>.)</span></p>
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
                    <h2>Immigration Information</h2>

                    <p>
                    <label for="ddCountryBirth" id="countryBirth" class="fieldTitle">Country of Birth *</label><br />
                    <asp:DropDownList ID="ddCountryBirth" runat="server" BackColor="ghostwhite">
                       </asp:DropDownList>
                    </p>
                    <div id="eCountryOfBirth" class="divError" runat="server"></div>
                    <p>
                    <label for="ddCountryCitizeship" id="countryCitizenship" class="fieldTitle">Country of Citizenship *</label><br />
                    <asp:DropDownList ID="ddCountryCitizenship" runat="server" BackColor="ghostwhite">
                            </asp:DropDownList>
                    </p>
                    <div id="eCountryOfCitizenship" class="divError" runat="server"></div>
                    <p>
                    <label for="radVisaType" id="visaType" class="fieldTitle">Visa Type</label><br />
                    <asp:RadioButtonList ID="radVisaType" runat="server" RepeatDirection="Horizontal" style="margin-right: 3px" RepeatLayout="Flow" class="intlRadioList">
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

                    <h2>Contact Information</h2>
                    <p><b>Please enter your permanent home country address</b></p>
                    <p>
                    <asp:CheckBox ID="chkLiveHere" runat="server" Text="I live in the US" /></p>
                    <p>
                    <label for="txtPermAddress" id="permStreet" class="fieldTitle">Street Address *</label><br />
                    <asp:TextBox ID="txtPermAddress" runat="server" Width="595px" BackColor="ghostwhite" MaxLength="75"></asp:TextBox>
                    </p>
                    <div id="ePermAddress" class="divError" runat="server"></div>
                    <table width="100%">
                        <tr>
                            <td><label for="txtPermCity" id="permCity" class="fieldTitle">City *</label></td>
                            <td><label for="txtPermStateP" id="permStateP" class="fieldTitle">State/Province</label></td>
                            <td><label for="txtPermZip" id="permZip" class="fieldTitle">Zip/Postal Code</label></td>
                        </tr>
                        <tr>
                            <td><asp:TextBox ID="txtPermCity" runat="server" MaxLength="30" Width="250px" BackColor="ghostwhite"></asp:TextBox></td>
                            <td><asp:TextBox ID="txtPermStateP" Width="250px" runat="server" MaxLength="30" BackColor="ghostwhite"></asp:TextBox></td>
                            <td><asp:TextBox ID="txtPermZip" Width="100px" runat="server" MaxLength="15" BackColor="ghostwhite"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><div id="ePermCity" class="divError" runat="server"></div></td>
                            <td><div id="ePermStateP" class="divError" runat="server"></div></td>
                            <td><div id="ePermZip" class="divError" runat="server"></div></td>
                        </tr>
                    </table>
                    <br />
                    <p>
                    <label for="ddPermHomeCountry" id="permHomeCountry" class="fieldTitle">Home Country *</label><br />
                    <asp:DropDownList ID="ddPermHomeCountry" runat="server" BackColor="ghostwhite"> 
                    </asp:DropDownList>
                    </p>
                    <div id="ePermHomeCountry" class="divError" runat="server"></div>
                    <p>
                    <label for="txtPermPhone" id="permPhone" class="fieldTitle">Phone *</label><br />
                    <asp:TextBox ID="txtPermPhone" Width="250px" runat="server" BackColor="ghostwhite"  onblur="ValidatePhone('PermPhone');"></asp:TextBox>
                    </p>
                    <div id="ePermPhone" class="divError" runat="server"></div>
                    <p>
                    <label for="txtPermEmail" id="permEmail" class="fieldTitle">Email *</label><br />
                   <asp:TextBox ID="txtPermEmail" Width="595px" runat="server" MaxLength="75" BackColor="ghostwhite"></asp:TextBox>
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
                    <asp:TextBox ID="txtParentsStreet" runat="server" Width="595px" MaxLength="75"></asp:TextBox>
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
                    <br />
                    <p>
                    <label for="ddParentsCountry" id="parentsCountry" class="fieldTitle">Parent's Country of Citizenship</label><br />
                    <asp:DropDownList ID="ddParentsCountry" runat="server">
                    </asp:DropDownList>
                    </p>
                    <div id="eParentCountry" class="divError"></div>
                    <p>
                    <label for="txtParentsPhone" id="Label6" class="fieldTitle">Parent's Phone</label><br />
                    <asp:TextBox ID="txtParentsPhone" Width="250px" runat="server" onblur="ValidatePhone('ParentsPhone');"></asp:TextBox>
                    </p>
                    <div id="eParentsPhone" class="divError" runat="server"></div>
                    <p>
                    <label for="txtParentsEmail" id="lblParentEmail" class="fieldTitle">Parent's Email</label><br />
                   <asp:TextBox ID="txtParentsEmail" Width="595px" runat="server" MaxLength="75"></asp:TextBox>
                    </p>
                    <div id="eParentEmail" class="divError" runat="server"></div>
                    </div>
    
                    <h2>Agency/Advising Center Information (if applicable)</h2>

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
                    <asp:TextBox ID="txtAgencyName" runat="server" Width="400px" MaxLength="75"></asp:TextBox>
                    </p>

                    <p>
                    <label for="txtAgencyContact" id="agencyContact" class="fieldTitle">Agency Contact Person</label><br />
                    <asp:TextBox ID="txtAgencyContact" runat="server" Width="400px" MaxLength="75"></asp:TextBox>
                    </p>

                    <p>
                    <label for="txtAgencyAddress" id="agencyAddress" class="fieldTitle">Agency Street Address</label><br />
                    <asp:TextBox ID="txtAgencyAddress" runat="server" Width="595px" MaxLength="75"></asp:TextBox>
                    </p>
                    
                    <table width="100%" style="margin-top:7px;margin-bottom:7px;">
                        <tr>
                            <td><label for="txtAgencyCity" id="agencyCity" class="fieldTitle" style="font-size:1.8rem;">Agency City</label></td>
                            <td><label for="txtAgencyState" id="agencyState" class="fieldTitle" style="font-size:1.8rem;">Agency State/Province</label></td>
                            <td><label for="txtAgencyZip" id="agencyZip" class="fieldTitle" style="font-size:1.8rem;">Agency Zip/Postal Code</label></td>
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
                    <asp:TextBox ID="txtAgencyPhone" Width="250px" runat="server" onblur="ValidatePhone('AgencyPhone');"></asp:TextBox>
                    </p>
                    <div id="eAgencyPhone" class="divError" runat="server"></div>

                    <p>
                    <label for="txtAgencyEmail" id="agencyEmail" class="fieldTitle">Agency Email</label><br />
                   <asp:TextBox ID="txtAgencyEmail" Width="595px" runat="server" MaxLength="75"></asp:TextBox>
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

                    <h2>Emergency Contact Information</h2>
                    <p>
                        Who should we contact in case of an emergency or medical situation?<br />
                        <em>(Can be parents, or relatives/close friends in US)</em>
                    </p>

                    <p>
                    <label for="txtEmergName" id="emergName" class="fieldTitle">Emergency Contact Name</label><br />
                    <asp:TextBox ID="txtEmergName" Width="400px" runat="server" MaxLength="75"></asp:TextBox>
                    </p>

                    <p>
                    <label for="txtEmergRelationship" id="emergRelationship" class="fieldTitle">Emergency Contact Relationship</label><br />
                    <asp:TextBox ID="txtEmergRelationship" Width="400px" runat="server" MaxLength="30"></asp:TextBox>
                    </p>

                    <p>
                    <label for="txtEmergPhone" id="emergPhone" class="fieldTitle">Emergency Contact Phone</label><br />
                    <asp:TextBox ID="txtEmergPhone" Width="250px" runat="server" onblur="ValidatePhone('EmergPhone');"></asp:TextBox>
                    </p>
                    <div id="eEmergPhone" class="divError" runat="server"></div>
        
                    <p>
                    <label for="txtEmergEmail" id="emergEmail" class="fieldTitle">Emergency Contact Email</label><br />
                    <asp:TextBox ID="txtEmergEmail" Width="595px" runat="server" MaxLength="75"></asp:TextBox>
                    </p>
                    <div id="eEmergEmail" class="divError" runat="server"></div>

                    <h2>Medical Information</h2>

                 <p>
        
                    <label for="chkHealthIns" id="healthIns" class="fieldTitle">Health Insurance is required for all international students *</label><br />
                    <input type="checkbox" name="chkHealthIns" runat="server" id="chkHealthIns" class="pContact" />
                    <span class="fieldTitle">I understand I will be required to purchase health insurance through the college<br /></span>
                 </p>   

                 <div id="eHealthIns" class="divError" runat="server"></div>
     

                 <h2>Educational History</h2>
                 <p>
                    <label for="txtHighSchool" id="highSchool" class="fieldTitle">Name of high school</label><br />
                    <asp:TextBox ID="txtHighSchool" runat="server" Width="595px" MaxLength="50"></asp:TextBox>
                </p>

                <p><label for="radHSGrad" id="hsGrad" class="fieldTitle">Did you graduate from high school?</label><br />
                    <input type="radio" name="radHSGrad" id="hsGrad_0" runat="server" class="hsGrad" value="yes" /> Yes
                    <input type="radio" name="radHSGrad" id="hsGrad_1" runat="server" class="hsGrad" value="no" /> No
                </p>
                <div class="divHideHSGrad">
                    <p><label for="txtHSGradDate" id="gradDate" class="fieldTitle">Month and year of graduation *</label><br />
                    <asp:TextBox ID="txtHSGradMonth" runat="server" Text="mm" MaxLength="2" Width="45px" BackColor="ghostwhite"></asp:TextBox>
                    &nbsp;&nbsp;/&nbsp;&nbsp;<asp:TextBox ID="txtHSGradYear" Text="yyyy" MaxLength="4" Width="60px" BackColor="ghostwhite" runat="server"></asp:TextBox></p>
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
                    <label for="radEnglishAbility" id="englishAbility" class="fieldTitle">Do you have English proficiency?
                         <% if(siteName=="SCC") { %><a href="https://sccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start/English-Proficiency-Requirements" target="_blank" title="English proficiency requirements">&nbsp;See English proficiency requirements here</a>
                        <% } else if(siteName=="SFCC") { %><a href="https://sfccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start/English-Proficiency-Requirements" target="_blank" title="English proficiency requirements">&nbsp;See English proficiency requirements here</a> 
                        <% } else { %><a href="https://sharedbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start/English-Proficiency-Requirements" target="_blank" title="English proficiency requirements">&nbsp;See English proficiency requirements here</a>
                        <% } %>.</label>
                     <br />
                    <asp:RadioButtonList ID="radEnglishAbility" runat="server"
                        RepeatDirection="Horizontal" style="margin-right: 3px" Width="500px" RepeatLayout="Flow" class="intlRadioList">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                 </p>

                    <p><label for="radWhenStudy" id="whenStudy" class="fieldTitle">When would you like to begin your studies? *</label><br />
                    <asp:RadioButtonList ID="radWhenStudy" runat="server" BackColor="ghostwhite" RepeatDirection="Vertical" RepeatLayout="Flow" Width="100%" class="intlRadioList">   
                         <asp:ListItem>Fall/September 2018</asp:ListItem>
                        <asp:ListItem>Winter/January 2019</asp:ListItem>
                        <asp:ListItem>Spring/April 2019</asp:ListItem>
                        <asp:ListItem>Summer/July 2019</asp:ListItem>
                        <asp:ListItem>Fall/September 2019</asp:ListItem>
                        <asp:ListItem>Winter/January 2020</asp:ListItem>
                    </asp:RadioButtonList>
                    <div id="eWhenStudy" class="divError" runat="server"></div></p>
            <p>
                <table width="100%">
                    <tr>
                        <td style="width:100%;"><p><label for="chkWhatStudy" id="lblWhatStudy" class="fieldTitle">What would you like to study? *&nbsp;&nbsp;
                        <span style="font-size:small">Check all programs that relate to your studies at CCS.&nbsp;&nbsp;
                        You may check more than one box.</span></label></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%;background-color:#f0f0f0;font-size:1.8rem;">
                        <asp:CheckBoxList ID="chkWhatStudy" name="chkWhatStudy" class="intlRadioList" onclick="checkClickWhatStudy()" BackColor="ghostwhite" Width="100%" RepeatDirection="Vertical" RepeatLayout="Flow" runat="server">
                        <asp:ListItem Value="AA University Transfer Degree">AA University Transfer Degree</asp:ListItem>
                        <asp:ListItem Value="AA Two Year Degree">AA Two-year Degree</asp:ListItem>
                        <asp:ListItem Value="Honors">Honors</asp:ListItem>
                        <asp:ListItem Value="Intensive English (IELP)">Intensive English (IELP)</asp:ListItem>
                        <asp:ListItem Value="Professional/Technical Degree">Professional/Technical Degree</asp:ListItem>
                        <asp:ListItem Value="Certificate">Certificate (One-year program)</asp:ListItem>
                        <asp:ListItem Value="HSCP">High School Completion Program (HSCP)</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:CheckBoxList>
                        </td>
                    </tr>
        
                    <tr>
                        <td><br /><label for="txtStudyOtherProg" id="otherProg" class="fieldTitle">If other, please specify</label>
                        <asp:TextBox ID="txtStudyOtherProg" name="txtStudyOtherProgName" runat="server" MaxLength="100" Width="300px"></asp:TextBox>
                    </td>
                    </tr>
                </table>
                </p>
                <div class="divHideTR">
                    <table width="100%">
                        <tr>
                            <td style="width:100%;" colspan="2"><label for="chkTRschools" id="lblTRschools" class="fieldTitle">Choose University partners you are interested in for Conditional Admission.&nbsp;&nbsp;
                            <span style="font-size:small">Check all that apply.</span></label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10%">&nbsp;</td>
                            <td style="width:90%;font-size:1.8rem;">
                            <asp:CheckBoxList ID="chkTRschools" class="intlRadioList" BackColor="#c6ddcf" Width="100%" RepeatDirection="Vertical" RepeatLayout="Flow" DisplayMode="HyperLink" runat="server">
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
                    <br />
                </div>
                <div id="eWhatProg" class="divError" runat="server"></div>
                <p>
                 <label for="radWhereStudy" id="whereStudy" class="fieldTitle">Where would you like to study? * </label><br />
                    <asp:RadioButtonList ID="radWhereStudy" runat="server" BackColor="ghostwhite" RepeatDirection="Vertical" RepeatLayout="Flow" Width="100%" CssClass="intlRadioList">
                    <asp:ListItem Value="SCC">Community Colleges of Spokane, SCC Campus (East Spokane)</asp:ListItem>
                        <asp:ListItem Value="SFCC">Community Colleges of Spokane, SFCC Campus (West Spokane)</asp:ListItem>
                        <asp:ListItem Value="Pullman">Community Colleges of Spokane, Pullman Campus (located 75 miles from Spokane)</asp:ListItem>
                    </asp:RadioButtonList>
                </p>
                <div id="eWhereStudy" class="divError" runat="server"></div>
                <p>
                    <label for="ddMajor" id="yourMajor" class="fieldTitle">What will be your major? *</label><br />
                    <asp:DropDownList ID="ddMajor" name="ddMajor" runat="server" BackColor="ghostwhite">
                        <asp:ListItem Value="American Honors Program">American Honors Program</asp:ListItem>
                        </asp:DropDownList>
               </p>
               <p>
               <label for="txtOtherMajor" id="lblOtherMajor" class="fieldTitle">If other, please specify</label>
               <asp:TextBox ID="txtOtherMajor" name="txtOtherMajor" runat="server" MaxLength="75" Width="300px"></asp:TextBox>
               </p>
               <div id="eWhatMajor" class="divError" runat="server"></div>


                <h2>Financial Information</h2>
                <p>
                    <label for="chkHowPay" id="howPay" class="fieldTitle">How will you pay your tuition and living expenses? *</label><br />
                    If you are sponsored, complete this <a href='https://sharedbeta.spokane.edu/getmedia/5734f8e4-b3eb-4a9d-9530-5dcabef4e683/ccs-40-214.aspx' target='_blank'>Affidavit of Financial Support</a>
                    <asp:CheckBoxList ID="chkHowPay" name="chkHowPay" onclick="checkClickPay()" class="intlRadioList" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow" DisplayMode="HyperLink" BackColor="ghostwhite" Width="100%">
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


                <h2>Release of Information & Admission Policy *</h2>
                <p></p>
      
                    <table>
                        <tr>
                            <td style="background-color:ghostwhite;padding-left:5px;width:100%;"><input type="radio" id="ferpaYes" value="yes" name="ferpa" runat="server" />I authorize CCS to release academic, financial and immigration status information to my sponsor, educational agency and/or parents.
                    &nbsp;Review the <a href="http://www.ccs.spokane.edu/Forms/Student-services/ccs-40-200.aspx" target="_blank">FERPA (Family Educational Rights and Privacy Act) authorization</a><br /><br />
    
                    <input type="radio" id="ferpaNo" value="no" name="ferpa" runat="server" />I decline to authorize release of any information.</td>
                        </tr>
                    </table>  
        
    
    
                <div id="eReleaseInformation" class="divError" runat="server"></div>
                <div id="studentApp_text">
                <br /><br />
                    <h2>ADMISSION POLICY</h2>
                    <p>New students who use CCS's (SFCC or SCC) I-20 to enter the United States must:</p>
                    <ol>
                        <li>Report in person to CCS's orientation session for new international students</li>
                        <li>Enroll and attend as a full time student</li>
                        <li>Present originals of passport, visa and CCS I-20**</li>
                        <li>Purchase <a href="http://www.lewermark.com/ccspokane" target="_blank">health insurance</a> while enrolled at CCS</li>
                        <li>Please 
                            <% if(siteName=="SCC") { %><a href="https://sccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start/What-Do-I-Need-to-Apply" target="_blank">view Admissions Requirements</a>
                            <% } else if(siteName=="SFCC") { %><a href="https://sfccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start/What-Do-I-Need-to-Apply" target="_blank">view Admissions Requirements</a>
                            <% } else { %><a href="https://sharedbeta.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start/What-Do-I-Need-to-Apply" target="_blank">view Admissions Requirements</a>
                            <% } %>
                        </li>
                    </ol>
                    <p>**Students transferring from another U.S. school must submit their most recent I-20 as well as <a href="https://sharedbeta.spokane.edu/getmedia/da915689-0ba2-492e-abd7-49e87be5a958/ccs-40-216.aspx" target="_blank">this Transfer In (Status Verification) form</a>.</p>
                    <p>
                    <asp:CheckBox ID="chkAgree" name="chkAgree" class="intlRadioList" runat="server" BackColor="ghostwhite" Text="By checking this box, I verify that, to the best of my knowledge, all my statements are true." Width="100%" /></p>
                    <p>This school is authorized under Federal law to enroll nonimmigrant students.</p></div>
                <div id="eAgree" class="divError" runat="server"></div>
                <p>
                    <label for="ddHowFindCCS" id="lblHowFindCCS" class="fieldTitle">How did you find out about CCS?</label><br />
                    <asp:DropDownList ID="ddHowFindCCS" runat="server" CssClass="flowBot">
                        <asp:ListItem Value="none selected">Please select one</asp:ListItem>
                        <asp:ListItem>Agent</asp:ListItem>
                        <asp:ListItem>American Honors as Agent</asp:ListItem>
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
                        <div class="button btn-group">
                            <input type="submit" title="submit form" value="submit" name="submit" class="FormButton btn btn-primary" /></div>
                            <input type="hidden" id="hidUsingJS" name="hidUsingJS" value="no" />
                            <input type="hidden" id="hidUnder18" name="hidUnder18" runat="server" value="no" />               
                        </div>
                    </div>
                </section>
            </section>
            <section class="col-xs-12 col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9">
                <div class="left-nav">
                    <h2><% if(siteName=="SCC") { %>
                        <a href="http://sccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student">I am an International Student</a>
                        <% } else if(siteName=="SFCC") { %>
                        <a href="http://sfccbeta.spokane.edu/Become-a-Student/I-am-an-International-Student">I am an International Student</a>
                        <% } else { %>
                        <a href="http://sharedbeta.spokane.edu/Become-a-Student/I-am-an-International-Student">I am an International Student</a><% } %></h2>
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
