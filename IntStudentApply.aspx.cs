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


public partial class IntStudentApply : System.Web.UI.Page
{
    string sql;
    int iCount;
    const string MatchEmailPattern =
            @"^(([\w-]+\.)+[\w-]+|([a-zA-Z]{1}|[\w-]{2,}))@"
     + @"((([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?
				[0-9]{1,2}|25[0-5]|2[0-4][0-9])\."
     + @"([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\.([0-1]?
				[0-9]{1,2}|25[0-5]|2[0-4][0-9])){1}|"
     + @"([a-zA-Z]+[\w-]+\.)+[a-zA-Z]{2,4})$";

    const string MatchDatePattern = "^(1[0-2]|0[1-9]|\\d)\\/(20\\d{2}|19\\d{2}|0(?!0)\\d|[1-9]\\d)$";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            txtFamilyName.Focus();
            InternationalStudent myIStudent = new InternationalStudent();
            DataTable dtMajors = new DataTable();
            dtMajors = myIStudent.getMajors();
            ddMajor.Items.Clear();
            ddMajor.Items.Add(new ListItem("Choose One", "Select"));
            ddMajor.SelectedValue = "Select";
            foreach (DataRow dtMajorRow in dtMajors.Rows)
            {
                if (dtMajorRow["ProgTitle"].ToString().Trim().Length > 50)
                    ddMajor.Items.Add(new ListItem(dtMajorRow["ProgTitle"].ToString().Substring(0, 50), dtMajorRow["ProgTitle"].ToString().Substring(0, 50)));
                else
                    ddMajor.Items.Add(new ListItem(dtMajorRow["ProgTitle"].ToString(), dtMajorRow["ProgTitle"].ToString()));
            }
           // db = new DB();

          //  InternationalStudent myIStudent = new InternationalStudent();
            DataTable dtIStu = new DataTable();
            dtIStu = myIStudent.GetIntlStudentCountries();
            if (dtIStu.Rows.Count > 0)
            {
                ddCountrybirth.Items.Clear();
                ddCountrybirth.Items.Add(new ListItem("Choose One", "-1"));
                ddCountrybirth.SelectedValue = "-1";
                ddCountrybirth.Items.Clear();
                ddCountryCitizenship.Items.Clear();
                ddCountryCitizenship.Items.Add(new ListItem("Choose One", "-1"));
                ddCountryCitizenship.SelectedValue = "-1";
                ddPermHomeCountry.Items.Clear();
                ddPermHomeCountry.Items.Add(new ListItem("Choose One", "-1"));
                ddPermHomeCountry.SelectedValue = "-1";
                ddParentsCountry.Items.Clear();
                ddParentsCountry.Items.Add(new ListItem("Choose One", "-1"));
                ddParentsCountry.SelectedValue = "-1";
                ddAgencyCountry.Items.Clear();
                ddEmergCountry.Items.Clear();
                ddAgencyCountry.Items.Add(new ListItem("Choose One", "-1"));
                ddAgencyCountry.SelectedValue = "-1";
                ddEmergCountry.Items.Add(new ListItem("Choose One", "-1"));
                ddEmergCountry.SelectedValue = "-1";
                foreach (DataRow dtRow in dtIStu.Rows)
                {
                    ddCountrybirth.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["id"].ToString()));
                    ddCountryCitizenship.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["id"].ToString()));
                    ddPermHomeCountry.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["id"].ToString()));
                    ddParentsCountry.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["id"].ToString()));
                    ddAgencyCountry.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["id"].ToString()));
                    ddEmergCountry.Items.Add(new ListItem(dtRow["countryName"].ToString(), dtRow["id"].ToString()));
                }
            }
        }// end is not a postback
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string strErr1 = "Required field, please enter a value or make a selection";
        string strErr2 = "Please enter a valid date in the format mm/dd/yyyy";
        string strErr3 = "Please enter a valid email address";

        string famName = "";
        string gName = "";
        string gender = "";
        string stuStatus = "";
        string countryBirth = "";
        string countryCitizen = "";
        string permAddr = "";
        string permCity = "";
        string permStateProv = "";
        string permZip = "";
        string permCountry = "";
        string permPhone = "";
        string permEmail = "";
        string I_20 = "";
        string hsGradDate = "";
        string studiesBegin = "";
        string studiesWhat = "";
        string studiesWhere = "";
        string studiesMajor = "";
        string studiesLength = "";
        string howPay = "";
        bool releaseAuthorization = false;
        bool trueAgree = false;


       DateTime dteDOB;

       DateTime tempDate;

        //validation of required entry fields
       if (txtFamilyName.Text.Trim() == "")
       {
           errMsg.Text = strErr1 + " - family name";
           txtFamilyName.Focus();
           return;
       }
       else
           famName = txtFamilyName.Text.Trim();
       if (txtGivenName.Text.Trim() == "")
       {
           errMsg.Text = strErr1 + " - given name";
           txtGivenName.Focus();
           return;
       }
       else
           gName = txtGivenName.Text.Trim();

        if (txtDOB.Text.Trim() == "mm/dd/yyyy" || txtDOB.Text.Trim() == "")
        {
            errMsg.Text = strErr2 + " - Date of Birth";
            txtDOB.Text = "";
            txtDOB.Focus();
            return;
        }

        if (!DateTime.TryParse(txtDOB.Text.Trim(), out tempDate))
        {
            errMsg.Text =  strErr2 + " - Date of Birth";
            txtDOB.Focus();
            return;
        }
        else
            dteDOB = tempDate;
        if (radGender.SelectedIndex == -1)
        {
            errMsg.Text = strErr1 + " - Gender";
            radGender.Focus();
            return;
        }
        else
            gender = radGender.SelectedValue;

        if (radStudentStatus.SelectedIndex == -1)
        {
            errMsg.Text = strErr1 + " - student status";
            radStudentStatus.Focus();
            return;
        }
        else
            stuStatus = radStudentStatus.SelectedValue;

        if (ddCountrybirth.SelectedIndex == -1)
        {
            errMsg.Text = strErr1 + " - country of birth";
            ddCountrybirth.Focus();
            return;
        }
        else
            countryBirth = ddCountrybirth.SelectedValue;
        if (ddCountryCitizenship.SelectedIndex == -1)
        {
            errMsg.Text = strErr1 + " - country of citizenship";
            ddCountryCitizenship.Focus();
            return;
        }
        else
            countryCitizen = ddCountryCitizenship.SelectedValue;

        if (txtPermAddress.Text.Trim() == "")
        {
           /* errMsg.Text = strErr1;
            txtPermAddress.Focus();
            return;
            */

        }
        else
            permAddr = txtPermAddress.Text.Trim();
        if (txtPermCity.Text.Trim() == "")
        {
            errMsg2.Text = strErr1;
            txtPermCity.Focus();
            return;
        }
        else
            permCity = txtPermCity.Text.Trim();
        if (txtPermStateP.Text.Trim() == "")
        {
            errMsg2.Text = strErr1;
            txtPermStateP.Focus();
            return;
        }
        else
            permStateProv = txtPermStateP.Text.Trim();
        if (txtPermZip.Text.Trim() == "")
        {
            errMsg2.Text = strErr1;
            txtPermZip.Focus();
            return;
        }
        else
            permZip = txtPermZip.Text.Trim();
        if (ddPermHomeCountry.SelectedIndex == -1)
        {
            errMsg2.Text = strErr1;
            ddPermHomeCountry.Focus();
            return;
        }
        else
            permCountry = ddPermHomeCountry.SelectedValue;
        if (txtPermPhone.Text.Trim() == "")
        {
            errMsg2.Text = strErr1;
            txtPermPhone.Focus();
            return;
        }
        else
            permPhone = txtPermPhone.Text.Trim();
        if (txtPermEmail.Text.Trim() == "")
        {
            errMsg2.Text = strErr1;
            txtPermEmail.Focus();
            return;
        }
        else
        {
            permEmail = txtPermEmail.Text.Trim();
            // validate email format
            if (!Regex.IsMatch(permEmail, MatchEmailPattern))
            {
                errMsg2.Text = strErr3;
                txtPermEmail.Focus();
                return;
            }

        }// end email validation
        if (radI20.SelectedIndex == -1)
        {
            errMsg3.Text = strErr1;
            radI20.Focus();
            return;
        }
        if (radHSGrad.SelectedIndex == -1)
        {
            errMsg4.Text = strErr1;
            radHSGrad.Focus();
            return;
        }
        else
        {
            if (radHSGrad.SelectedValue.ToString() == "Yes")
            {
                if (txtHSGradDate.Text == "mm/yyyy")
                {
                    errMsg4.Text = strErr1 + " high school graduation date";
                    txtHSGradDate.Focus();
                    return;
                }
                else
                {
                    //validate the graduation date
                    hsGradDate = txtHSGradDate.Text.Trim();
                    // validate email format
                    if (!Regex.IsMatch(hsGradDate, MatchDatePattern))
                    {
                        errMsg4.Text = strErr3;
                        txtHSGradDate.Focus();
                        return;
                    }
                }// end validate the hs graduation date

            }// end IS hs grad

        }
        if (radWhenStudy.SelectedIndex == -1)
        {
            errMsg4.Text = strErr1 + " when begin studies.";
            radWhenStudy.Focus();
            return;
        }
        else
            studiesBegin = radWhenStudy.SelectedValue;
        if (chkWhatStudy.SelectedIndex == -1 && txtStudyOtherProg.Text.Trim() == "")
        {
            errMsg4.Text = strErr1 + " what studies.";
            chkWhatStudy.Focus();
            return;
        }
        else
            studiesWhat = "";
        if (ddMajor.SelectedIndex == -1)
        {
            errMsg4.Text = strErr1 + " choose a major.";
            ddMajor.Focus();
            return;
        }
        else
            studiesMajor = ddMajor.SelectedValue;

        if (ddHowLongStay.SelectedIndex == -1)
        {
            errMsg4.Text = strErr1 + " how long do you plan to attend.";
            ddHowLongStay.Focus();
            return;
        }
        else
            studiesLength = ddHowLongStay.SelectedValue;

        if (chkPaymentOption.SelectedIndex == -1)
        {
            errMsg6.Text = strErr1 +  " select a payment option.";
            chkPaymentOption.Focus();
            return;
        }

        if (radReleaseInformation.SelectedIndex == -1)
        {
            errMsg7.Text = strErr1 + " release of information option.";
            radReleaseInformation.Focus();
            return;
        }
        else
            if (radReleaseInformation.SelectedValue == "Yes")
                releaseAuthorization = true;
            else
                releaseAuthorization = false;
        if (!chkAgree.Checked)
        {
            errMsg8.Text = strErr1 + " please acknowledge answers are true and you agree to the policies.";
            chkAgree.Focus();
            return;
        }


    }

    protected bool isEmail(string eMail)
    {
        return Regex.IsMatch(eMail, MatchEmailPattern);
    }
    protected bool isDate(string dDate)
    {
        return Regex.IsMatch(dDate, MatchDatePattern);
    }
}