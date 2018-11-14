using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

public partial class InternationalStudents_Standardized_applicationForm : System.Web.UI.Page
{
    // int iCount;
    DateTime tempDate;
    string strSubmitMsg = "";
    bool autoReply = true;
    const string MatchEmailPattern =
            @"^(([\w-]+\.)+[\w-]+|([a-zA-Z]{1}|[\w-]{2,}))@"
     + @"((([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?
				[0-9]{1,2}|25[0-5]|2[0-4][0-9])\."
     + @"([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?
				[0-9]{1,2}|25[0-5]|2[0-4][0-9])){1}|"
     + @"([a-zA-Z]+[\w-]+\.)+[a-zA-Z]{2,4})$";
    const string MatchUSPhonePattern =
        @"/^(\+?1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/";
    const string MatchIntlPhonePattern =
        @"/^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}(\s*(ext|x)\s*\.?:?\s*([0-9]+))?$/";

    const string MatchDatePattern = "^(1[0-2]|0[1-9]|\\d)\\/(20\\d{2}|19\\d{2}|0(?!0)\\d|[1-9]\\d)$";
    public static String intlEmail = "globalprograms@ccs.spokane.edu";
    //public static String intlEmail = "trina.allen@ccs.spokane.edu";
   // public static String intlEmail = "Jacquelyn.Cordy@ccs.spokane.edu";
   // public static String intlEmail = "laura.padden@ccs.spokane.edu";

    // country of citizenship where no auto email will be sent
    public static readonly string[] noAutoEmail = { "Bangladesh", "Bhutan", "India", "Nepal", "Nigeria", "Pakistan", "Sri Lanka" };

    protected void Page_Load(object sender, EventArgs e)
    {
        InternationalStudent myIStudent = new InternationalStudent();
        if (!Page.IsPostBack)
        {
                txtFamilyName.Focus();
                DataTable dtMajors = new DataTable();
                dtMajors = myIStudent.getMajors();
                ddMajor.Items.Clear();
                ddMajor.Items.Add(new ListItem("Choose One", ""));
                ddMajor.Items.Add(new ListItem("English only", "English Only"));
                ddMajor.Items.Add(new ListItem("Undecided", "Undecided"));
                ddMajor.Items.Add(new ListItem("Other", "Other"));
                foreach (DataRow dtMajorRow in dtMajors.Rows)
                {
                    if (dtMajorRow["ProgramTitle"].ToString().Trim() != "a quick test")
                    {
                        if (dtMajorRow["ProgramTitle"].ToString().Trim().Length > 50)
                            ddMajor.Items.Add(new ListItem(dtMajorRow["ProgramTitle"].ToString().Substring(0, 50), dtMajorRow["ProgramTitle"].ToString().Substring(0, 50)));
                        else
                            ddMajor.Items.Add(new ListItem(dtMajorRow["ProgramTitle"].ToString(), dtMajorRow["ProgramTitle"].ToString()));
                    }// eliminate Brandy's test item
                }

                DataTable dtIStu = new DataTable();
                dtIStu = myIStudent.GetIntlStudentCountries();
                if (dtIStu.Rows.Count > 0)
                {
                    ddCountryBirth.Items.Clear();
                    ddCountryBirth.Items.Add(new ListItem("Choose One", ""));
                    ddCountryCitizenship.Items.Clear();
                    ddCountryCitizenship.Items.Add(new ListItem("Choose One", ""));
                    ddPermHomeCountry.Items.Clear();
                    ddPermHomeCountry.Items.Add(new ListItem("Choose One", ""));
                    ddParentsCountry.Items.Clear();
                    ddParentsCountry.Items.Add(new ListItem("Choose One", ""));
                    ddAgencyCountry.Items.Clear();
                    ddAgencyCountry.Items.Add(new ListItem("Choose One", ""));

                    foreach (DataRow dtRow in dtIStu.Rows)
                    {
                        ddCountryBirth.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["countryName"].ToString()));
                        ddCountryCitizenship.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["countryName"].ToString()));
                        ddPermHomeCountry.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["countryName"].ToString()));
                        ddParentsCountry.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["countryName"].ToString()));
                        ddAgencyCountry.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["countryName"].ToString()));
                    }
                }
        }// end is not a postback

        if (IsPostBack)
        {
            /*************************************************************************************************************
             * is a postback so 
             * see if coming from javascript enabled brower
             *      if so --> finish validating some fields and write records
             *      if not --> validate all fields and write records
             * **********************************************************************************************************/
            string hidValue = Request.Form["hidUsingJS"];
            string hid18 = hidUnder18.Value;
            string txtMonth = ddBirthMonth.SelectedValue;
            // Response.Write("is javascript enabled: " + hidValue + "<br />");
            int testInt;

            if (hidValue == "no")
            {
                // javascript is NOT enabled so need to validate server side
                if (txtFamilyName.Text.Trim() == "")
                {
                    Response.Write("in family name<br />");
                    eFamName.InnerText = "<b>Enter your family name</b>";
                    txtFamilyName.Focus();
                    return;
                }
                if (txtGivenName.Text.Trim() == "")
                {
                    eGivenName.InnerText = "<b>Enter your first name (given name)</b>";
                    txtGivenName.Focus();
                    return;
                }

                if (ddBirthMonth.SelectedValue == "00")
                {
                    eMM.InnerText = "<b>Select a valid birth month</b>";
                    ddBirthMonth.Focus();
                    return;
                }

                if (!int.TryParse(txtMonth, out testInt))
                {
                    eMM.InnerText = "<b>Select a valid birth month</b>";
                    ddBirthMonth.Focus();
                    return;
                }

                if (!int.TryParse(txtDay.Text, out testInt))
                {
                    eDD.InnerText = "<b>Enter a valid birth day</b>";
                    txtDay.Focus();
                    return;
                }
                if (!int.TryParse(txtYear.Text, out testInt))
                {
                    eYYYY.InnerText = "<b>Enter a valid birth year</b>";
                    txtYear.Focus();
                    return;
                }
                if (!DateTime.TryParse(txtMonth + "/" + txtDay.Text + "/" + txtYear, out tempDate))
                {
                    eMM.InnerText = "<b>Enter a valid Date of Birth in the form month/dd/yyyy</b>";
                    ddBirthMonth.Focus();
                    return;
                }
                if (radGender.SelectedIndex == -1)
                {
                    eGender.InnerText = "<b>Indicate your gender</b>";
                    radGender.Focus();
                    return;
                }
                if (radMStatus.SelectedIndex == -1)
                {
                    eMarried.InnerText = "<b>Indicate your marital status</b>";
                    radMStatus.Focus();
                    return;
                }
                if (radStudentStatus.SelectedIndex == -1)
                {
                    eStatus.InnerHtml = "<b>Indicate your student status</b>";
                    radStudentStatus.Focus();
                    return;
                }
                if (ddCountryBirth.SelectedIndex == -1)
                {
                    eCountryOfBirth.InnerHtml = "<b>Select your country of birth</b>";
                    ddCountryBirth.Focus();
                    return;
                }
                if (ddCountryCitizenship.SelectedIndex == -1)
                {
                    eCountryOfCitizenship.InnerHtml = "<b>Select your country of citizenship</b>";
                    ddCountryCitizenship.Focus();
                    return;
                }
                if (txtPermAddress.Text.Trim() == "")
                {
                    ePermAddress.InnerHtml = "<b>Please enter your permanent address</b>";
                    txtPermAddress.Focus();
                    return;
                }
                if (txtPermCity.Text.Trim() == "")
                {
                    ePermCity.InnerHtml = "<b>Please enter your permanent city</b>";
                    txtPermCity.Focus();
                    return;
                }
                if (chkLiveHere.Checked)
                {
                    if (txtPermStateP.Text.Trim() == "")
                    {
                        ePermStateP.InnerHtml = "<b>Please enter your permanent State/Province</b>";
                        txtPermStateP.Focus();
                        return;
                    }
                    if (txtPermZip.Text.Trim() == "")
                    {
                        ePermZip.InnerHtml = "<b>Please enter your permanent zip code</b>";
                        txtPermZip.Focus();
                        return;
                    }
                }
                if (ddPermHomeCountry.SelectedIndex == -1)
                {
                    ePermHomeCountry.InnerHtml = "<b>Please select your permanent home country</b>";
                    ddPermHomeCountry.Focus();
                    return;
                }

                if (txtPermEmail.Text.Trim() == "")
                {
                    ePermEmail.InnerHtml = "<b>Please enter an email address</b>";
                    txtPermEmail.Focus();
                    return;
                }
                else
                {
                    //have a value in the email so try to match it to the regular expression
                    if (Regex.IsMatch(txtPermEmail.Text, MatchEmailPattern))
                    {
                        ePermEmail.InnerHtml = "<b>Please enter a valid email address</b>";
                        txtPermEmail.Focus();
                        return;
                    }
                }

                // if under 18 must fill in the parent address information
                if (hid18 == "yes")
                {
                    if (txtParentsPhone.Text.Trim() != "")
                    {
                        if (Regex.IsMatch(txtParentsPhone.Text, MatchIntlPhonePattern))
                        {
                            eParentsPhone.InnerHtml = "<b>Please enter a valid phone number or leave blank</b>";
                            txtParentsPhone.Focus();
                            return;
                        }
                    }

                    if (txtParentsEmail.Text.Trim() != "")
                    {
                        if (Regex.IsMatch(txtParentsEmail.Text, MatchEmailPattern))
                        {
                            eParentEmail.InnerHtml = "<b>Please enter a valid email address or leave blank</b>";
                            txtParentsEmail.Focus();
                            return;
                        }
                    }
                }// end hid18 is 'yes'

                if (txtAgencyPhone.Text.Trim() != "")
                {
                    if (Regex.IsMatch(txtAgencyPhone.Text, MatchIntlPhonePattern))
                    {
                        eAgencyPhone.InnerHtml = "<b>Please enter a valid phone number or leave blank</b>";
                        txtAgencyPhone.Focus();
                        return;
                    }
                }

                if (txtAgencyEmail.Text.Trim() != "")
                {
                    if (Regex.IsMatch(txtAgencyEmail.Text, MatchEmailPattern))
                    {
                        eAgencyEmail.InnerHtml = "<b>Please enter a valid email address or leave blank</b>";
                        txtAgencyEmail.Focus();
                        return;
                    }
                }

                if (txtEmergPhone.Text.Trim() != "")
                {
                    if (Regex.IsMatch(txtEmergPhone.Text, MatchIntlPhonePattern))
                    {
                        eEmergPhone.InnerHtml = "<b>Please enter a valid phone number or leave blank</b>";
                        txtEmergPhone.Focus();
                        return;
                    }
                }

                if (txtEmergEmail.Text.Trim() != "")
                {
                    if (Regex.IsMatch(txtEmergEmail.Text, MatchEmailPattern))
                    {
                        eEmergEmail.InnerHtml = "<b>Please enter a valid email address or leave blank</b>";
                        txtEmergEmail.Focus();
                        return;
                    }
                }

                if (!chkHealthIns.Checked)
                {
                    eHealthIns.InnerHtml = "<b>Please choose your health insurance coverage</b>";
                    chkHealthIns.Focus();
                    return;
                }

                if (radWhenStudy.SelectedIndex == -1)
                {
                    eWhenStudy.InnerHtml = "<b>Please select when you would like to being your studies</b>";
                    radWhenStudy.Focus();
                    return;
                }
                if (chkWhatStudy.SelectedIndex == -1)
                {
                    eWhatProg.InnerHtml = "<b>Please select all programs that you would like to study</b>";
                    chkWhatStudy.Focus();
                    return;
                }
                if (radWhereStudy.SelectedIndex == -1)
                {
                    eWhereStudy.InnerHtml = "<b>Please select where you would like to study</b>";
                    radWhereStudy.Focus();
                    return;
                }
                if (ddMajor.SelectedIndex == -1)
                {
                    eWhatMajor.InnerHtml = "<b>Please select your major</b>";
                    ddMajor.Focus();
                    return;
                }

                if (ddMajor.SelectedValue == "Other" && txtOtherMajor.Text.Trim().Length == 0)
                {
                    eWhatMajor.InnerHtml = "<b>You have indicated 'Other' for your major. Please specify in the text box.</b>";
                    txtOtherMajor.Focus();
                    return;
                }

                if (chkHowPay.SelectedIndex == -1)
                {
                    eHowPay.InnerHtml = "<b>Please select how you will pay your tuition and living expenses</b>";
                    chkHowPay.Focus();
                    return;
                }

                if (!chkAgree.Checked)
                {
                    eAgree.InnerHtml = "<b>Please indicate that your statements are true and you agree to the policies</b>";
                    chkAgree.Focus();
                    return;
                }
            }// end of server-side validation only

            if (ddMajor.SelectedValue == "Other" && txtOtherMajor.Text.Trim().Length == 0)
            {
                eWhatMajor.InnerHtml = "<b>You have indicated 'Other' for your major. Please specify in the text box.</b>";
                txtOtherMajor.Focus();
                return;
            }

            if (txtPermPhone.Text.Trim() == "")
            {
                ePermPhone.InnerHtml = "";
                return;
            }
            if (chkLiveHere.Checked)
            {
                //live in the US so validate for US phone
                if (Regex.IsMatch(txtPermPhone.Text, MatchUSPhonePattern) && txtPermPhone.Text.Trim().Length > 9)
                {
                    ePermPhone.InnerHtml = "<b>Please enter a valid US phone number</b>";
                    return;
                }
                if (txtPermStateP.Text.Trim() == "")
                {
                    ePermStateP.InnerHtml = "<b>Please enter your permanent State/Province</b>";
                    txtPermStateP.Focus();
                    return;
                }
                if (txtPermZip.Text.Trim() == "")
                {
                    ePermZip.InnerHtml = "<b>Please enter your permanent zip code</b>";
                    txtPermZip.Focus();
                    return;
                }
            }
            else
            {
                // in US NOT checked so validate for an international phone number
                if (Regex.IsMatch(txtPermPhone.Text, MatchIntlPhonePattern))
                {
                    ePermPhone.InnerHtml = "<b>Please enter a valid international phone number</b>";
                    return;
                }
            }
            /*
            if (hsGrad_1.Checked && (!hscp_0.Checked && !hscp_1.Checked))
            {
                eHShistory.InnerHtml = "<b>If you have not graduated from high school, please indicate if you want to study in the High School Completion Program (HSCP)</b>";
                hideShowHSCP.Attributes["class"] = "divShowHSCP";
                hscp_0.Focus();
                return;
            }
            */
            if (hsGrad_1.Checked && (!hscp_0.Checked && !hscp_1.Checked))
            {
                eHShistory.InnerHtml = "<b>If you have not graduated from high school, please indicate if you want to study in the High School Completion Program (HSCP)</b>";
                hsGrad_0.Focus();
                return;
            }

            //email fields:
            string sendTo = "";
            string sentFrom = "";
            string strSubj = "";
            string strBody = "";
            string strCCaddresses = "";
            string strEmailResult = "";
            DateTime tempGradDate;
            string tempNoDependents = "";
            string tempSpouse = "";
            string tempChildren = "";
            string strBlank = "";
            string ackHealth = "";

            int tempAgency;
            int tempEnglish;
            int tempHSGrad;
            int tempHSCP = 0;
            string strOtherMajor = "";
            string strMajor = "";
            char tempRelease;
            char tempAll;
            int tempBit;
            DateTime dteSubmit;
            int newID = 0;
            int checkCount = 0;
            string whatStudy = "";
            bool otherTrue = false;
            bool goodSubmit = true;

            for (int j = 0; j < chkWhatStudy.Items.Count; j++)
            {
                if (chkWhatStudy.Items[j].Selected)
                {
                    if (checkCount == 0)
                    {
                        whatStudy = chkWhatStudy.Items[j].Value;
                        checkCount = 1;
                    }
                    else
                        whatStudy += "; " + chkWhatStudy.Items[j].Value;
                    checkCount++;
                    if (chkWhatStudy.Items[j].Value == "Other")
                        otherTrue = true;
                }// end if selected
            }// end for loop
            if (checkCount == 0)
            {
                eWhatProg.InnerHtml = "<b>Please select a program of study</b>";
                chkWhatStudy.Focus();
                return;
            }
            else
            {
                if (otherTrue && txtStudyOtherProg.Text.Trim().Length > 0)
                {
                    if (whatStudy.Length == 0)
                        whatStudy = txtStudyOtherProg.Text.Trim().Replace("'", "''");
                    else
                        whatStudy += "; " + txtStudyOtherProg.Text.Trim().Replace("'", "''");
                }
            }

            checkCount = 0;
            string trSchools = "";
            for (int k = 0; k < chkTRschools.Items.Count; k++)
            {
                if (chkTRschools.Items[k].Selected)
                {
                    if (checkCount == 0)
                    {
                        trSchools = chkTRschools.Items[k].Value;
                        checkCount = 1;
                    }
                    else
                        trSchools += "; " + chkTRschools.Items[k].Value;
                    checkCount++;
                }// end if selected
            }// end for loop

            checkCount = 0;
            string howPayTuition = "";
            otherTrue = false;
            for (int k = 0; k < chkHowPay.Items.Count; k++)
            {
                if (chkHowPay.Items[k].Selected)
                {
                    if (checkCount == 0)
                    {
                        checkCount = 1;
                        howPayTuition = chkHowPay.Items[k].Value;
                    }
                    else
                        howPayTuition += "; " + chkHowPay.Items[k].Value;
                    checkCount++;
                    if (chkHowPay.Items[k].Value == "Other")
                        otherTrue = true;
                }// end if item is selected
            }// end for loop
            if (checkCount == 0)
            {
                eHowPay.InnerHtml = "<b>Please indicate how you will pay for tuition";
                return;
            }
            else
            {
                if (otherTrue && txtOtherFinancing.Text.Trim().Length == 0)
                {
                    eHowPay.InnerHtml = "If you select 'Other', you must specify in the text box below";
                    txtOtherFinancing.Focus();
                    return;
                }
            }



            string howHearCCS = "";
            howHearCCS = ddHowFindCCS.SelectedValue;
            if (txtMonth == "00")
            {
                eMM.InnerHtml = "Enter a valid date in the form 'month/dd/yyyy'";
                ddBirthMonth.Focus();
            }
            if (!DateTime.TryParse(txtMonth + "/" + txtDay.Text.Trim() + "/" + txtYear.Text.Trim(), out tempDate))
            {
                eMM.InnerHtml = "Enter a valid date in the form 'month/dd/yyyy'";
                ddBirthMonth.Focus();
            }
            // get the values of the items checked in the dependents checkboxlist - chkDependents
            for (int i = 0; i < chkDependents.Items.Count; i++)
            {
                if (chkDependents.Items[i].Selected)
                {
                    if (chkDependents.Items[i].Value == "None")
                        tempNoDependents = "none";
                    else if (chkDependents.Items[i].Value == "Spouse")
                        tempSpouse = "spouse";
                    else
                        tempChildren = "children";
                }// end if selected
            }// end for loop
            if (chkLiveHere.Checked)
                tempBit = 1;
            else
                tempBit = 0;

            if (ferpaYes.Checked)
                tempRelease = 'y';
            else
                tempRelease = 'n';

            if (chkHealthIns.Checked)
                ackHealth = "agree";
            else
                ackHealth = "";

            if (chkAgree.Checked)
                tempAll = 'y';
            else
                tempAll = 'n';

            if (useAgency_0.Checked)
                tempAgency = 1;
            else
                tempAgency = 0;

            tempEnglish = 0;

            if (hsGrad_0.Checked)
            {
                tempHSGrad = 1;
                tempHSCP = 0;
            }
            else
            {
                tempHSGrad = 0;
                // Not a high school graduate so get value for High School Completion Program response 
                if (hscp_0.Checked)
                    tempHSCP = 1;
                else
                    tempHSCP = 0;
            }

            if (!DateTime.TryParse(txtHSGradMonth.Text.Trim() + "/1/" + txtHSGradYear.Text.Trim(), out tempGradDate))
                tempGradDate = System.Convert.ToDateTime("01/01/1900");

            dteSubmit = DateTime.Now;

            try
            {
                strSubmitMsg = myIStudent.InsertStudentApplicationDataREDO(txtFamilyName.Text.Trim().Replace("'", "''"), txtGivenName.Text.Trim().Replace("'", "''"), txtMiddleNames.Text.Trim().Replace("'", "''"),
                    tempDate, radGender.SelectedValue, radStudentStatus.SelectedValue, ddCountryBirth.SelectedValue, ddCountryCitizenship.SelectedValue,
                    radEnglishAbility.SelectedValue, radVisaType.SelectedValue.ToString(), Convert.ToInt32(ddNumDependents.SelectedValue.ToString()),
                    tempSpouse, tempChildren, tempBit, tempAgency,
                    ackHealth, tempRelease, tempAll, ddHowFindCCS.SelectedValue, dteSubmit, radMStatus.SelectedValue, txtPreferredName.Text.Trim().Replace("'", "''"));
                lblDBmessage.Text = strSubmitMsg;


                if (int.TryParse(strSubmitMsg, out newID))
                {
                    /************************************************************************************
                     * submit the contact information, one group at a time:
                     *  address codes:  1:  permanent address
                     *                  2:  parent's address (if different)
                     *                  3:  agency address (if any)
                     *                  4:  relative address (if in US)
                     *                  5:  emergency contact address
                     *  applicant ID has been found and stored in App_Code file
                     * ********************************************************************************/

                    strSubmitMsg = myIStudent.InsertContactInfo(newID, 1, txtGivenName.Text.Trim().Replace("'", "''") + " " + txtFamilyName.Text.Trim().Replace("'", "''"), strBlank, txtPermAddress.Text.Trim().Replace("'", "''"), txtPermCity.Text.Trim().Replace("'", "''"), txtPermStateP.Text.Trim().Replace("'", "''"),
                        txtPermZip.Text.Trim().Replace("'", "''"), ddPermHomeCountry.SelectedValue, txtPermPhone.Text.Trim().Replace("'", "''"), strBlank, txtPermEmail.Text.Trim().Replace("'", "''"), strBlank, 0);
                    // if (chkParentsContact.Checked)
                    if (hid18 == "yes")
                    {
                        // process the parent's contact information since it is different from applicants
                        strSubmitMsg = myIStudent.InsertContactInfo(newID, 2, txtParentsName.Text.Trim().Replace("'", "''"), strBlank, txtParentsStreet.Text.Trim().Replace("'", "''"), txtParentsCity.Text.Trim().Replace("'", "''"), txtParentsState.Text.Trim().Replace("'", "''"),
                            txtParentsZip.Text.Trim().Replace("'", "''"), ddParentsCountry.SelectedValue, txtParentsPhone.Text.Trim().Replace("'", "''"), strBlank, txtParentsEmail.Text.Trim().Replace("'", "''"), strBlank, 0);
                    }

                    if (useAgency_0.Checked)
                    {
                        // process agency address
                        strSubmitMsg = myIStudent.InsertContactInfo(newID, 3, txtAgencyContact.Text.Trim().Replace("'", "''"), txtAgencyName.Text.Trim().Replace("'", "''"), txtAgencyAddress.Text.Trim().Replace("'", "''"), txtAgencyCity.Text.Trim().Replace("'", "''"), txtAgencyState.Text.Trim().Replace("'", "''"),
                            txtAgencyZip.Text.Trim().Replace("'", "''"), ddAgencyCountry.SelectedValue, txtAgencyPhone.Text.Trim().Replace("'", "''"), strBlank, txtAgencyEmail.Text.Trim().Replace("'", "''"), strBlank, 0);
                    }
                    //Insert emergency contact information
                    strSubmitMsg = myIStudent.InsertContactInfo(newID, 5, txtEmergName.Text.Trim().Replace("'", "''"), strBlank, strBlank, strBlank, strBlank, strBlank, strBlank, txtEmergPhone.Text.Trim().Replace("'", "''"),
                        strBlank, txtEmergEmail.Text.Trim().Replace("'", "''"), txtEmergRelationship.Text.Trim().Replace("'", "''"), tempEnglish);

                    //insert school information
                    strMajor = ddMajor.SelectedValue.Replace("'", "''");
                    strMajor = strMajor.Replace(",", ";");
                    strOtherMajor = txtOtherMajor.Text.Trim().Replace("'", "''");
                    strOtherMajor = strOtherMajor.Replace(",", ";");
                    if (strMajor == "Other")
                        strMajor = strOtherMajor;
                    strSubmitMsg = myIStudent.insertSchoolInfoREDO(newID, txtHighSchool.Text.Trim().Replace("'", "''"), tempHSGrad, tempGradDate, radWhenStudy.SelectedValue, whatStudy, radWhereStudy.SelectedValue, strMajor, strOtherMajor, howPayTuition, txtOtherFinancing.Text.Trim().Replace("'", "''"),
                        "no fee", trSchools, tempHSCP);

                } // first insert successful so have insert id
                else
                {
                    goodSubmit = false;
                }
            }
            catch (Exception expn)
            {
                errMsg.Text = expn.Message + "<br />" + expn.StackTrace + "<br />";
                lblDBmessage.Text = strSubmitMsg + "<br />";
                goodSubmit = false;
            }
            if (goodSubmit)
            {
                string strStart = "<tr><td style='width:40%'>";
                string strMid = "</td><td style='width:60%'>";
                string strEnd = "</td></tr>";
                //send email notifying administrators of submission and showing all the data submitted
                Utility uEmail = new Utility();
                sendTo = intlEmail;
                sentFrom = txtPermEmail.Text.Trim();
                strSubj = "International Student application form submitted";
               // strCCaddresses = "laura.padden@ccs.spokane.edu";
                //strCCaddresses = "katherine.thompson@ccs.spokane.edu";
                //prepare the body of the email
                strBody = "";
                strBody = "INTERNATIONAL STUDENT APPLICATION SUBMITTED<BR />DATE: " + DateTime.Now + "<p></p><p>PERSONAL INFORMATION:</p><table width='100%'>" + strStart + "Family Name" + strMid;
                strBody += txtFamilyName.Text.Trim() + strEnd;
                strBody += strStart + "First Name (given name)" + strMid + txtGivenName.Text.Trim() + strEnd;
                strBody += strStart + "Middle Name(s), if any" + strMid + txtMiddleNames.Text.Trim() + strEnd;
                strBody += strStart + "Preferred Name" + strMid + txtPreferredName.Text.Trim() + strEnd;
                strBody += strStart + "DOB" + strMid + tempDate.ToShortDateString() + strEnd;
                strBody += strStart + "Marital Status" + strMid + radMStatus.SelectedValue + strEnd;
                strBody += strStart + "Dependents" + strMid + ddNumDependents.SelectedValue;
                if (tempSpouse.Length > 0)
                    strBody += ", " + tempSpouse;
                if (tempChildren.Length > 0)
                    strBody += " and " + tempChildren;
                strBody += strEnd;
                strBody += strStart + "Gender" + strMid + radGender.SelectedValue + strEnd + "</table>";


                strBody += "<p></p><p>IMMIGRATION INFORMATION:</p><table width='100%'>";
                strBody += strStart + "Country of Birth" + strMid + ddCountryBirth.SelectedValue + strEnd;
                strBody += strStart + "Country of Citizenship" + strMid + ddCountryCitizenship.SelectedValue + strEnd;

                strBody += strStart + "Visa type" + strMid + radVisaType.SelectedValue + strEnd + "</table>";

                strBody += "<p>CONTACT INFORMATION:</p><table width='100%'>";
                if (tempBit == 1)
                    strBody += strStart + "I live in the US" + strMid + "&nbsp;" + strEnd;

                strBody += strStart + "Permanent Address" + strMid + txtPermAddress.Text.Trim() + strEnd;
                strBody += strStart + "Permanent City" + strMid + txtPermCity.Text.Trim() + strEnd;
                strBody += strStart + "Permanent State/Province" + strMid + txtPermStateP.Text.Trim() + strEnd;
                strBody += strStart + "Permanent Zip" + strMid + txtPermZip.Text.Trim() + strEnd;
                strBody += strStart + "Permanent Home Country" + strMid + ddPermHomeCountry.SelectedValue + strEnd;
                strBody += strStart + "Permanent Phone" + strMid + txtPermPhone.Text.Trim() + strEnd;
                strBody += strStart + "Permanent Email" + strMid + txtPermEmail.Text.Trim() + strEnd;
                if (hid18 == "yes")  //applicant is under 18 years old
                {
                    strBody += strStart + "<br />Parent's Name" + strMid + "<br />" + txtParentsName.Text.Trim() + strEnd;
                    strBody += strStart + "Parent's Address" + strMid + txtParentsStreet.Text.Trim() + strEnd;
                    strBody += strStart + "Parent's City" + strMid + txtParentsCity.Text.Trim() + strEnd;
                    strBody += strStart + "Parent's State/Province" + strMid + txtParentsState.Text.Trim() + strEnd;
                    strBody += strStart + "Parent's Zip" + strMid + txtParentsZip.Text.Trim() + strEnd;
                    strBody += strStart + "Parent's Country" + strMid + ddParentsCountry.SelectedValue + strEnd;
                    strBody += strStart + "Parent's Phone" + strMid + txtParentsPhone.Text.Trim() + strEnd;
                    strBody += strStart + "Parent's Email" + strMid + txtParentsEmail.Text.Trim() + strEnd;
                }
                if (useAgency_0.Checked)
                {
                    // DID use agency
                    strBody += strStart + "<br />Agency Contact" + strMid + "<br />" + txtAgencyContact.Text.Trim() + strEnd;
                    strBody += strStart + "Agency Name" + strMid + txtAgencyName.Text.Trim() + strEnd;
                    strBody += strStart + "Agency Address" + strMid + txtAgencyAddress.Text.Trim() + strEnd;
                    strBody += strStart + "Agency City" + strMid + txtAgencyCity.Text.Trim();
                    strBody += strStart + "Agency State/Province" + strMid + txtAgencyState.Text.Trim() + strEnd;
                    strBody += strStart + "Agency Zip" + strMid + txtAgencyZip.Text.Trim() + strEnd;
                    strBody += strStart + "Agency Country" + strMid + ddAgencyCountry.SelectedValue + strEnd;
                    strBody += strStart + "Agency Phone" + strMid + txtAgencyPhone.Text.Trim() + strEnd;
                    strBody += strStart + "Agency Email" + strMid + txtAgencyEmail.Text.Trim() + strEnd;
                }
                else
                {
                    // did NOT use agency
                    strBody += strStart + "<br />Did NOT use an Agency/Advising Center" + strMid + "<br />" + "&nbsp;" + strEnd;
                }

                //Emergency Contact Information - not required so could be blanks
                strBody += strStart + "<br />Emergency Contact Name" + strMid + "<br />" + txtEmergName.Text.Trim() + strEnd;
                strBody += strStart + "Relationship" + strMid + txtEmergRelationship.Text.Trim() + strEnd;
                strBody += strStart + "Emergency Contact Phone" + strMid + txtEmergPhone.Text.Trim() + strEnd;
                strBody += strStart + "Emergency Email" + strMid + txtEmergEmail.Text.Trim() + strEnd;
                strBody += "</table>";



                strBody += "<p></p><p>EDUCATIONAL INFORMATION:</p><table width='100%'>";
                strBody += strStart + "Name of high school" + strMid + txtHighSchool.Text.Trim() + strEnd;
                strBody += strStart + "High school graduate?" + strMid;
                if (tempHSGrad == 1)
                    strBody += "yes - " + txtHSGradMonth.Text.Trim() + "/" + txtHSGradYear.Text.Trim() + strEnd;
                else
                {
                    strBody += "no" + strEnd;
                    strBody += strStart + "Do you want to study in the High School Completion Program?" + strMid;
                    if (tempHSCP == 1)
                        strBody += "yes" + strEnd;
                    else
                        strBody += "no" + strEnd;
                }
                strBody += strStart + "English Ability" + strMid + radEnglishAbility.SelectedValue + strEnd;
                strBody += strStart + "Student status" + strMid + radStudentStatus.SelectedValue + strEnd;
                strBody += strStart + "When Begin Studies" + strMid + radWhenStudy.SelectedValue + strEnd;
                strBody += strStart + "Programs of Interest" + strMid + whatStudy + strEnd;
                if (trSchools.Trim() != "")
                    strBody += strStart + "University Partner" + strMid + trSchools + strEnd;
                if (txtStudyOtherProg.Text.Trim().Length > 0)
                {
                    strBody += strStart + "Other Programs" + strMid + txtStudyOtherProg.Text.Trim() + strEnd;
                }
                strBody += strStart + "Where Study" + strMid + radWhereStudy.SelectedValue + strEnd;

                strBody += strStart + "Major" + strMid + strMajor + strEnd + "</table>";

                strBody += "<p></p><p>FINANCIAL INFORMATION:</p><table width='100%'>";
                strBody += strStart + "How pay for tuition" + strMid + howPayTuition + strEnd;
                if (txtOtherFinancing.Text.Trim().Length > 0)
                    strBody += strStart + "Other Financing" + strMid + txtOtherFinancing.Text.Trim() + strEnd;
                strBody += strStart + "Payment Option" + strMid + "no fee" + strEnd + "</table>";

                strBody += "<p></p><p>MEDICAL INFORMATION:</p><table width='100%'>";
                if (ackHealth != "")
                    strBody += strStart + "Health Insurance" + strMid + "I acknowledge" + strEnd + "</table>";
                else
                    strBlank += strStart + "Health Insurance" + strMid + "I do not acknowledge" + strEnd + "</table>";

                strBody += "<p></p><p>POLICY IFNORMATION:</p><table width='100%'>";
                strBody += strStart + "Release of Information" + strMid;
                if (tempRelease == 'y')
                    strBody += "yes, I authorize" + strEnd;
                else
                    strBody += "no, I decline to authorize" + strEnd;

                strBody += strStart + "All statements are true and I agree to the policies" + strMid + "&nbsp;" + strEnd;
                strBody += strStart + "Heard about CCS" + strMid + howHearCCS + strEnd + "</table>";

                strEmailResult = uEmail.SendEmailMsg(sendTo, sentFrom, strSubj, true, strBody, strCCaddresses, "");
                // Response.Write("return from email: " + strEmailResult + "<br />");

                // check to see if the country of citizenship is one of the excluded ones found in array noAutoEmail
                for (int i = 0; i < noAutoEmail.Length; i++)
                {
                    if (noAutoEmail[i] == ddCountryCitizenship.SelectedValue)
                    {
                        autoReply = false;
                    }
                }

                if (strEmailResult == "Success" && autoReply)
                {
                    // get the query string value so we know what college site this application is coming from
                    string qsValue = Request.QueryString["site"].ToUpper();
                    // send auto response email
                    sendTo = txtPermEmail.Text.Trim();
                    sentFrom = "globalprograms@ccs.spokane.edu";
                    if (txtAgencyEmail.Text.Trim() == "")
                        strCCaddresses = "";
                    else
                        strCCaddresses = txtAgencyEmail.Text.Trim();
                    strSubj = "International Student Application";
                    //prepare the body of the email
                    strBody = "";
                    strBody = "<style type='text/css'>";
                    strBody += "#emailContainer";
                    strBody += "{";
                    strBody += "    font: 14px/20px ArialMT, Verdana, sans-serif;";
                    strBody += "    color:black;";
                    strBody += " }";
                    strBody += "#emailContainer a, a:visited";
                    strBody += "{";
                    strBody += "    color: #1e4aa6;";
                    strBody += "    text-decoration:none;";
                    strBody += "}";
                    strBody += " #emailContainer a:hover";
                    strBody += "{";
                    strBody += "    text-decoration:underline;";
                    strBody += " }";

                    strBody += "</style>";

                    strBody += "<div id='emailContainer'>";
                    strBody += "<table width='750px' cellpadding='15' cellspacing='0' border='0' bgcolor='#e5e6e7'>";
                    strBody += "<tbody>";
                    strBody += "<tr>";
                    strBody += "<td style='width:750px;'>";
                    strBody += "<table width='100%' cellpadding='5px'><tbody>";
                    strBody += "<tr style='background-color: #00519b;'><td colspan='3' style='width:100%; valign:middle;'>";

                    strBody += "<a href='http://www.ccs.spokane.edu'>&nbsp;&nbsp;&nbsp;<img src='https://portal.ccs.spokane.edu/_netapps/internationalsa/App_Themes/TuneUp/images/ccsLogo.jpg' alt='CCS Logo' title='Community Colleges of Spokane Homepage' /></a>";
                    strBody += "<span style='width: 500px; position: relative; float: left; color: #fff; Font-family: Palanquin, sans-serif; font-weight: 100; font-size: 30px;'>";
                    strBody += "<a href='http://www.ccs.spokane.edu' style='text-decoration:none;color:White;'>&nbsp;&nbsp;&nbsp;Community&nbsp;Colleges&nbsp;of&nbsp;Spokane</a>";
                    strBody += "</td></tr>";

                    strBody += "<tr>";
                    strBody += "<td colspan='3' style='width:100%;'><img src='https://portal.ccs.spokane.edu/_netapps/internationalsa/App_Themes/images/email/GE1.jpg' border='1px solid' width='750' alt='International Students' />";
                    strBody += "</td>";
                    strBody += "</tr>";
                    strBody += "<tr>";
                    strBody += "<td><h3>Thank you for submitting your international student online application to Community Colleges of Spokane!</h3>";
                    strBody += "If you applied to the International High School Completion Program, ";
                    if(qsValue == "SCC") {
                        strBody += "<a href='https://scc.spokane.edu/Become-a-Student/I-am-an-International-Student/What-Can-I-Study/International-High-School' target='_blank'>";
                    }
                    else if (qsValue == "SFCC")
                    {
                        strBody += "<a href='https://sfcc.spokane.edu/Become-a-Student/I-am-an-International-Student/What-Can-I-Study/International-High-School' target='_blank'>";
                    }
                    else
                    {
                        strBody += "<a href='http://shared.spokane.edu/Become-a-Student/I-am-an-International-Student/What-Can-I-Study/International-High-School' target='_blank'>";
                    }
                    strBody += "see your application requirements here</a>.";
                    strBody += "<p>In addition to completing the online form, please submit the following documentation:</p>";
                    strBody += "<ul><li>Copy of your <strong>valid passport</strong></li>";
                    strBody += "<li><strong><del>$100 application fee</del></strong> <span style='color: #ee3b41;font-weight:600;'>Waived</span></li>";
                    strBody += "<li><strong>High school completion documents</strong> (or equivalent)</li>";
                    strBody += "<li><strong><a href='https://sfcc.spokane.edu/ccsglobal/media/Global/FormsA-Z/ccs-40-214.pdf' target='_blank'>Affidavit of Financial Support Form</a></strong></li>";
                    strBody += "<li><strong>Bank statement</strong> (no older than six months from the I20 isuing date) verifying you have the funding available to cover your educational and living expenses here for one academic year ($18,000 + $7000 for each dependent).<br />";
                    strBody += "<a href='http://higheredublog.com/sample-bank-statement-letter-for-f1-visa/' target='_blank'>Sample bank statement letter</a></li>";
                    strBody += "<li><strong>";
                    if(qsValue == "SCC") {
                        strBody += "<a href='https://scc.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start/English-Proficiency-Requirements' target='_blank'>";
                    } else if (qsValue == "SFCC") {
                        strBody += "<a href='https://sfcc.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start/English-Proficiency-Requirements' target='_blank'>";
                    } else {
                        strBody += "<a href='https://shared.spokane.edu/Become-a-Student/I-am-an-International-Student/How-Do-I-Start/English-Proficiency-Requirements' target='_blank'>";
                    }
                    strBody += "Proof of English proficiency</a></strong> (if applying for academic admission, not ESL)</li></ul>";
                    strBody += "</td>";
                    strBody += "</tr>";
                    strBody += "<tr><td colspan='3' style='width:100%;'><p>If you are already in the U.S. on an F-1 student visa, we consider you a transfer student and you are required to submit these additional documents:</p>";
                    strBody += "<ul><li><strong><a href='https://shared.spokane.edu/ccsglobal/media/Global/PDFs/District/International/TransferIN.pdf' target='_blank'>Transfer-In Form</a></strong></li>";
                    strBody += "<li>Copy of your <strong>F-1 visa</strong></li>";
                    strBody += "<li>Copy of your most <strong>recent I-20</strong></li>";
                    strBody += "<li><strong>Transcripts</strong> from current institution(s) of study</li>";
                    strBody += "</ul>";

                    strBody += "<p>Please scan and email these documents to <a href='mailto:globalprograms@ccs.spokane.edu'>globalprograms@ccs.spokane.edu</a></p>";
                    strBody += "<p>You will hear back from us within 7 business days; please contact us if you have any further questions!</p>";
                    strBody += "<p>All the best,</p>";
                    strBody += "Community Colleges of Spokane<br />Global Education Office Admissions<br /><a href='mailto:globalprograms@ccs.spokane.edu'>globalprograms@ccs.spokane.edu</a>";

                    // create linked resource

                    strBody += "<p><a href='https://www.youtube.com/channel/UC_eDihSP-7PT-JEhVQS8--Q' target='_blank'><img src='https://portal.ccs.spokane.edu/_netapps/internationalsa/App_Themes/images/email/globalUTube105.png'></a>&nbsp;&nbsp;&nbsp;";
                    strBody += "<a href='https://www.facebook.com/Communitycollegesofspokane/?ref=aymt_homepage_panel' target='_blank'><img src='https://portal.ccs.spokane.edu/_netapps/internationalsa/App_Themes/images/email/globalFB.jpg'></a>&nbsp;&nbsp;&nbsp;";
                    strBody += "<a href='https://www.instagram.com/globaleducationccs/' target='_blank'><img src='https://portal.ccs.spokane.edu/_netapps/internationalsa/App_Themes/images/email/globalInstagram.jpg'></a>&nbsp;&nbsp;&nbsp;";
                    strBody += "</p></td>";
                    strBody += "</tr>";
                    strBody += "<tr>";
                    strBody += "<td colspan='3' style='width:100%;'><img src='https://portal.ccs.spokane.edu/_netapps/internationalsa/App_Themes/images/email/SFCCGateway-m.jpg' border='1px solid' width='750' alt='SFCC Gateway Bldg' />";
                    strBody += "</td>";
                    strBody += "</tr>";
                    strBody += "<tr style='background-color: #00519b;'><td colspan='3' style='width:100%; valign:top;'>&nbsp;</td></tr>";
                    strBody += "</tbody>";
                    strBody += "</table>";
                    strBody += "</td>";
                    strBody += "</tr>";
                    strBody += "</tbody>";
                    strBody += "</table>";
                    strBody += "</div>";

                    //  Response.Write("strCC: " + strCCaddresses + "<br />");
                    strEmailResult = uEmail.SendEmailMsg(sendTo, sentFrom, strSubj, true, strBody, strCCaddresses, "");

                    //  Response.Write("return from email: " + strEmailResult + "<br />");
                }
                autoReply = true;
                /**********************************************************************************************************************/
                if (strEmailResult == "Success")
                {
                    // redirect to confirmation page
                    Response.Redirect("applicationConfirmation.aspx?site="+Request.QueryString["site"]);
                }
                else
                {
                    // error sending email so let user know
                    lblDBmessage.Text = strEmailResult;
                    return;
                }
            }// end finish processing after good submit

        }// end is a postback
    }
}