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

public partial class InternationalStudents_Standardized_xxinternationalReportOne : System.Web.UI.Page
{
    int queryID;
    int currentAge;
    bool isInt = false;
    bool isPerm = false;
    bool isParent = false;
    bool isAgency = false;
    bool isRelative = false;
    bool isEmergency = false;
    DateTime dtNow = DateTime.Today;
    DateTime dtBday;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            queryID = int.Parse(Request.QueryString["ID"]);
            if (!int.TryParse(Request.QueryString["ID"], out queryID))
            {
                eMsg.InnerHtml = "There is a problem with your request.";
                return;
            }
            else
            {
                InternationalStudent myIStudent = new InternationalStudent();
                DataTable dtPersonalBasic = new DataTable();
                dtPersonalBasic = myIStudent.GetStudentInfoAll(queryID);
                if (dtPersonalBasic.Rows.Count > 0)
                {
                    lblFullname.Text = dtPersonalBasic.Rows[0]["fullName"].ToString();
                    dtBday = System.Convert.ToDateTime(dtPersonalBasic.Rows[0]["DOB"].ToString());
                    currentAge = dtNow.Year - dtBday.Year;
                    if (dtNow < dtBday.AddYears(currentAge))
                        currentAge--;

                    lblDOB.Text = dtBday.ToShortDateString() + " / age: " + currentAge;
                    lblGender.Text = dtPersonalBasic.Rows[0]["Gender"].ToString();
                    lblCountryBirth.Text = dtPersonalBasic.Rows[0]["countryOfBirth"].ToString();
                    lblCountryCitizen.Text = dtPersonalBasic.Rows[0]["countryOfCitizenship"].ToString();
                    //lblLanguage.Text = dtPersonalBasic.Rows[0]["nativeLanguage"].ToString();
                    lblEnglish.Text = dtPersonalBasic.Rows[0]["englishAbility"].ToString();
                    lblVISA.Text = dtPersonalBasic.Rows[0]["visaType"].ToString();
                    lblNumDependents.Text = dtPersonalBasic.Rows[0]["numberDependents"].ToString();
                    if (dtPersonalBasic.Rows[0]["Spouse"].ToString().Trim() == "")
                        lblSpouse.Text = "no spouse";
                    else
                        lblSpouse.Text = "yes";
                    if (dtPersonalBasic.Rows[0]["Children"].ToString().Trim() == "")
                        lblKids.Text = "no children";
                    else
                        lblKids.Text = "yes";
                    if (dtPersonalBasic.Rows[0]["inUS"].ToString() == "True")
                        lblInUS.Text = "Yes, I live in the US";
                    else
                        lblInUS.Text = "No, I do not live in the US";
                    //if (dtPersonalBasic.Rows[0]["medicalConditions"].ToString() == "True")
                        //lblMedical.Text = dtPersonalBasic.Rows[0]["medicalCondDetail"].ToString();
                    //else
                        //lblMedical.Text = "I have no medical conditions";
                    // Response.Write("needs: " + dtPersonalBasic.Rows[0]["specialAccommodations"].ToString() + "<br />");
                    if (dtPersonalBasic.Rows[0]["specialAccommodations"].ToString() == "True")
                        lblSpecial.Text = dtPersonalBasic.Rows[0]["specialAccommodationDetail"].ToString();
                    else
                        lblSpecial.Text = "I have no special needs";
                    if (dtPersonalBasic.Rows[0]["healthIns"].ToString() == "bring")
                        lblInsurance.Text = "I will bring my own health insurance";
                    else
                        lblInsurance.Text = "I will purchase health insurance through CCS";
                    if (dtPersonalBasic.Rows[0]["releaseInformation"].ToString() == "y")
                        lblRelease.Text = "I agree to the release of information";
                    else
                        lblRelease.Text = "I do NOT agree to the release of information";

                    // Pull the financial data
                    DataTable dtFinancial = new DataTable();
                    dtFinancial = myIStudent.GetFinancial(queryID);
                    if (dtFinancial.Rows.Count > 0)
                    {
                        foreach (DataRow myRow in dtFinancial.Rows)
                        {
                            lblHowPay.Text = myRow["payHow"].ToString();
                            if (myRow["payHowOther"].ToString().Trim() != "")
                                lblHowPay.Text += ", and " + myRow["payHowOther"].ToString();
                            lblPayOption.Text = myRow["payOption"].ToString();
                        }
                    }
                    else
                    {
                        // no financial data found
                    }

                    // Pull the housing data
                    DataTable dtHousing = new DataTable();
                    dtHousing = myIStudent.GetHousing(queryID);
                    if (dtHousing.Rows.Count > 0)
                    {
                        if (dtHousing.Rows[0]["housingFindOwn"].ToString() == "True")
                        {
                            lblOwnTitle.Text = "I have or will find my own housing";
                            lblOwnHouse.Text = dtHousing.Rows[0]["ownHousingAddress"].ToString();
                        }
                        else
                            lblOwnTitle.Text = "I do NOT have my own housing";
                        lblOwnHouse.Text = "";
                        if (dtHousing.Rows[0]["homeStay"].ToString() == "1")
                            lblCCSchoice.Text = "first choice: home stay<br />second choice: apartment";
                        else
                            lblCCSchoice.Text = "first choice: apartment<br />second choice: home stay";
                        lblFamPreference.Text = dtHousing.Rows[0]["homeStayFamType"].ToString();
                        if (dtHousing.Rows[0]["homeStayBadFood"].ToString() == "True")
                            lblBadFood.Text = dtHousing.Rows[0]["homeStayBadFoodDetail"].ToString();
                        else
                            lblBadFood.Text = "I have no food restrictions";
                        if (dtHousing.Rows[0]["homeStayCookOwn"].ToString().Trim() != "")
                            lblOwnMeals.Text = dtHousing.Rows[0]["homeStayCookOwn"].ToString().Trim();
                        else
                            lblOwnMeals.Text = "";
                        if (dtHousing.Rows[0]["homeStaySmoke"].ToString() == "True")
                            lblSmoke.Text = "Yes I smoke";
                        else
                            lblSmoke.Text = "No, I do not smoke";
                        if (dtHousing.Rows[0]["homeStayReligion"].ToString().Trim() != "")
                            lblReligion.Text = dtHousing.Rows[0]["homeStayReligion"].ToString().Trim();
                        else
                            lblReligion.Text = "";
                    }
                    else
                    {
                        // no housing data found
                    }
                    //Pull the school data
                    DataTable dtSchool = new DataTable();
                    dtSchool = myIStudent.GetSchool(queryID);
                    if (dtSchool.Rows.Count > 0)
                    {
                        if (dtSchool.Rows[0]["hsGrad"].ToString() == "True")
                        {
                            dtBday = System.Convert.ToDateTime(dtSchool.Rows[0]["hsGradDate"].ToString());
                            lblHSGrad.Text = dtBday.ToShortDateString();
                        }
                        else
                            lblHSGrad.Text = "No";
                        lblHSattend.Text = dtSchool.Rows[0]["hsName"].ToString().Trim();
                        //Response.Write("schoolcode: " + dtSchool.Rows[0]["toeflSchoolCode"].ToString());
                        if (dtSchool.Rows[0]["toeflSchoolCode"].ToString().Trim() != "")
                            lblSchoolCode.Text = dtSchool.Rows[0]["toeflSchoolCode"].ToString();
                        else
                            lblSchoolCode.Text = "";
                        if (dtSchool.Rows[0]["toeflTestDate"].ToString() != "1/1/1900 12:00:00 AM")
                        {
                            lblTOEFLscore.Text = dtSchool.Rows[0]["toeflScore"].ToString();
                            dtBday = System.Convert.ToDateTime(dtSchool.Rows[0]["toeflTestDate"].ToString());
                            lblTOEFLdate.Text = dtBday.ToShortDateString();
                        }
                        else
                        {
                            lblTOEFLscore.Text = "";
                            lblTOEFLdate.Text = "";
                        }

                        if (dtSchool.Rows[0]["ieltsTestDate"].ToString() != "1/1/1900 12:00:00 AM")
                        {
                            lblIELTSscore.Text = dtSchool.Rows[0]["ieltsScore"].ToString();
                            dtBday = System.Convert.ToDateTime(dtSchool.Rows[0]["ieltsTestDate"].ToString());
                            lblIELTSdate.Text = dtBday.ToShortDateString();
                        }
                        else
                        {
                            lblIELTSscore.Text = "";
                            lblIELTSdate.Text = "";
                        }
                        if (dtSchool.Rows[0]["studiesBegin"].ToString() != "")
                            lblQtrStart.Text = dtSchool.Rows[0]["studiesBegin"].ToString();
                        else
                            lblQtrStart.Text = "";
                        if (dtSchool.Rows[0]["studyWhat"].ToString() != "")
                            lblProgStudy.Text = dtSchool.Rows[0]["studyWhat"].ToString();
                        else
                            lblProgStudy.Text = "";
                        if (dtSchool.Rows[0]["studyWhere"].ToString() != "")
                            lblSchoolAttend.Text = dtSchool.Rows[0]["studyWhere"].ToString();
                        else
                            lblSchoolAttend.Text = "";
                        if (dtSchool.Rows[0]["studyMajor"].ToString() != "")
                            lblMajor.Text = dtSchool.Rows[0]["studyMajor"].ToString();
                        else
                            lblMajor.Text = "";
                        //if (dtSchool.Rows[0]["studyLength"].ToString() != "")
                            //lblLengthOfStay.Text = dtSchool.Rows[0]["studyLength"].ToString();
                        //else
                            //lblLengthOfStay.Text = "";

                    }
                    else
                    {
                        // no school information found
                    }// end of school data

                    // Pull the contact data
                    DataTable dtContacts = new DataTable();
                    dtContacts = myIStudent.GetContacts(queryID, 1);
                    if (dtContacts.Rows.Count > 0)
                    {
                        /*
                        // set booleans
                        isPerm = true;
                        isParent = false;
                        isAgency = false;
                        isRelative = false;
                        isEmergency = false;
                         */
                        //populate the permanent address fields
                        lblPermName.Text = dtContacts.Rows[0]["addresseeName"].ToString();
                        lblPermCountry.Text = dtContacts.Rows[0]["Country"].ToString();
                        lblPermAddress.Text = dtContacts.Rows[0]["Addr"].ToString();
                        lblPermCity.Text = dtContacts.Rows[0]["City"].ToString();
                        lblPermState.Text = dtContacts.Rows[0]["StateProv"].ToString();
                        lblPermZip.Text = dtContacts.Rows[0]["Zip"].ToString();
                        lblPermPhone.Text = dtContacts.Rows[0]["Phone"].ToString();
                        lblPermCell.Text = "";
                        lblPermFAX.Text = "";
                        lblPermEmail.Text = dtContacts.Rows[0]["Email"].ToString();
                    }
                    DataTable dtParents = new DataTable();
                    dtParents = myIStudent.GetContacts(queryID, 2);
                    if (dtParents.Rows.Count > 0)
                    {
                        // populate the parent's contact info
                        lblParentName.Text = dtParents.Rows[0]["addresseeName"].ToString();
                        lblParentCountry.Text = dtParents.Rows[0]["Country"].ToString();
                        lblParentAddress.Text = dtParents.Rows[0]["Addr"].ToString();
                        lblParentCity.Text = dtParents.Rows[0]["City"].ToString();
                        lblParentState.Text = dtParents.Rows[0]["StateProv"].ToString();
                        lblParentZip.Text = dtParents.Rows[0]["Zip"].ToString();
                        lblParentPhone.Text = dtParents.Rows[0]["Phone"].ToString();
                        lblParentCell.Text = "";
                        lblParentFAX.Text = dtParents.Rows[0]["FAX"].ToString();
                        lblParentEmail.Text = dtParents.Rows[0]["Email"].ToString();
                    }

                    DataTable dtAgency = new DataTable();
                    dtAgency = myIStudent.GetContacts(queryID, 3);
                    if (dtAgency.Rows.Count > 0)
                    {
                        // populate the agency's contact info
                        lblAgencyName.Text = dtAgency.Rows[0]["agencyName"].ToString();
                        lblAgencyContact.Text = dtAgency.Rows[0]["addresseeName"].ToString();
                        lblAgencyCountry.Text = dtAgency.Rows[0]["Country"].ToString();
                        lblAgencyAddress.Text = dtAgency.Rows[0]["Addr"].ToString();
                        lblAgencyCity.Text = dtAgency.Rows[0]["City"].ToString();
                        lblAgencyState.Text = dtAgency.Rows[0]["StateProv"].ToString();
                        lblAgencyZip.Text = dtAgency.Rows[0]["Zip"].ToString();
                        //lblAgengyPhone.Text = dtParents.Rows[0]["Phone"].ToString();
                        lblParentCell.Text = "";
                        //lblAgencyFAX.Text = dtAgency.Rows[0]["FAX"].ToString();
                        lblAgencyEmail.Text = dtAgency.Rows[0]["Email"].ToString();
                    }

                    DataTable dtRelative = new DataTable();
                    dtRelative = myIStudent.GetContacts(queryID, 4);
                    if (dtRelative.Rows.Count > 0)
                    {
                        // populate the relative's contact info
                        lblRelativeName.Text = dtRelative.Rows[0]["addresseeName"].ToString();
                        lblRelativeHow.Text = dtRelative.Rows[0]["Relationship"].ToString();
                        lblRelativeAddress.Text = dtRelative.Rows[0]["Addr"].ToString() + "; " + dtRelative.Rows[0]["City"].ToString() + ", " + dtRelative.Rows[0]["StateProv"].ToString();
                        lblRelativePhone.Text = dtRelative.Rows[0]["Phone"].ToString();
                        lblRelativeCell.Text = dtRelative.Rows[0]["CellPhone"].ToString();
                        lblRelativeFAX.Text = dtRelative.Rows[0]["FAX"].ToString();
                        lblRelativeEmail.Text = dtRelative.Rows[0]["Email"].ToString();
                    }

                    DataTable dtEmerg = new DataTable();
                    dtEmerg = myIStudent.GetContacts(queryID, 5);
                    if (dtEmerg.Rows.Count > 0)
                    {
                        // populate the emergency contact info
                        lblEmergName.Text = dtEmerg.Rows[0]["addresseeName"].ToString();
                        lblEmergRelation.Text = dtEmerg.Rows[0]["Relationship"].ToString();
                        lblEmergPhone.Text = dtEmerg.Rows[0]["Phone"].ToString();
                        lblEmergCell.Text = dtEmerg.Rows[0]["CellPhone"].ToString();
                        //lblEmergFAX.Text = dtEmerg.Rows[0]["FAX"].ToString();
                        lblEmergEmail.Text = dtEmerg.Rows[0]["Email"].ToString();
                        lblEmergCountry.Text = dtEmerg.Rows[0]["Country"].ToString();
                        if (dtEmerg.Rows[0]["speakEnglish"].ToString() == "True")
                            lblEmergSpeakEngligh.Text = "Yes";
                        else
                            lblEmergSpeakEngligh.Text = "No";
                    }
                }
                else
                {

                }// no Basic data found for student
            }// problem with the querystring - no int ID
        }// end NOT a postback - all above done on page load
    }// end page load

    protected void btnSchool_Click(object sender, EventArgs e)
    {
        if (schoolInfo.Visible == false)
            schoolInfo.Visible = true;
        else
            schoolInfo.Visible = false;
        if (financialInfo.Visible == true)
            financialInfo.Visible = false;
        if (housingInfo.Visible == true)
            housingInfo.Visible = false;
        if (allContacts.Visible == true)
            allContacts.Visible = false;
    }// end of school info
    protected void btnFinancial_Click(object sender, EventArgs e)
    {
        if (financialInfo.Visible == false)
            financialInfo.Visible = true;
        else
            financialInfo.Visible = false;
        if (schoolInfo.Visible == true)
            schoolInfo.Visible = false;
        if (housingInfo.Visible == true)
            housingInfo.Visible = false;
        if (allContacts.Visible == true)
            allContacts.Visible = false;
    }
    protected void btnHousing_Click(object sender, EventArgs e)
    {
        if (housingInfo.Visible == false)
            housingInfo.Visible = true;
        else
            housingInfo.Visible = false;
        if (schoolInfo.Visible == true)
            schoolInfo.Visible = false;
        if (financialInfo.Visible == true)
            financialInfo.Visible = false;
        if (allContacts.Visible == true)
            allContacts.Visible = false;
    }
    protected void btnContacts_Click(object sender, EventArgs e)
    {
        if (allContacts.Visible == false)
        {
            allContacts.Visible = true;
            contactPerm.Visible = true;
            if (lblParentName.Text.Trim() != "")
                contactParents.Visible = true;
            else
                contactParents.Visible = false;
            if (lblAgencyName.Text.Trim() != "")
                contactAgency.Visible = true;
            else
                contactAgency.Visible = false;
            if (lblRelativeName.Text.Trim() != "")
                contactRelative.Visible = true;
            else
                contactRelative.Visible = false;
            if (lblEmergName.Text.Trim() != "")
                contactEmergency.Visible = true;
            else
                contactEmergency.Visible = false;
            /*
            if (isPerm)
            {
                contactPerm.Visible = true;
                contactParents.Visible = false;
                contactAgency.Visible = false;
                contactRelative.Visible = false;
                contactEmergency.Visible = false;
            }
            else if (isParent)
            {
                contactPerm.Visible = false;
                contactParents.Visible = true;
                contactAgency.Visible = false;
                contactRelative.Visible = false;
                contactEmergency.Visible = false;
            }
            else if (isAgency)
            {
                contactPerm.Visible = false;
                contactParents.Visible = false;
                contactAgency.Visible = true;
                contactRelative.Visible = false;
                contactEmergency.Visible = false;
            }
            else if (isRelative)
            {
                contactPerm.Visible = false;
                contactParents.Visible = false;
                contactAgency.Visible = false;
                contactRelative.Visible = true;
                contactEmergency.Visible = false;
            }
            else if (isEmergency)
            {
                contactPerm.Visible = false;
                contactParents.Visible = false;
                contactAgency.Visible = false;
                contactRelative.Visible = false;
                contactEmergency.Visible = true;
            }
             */
        }
        else
            allContacts.Visible = false;
        if (schoolInfo.Visible == true)
            schoolInfo.Visible = false;
        if (financialInfo.Visible == true)
            financialInfo.Visible = false;
        if (housingInfo.Visible == true)
            housingInfo.Visible = false;
    }
}