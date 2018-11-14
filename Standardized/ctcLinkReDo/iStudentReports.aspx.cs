using System;
using System.IO;
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

public partial class InternationalStudents_Standardized_ctcLinkReDo_iStudentReports : System.Web.UI.Page
{
    string SID;
    string sql;
 //   public static String intlEmail = "trina.allen@ccs.spokane.edu";
    public static String intlEmail = "Teresa.Gay@ccs.spokane.edu";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            errMsg.Text = "";
            gridStudents.PageSize = 10;
            gridStudents.AllowPaging = true;
            gridStudents.AllowSorting = true;
            Setup_Table();
        }
    }


    protected void Setup_Table()
    {
        sql = String.Format("SELECT B.id, B.fullName, B.countryOfCitizenship, B.visaType, S.studiesBegin, S.studyWhat, S.studyMajor " +
            "FROM CCSInternationalStudent.dbo.ApplicantBasicInfo AS B INNER JOIN  " +
            "CCSInternationalStudent.dbo.SchoolInformation AS S ON B.id = S.applicantID " +
            "ORDER BY B.fullName");
        try
        {
            sqlStudents.ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString_CCSInternationalStudent"].ToString();
            sqlStudents.SelectCommand = sql;

            //sniff for the browser
            HttpBrowserCapabilities browserObj;
            browserObj = Request.Browser;
            string brType = browserObj.Type.Substring(0, 2);
//            Response.Write("type: " + brType + "<br />");
//            if (brType == "IE")
//            {
//                gridStudents.CssClass = "positionIE";
//            }
//            else
//            {
                gridStudents.CssClass = "position";
//            }
             
            gridStudents.DataBind();
            if (gridStudents.Rows.Count == 0)
            {
                errMsg.Text = "<font color='red'>No records found</font>";
            }
        }
        catch (Exception ex)
        {
            errMsg.Text = ex.Message + "<br />" + ex.StackTrace;
        }
         
    }// end Setup_Table

    protected void gridStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridStudents.PageIndex = e.NewPageIndex;
        Setup_Table();
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        DateTime currDay = DateTime.Now;
        string oneLine;
        string currHour = currDay.Hour.ToString();
        string currMin = currDay.Minute.ToString();
        string filePath = Server.MapPath("~/exportFiles/studentApps-" + currDay.Month + "_" + currDay.Day + "_" + currDay.Year + "_" + currHour + "_" + currMin + ".txt");
       // string filePath = "\\\\ccs-webdev\\s$\\Web Sites\\Apps_Laura_7177\\exportFiles\\studentApps-" + currHour + "_" + currMin + ".txt";
        StreamWriter sw = null;
        FileStream fs = null;

        //email fields:
        string sendTo = "";
        string sentFrom = "";
        string strSubj = "";
        string strBody = "";
        string strCCaddresses = "";
        string strEmailResult = "";

        if (!File.Exists(filePath))
        {
            fs = File.Open(filePath, FileMode.Create, FileAccess.ReadWrite);
            sw = new StreamWriter(fs);
            sw.Flush();
            // write column headings to file
            oneLine = "First name|Middle name|Last name|DOB|Age|Gender|Marital status|Student status|Birth country|Citizenship country|";
            oneLine += "VISA|Number dependents|Insurance|Release|How hear about CCS|Address|City|State/Province|Zip code|Country|Phone|Email|";
            oneLine += "HS name|HS grad|Date|English porficiency|Start date|Program|University partners|Campus|Major|";
            oneLine += "How pay|Other sources|Payment option";
            sw.WriteLine(oneLine);
            sw.Flush();
            /******************************** ADDED 5/16/2014 for email **************************************/
            strBody = "<p>EXPORT FILE ATTACHED</p>";
            strBody += "Please save the attached file and import into Excel.";
            
            /* FOR TESTING --> show contents of file as well 
            strBody += oneLine;
            */
        }
        // create a datatable
        // foreach
        // cycle through each row and add commas - oneLine += "";
        // sw.WriteLine(oneline)
        // loop done
        // Pull the financial data
        int myAge = 0;
        //string returnMsg;
        string strHSGradDte = "";
        string strTOEFL = "";
        string strTOEFLdte = "";
        string strIELTS = "";
        string strIELTSdte = "";


        DateTime birthday;
        InternationalStudent myIStudent = new InternationalStudent();
        DataTable dtExport = new DataTable();
        dtExport = myIStudent.GetExportDataReDo();
       
        if (dtExport.Rows.Count > 0)
        {
            foreach (DataRow myRow in dtExport.Rows)
            {
                //calculate age
                if (myRow["DOB"].ToString() == "1900-01-01")
                    myAge = -1;
                else
                {
                    birthday = System.Convert.ToDateTime(myRow["DOB"].ToString());
                    myAge = currDay.Year - birthday.Year;
                    if (currDay < birthday.AddYears(myAge))
                        myAge--;
                }

                if (myRow["hsGradDate"].ToString() == "1/1/1900 12:00:00 AM")
                    strHSGradDte = "";
                else
                    strHSGradDte = myRow["hsGradDate"].ToString();
/*
                if (myRow["toeflScore"].ToString() == "0")
                    strTOEFL = "";
                else
                    strTOEFL = myRow["toeflScore"].ToString();

                if (myRow["toeflTestDate"].ToString() == "1/1/1900 12:00:00 AM")
                    strTOEFLdte = "";
                else
                    strTOEFLdte = myRow["toeflTestDate"].ToString();

                if (myRow["ieltsScore"].ToString() == "0.00")
                    strIELTS = "";
                else
                    strIELTS = myRow["ieltsScore"].ToString();

                if (myRow["ieltsTestDate"].ToString() == "1/1/1900 12:00:00 AM")
                    strIELTSdte = "";
                else
                    strIELTSdte = myRow["ieltsTestDate"].ToString();
*/
                
                oneLine = myRow["firstName"].ToString() + "|" + myRow["middleNames"].ToString() + "|" + myRow["familyName"].ToString() + "|";
                oneLine += myRow["DOB"].ToString() + "|" + myAge.ToString() + "|" + myRow["Gender"].ToString() + "|" + myRow["maritalStatus"].ToString() + "|" + myRow["studentStatus"].ToString() + "|" + myRow["countryOfBirth"].ToString() + "|";
                oneLine += myRow["countryOfCitizenship"].ToString() + "|" + myRow["visaType"].ToString() + "|";
                oneLine += myRow["numberDependents"].ToString() + "|";
                oneLine += myRow["healthIns"].ToString() + "|" + myRow["releaseInformation"].ToString() + "|" + myRow["howHearCCS"].ToString() + "|" + myRow["Addr"].ToString() + "|" + myRow["City"].ToString() + "|";
                oneLine += myRow["StateProv"].ToString() + "|" + myRow["Zip"].ToString() + "|" + myRow["Country"].ToString() + "|" + myRow["Phone"].ToString() + "|" + myRow["Email"].ToString() + "|";
                oneLine += myRow["hsName"].ToString() + "|" + myRow["hsGrad"].ToString() + "|" + strHSGradDte + "|" + myRow["englishAbility"].ToString() + "|";
                oneLine += myRow["studiesBegin"].ToString() + "|" + myRow["studyWhat"].ToString() + "|" + myRow["trSchools"].ToString() + "|";
                oneLine += myRow["studyWhere"].ToString() + "|" + myRow["studyMajor"].ToString() + "|" + myRow["payHow"].ToString() + "|" + myRow["payHowOther"].ToString() + "|";
                oneLine += myRow["payOption"].ToString();

                sw.WriteLine(oneLine);
                sw.Flush();

                /****************************** ADDED 5/16/2014 for email ****************************************/
                /* FOR TESTING - display contents of attached file in body of email
                 * strBody += oneLine;
                 */
            }
        }
        else
        {
            // no data found
            errMsg.Text = "No data found";
            fs.Close();
            sw = null;
            return;
        }
         
        // sw.Flush()
        fs.Close();
        sw = null;
        errMsg.Text = "records successfully exported.  File can be found at: \\\\dist17-ccsnet\\c$\\Web Sites\\portal.ccs.spokane.edu - .NET Apps\\internationalsa\\exportFiles";
       // Response.Write("returnMsg: " + returnMsg + "<br />");
        /********************************************************************************************************************/
        /********************************* ADDED 5/16/2014 TO SEND EMAIL WITH EXPORTED FILE *********************************/
        Utility uEmail = new Utility();
        sendTo = intlEmail;
        sentFrom = "ccsweb@ccs.spokane.edu";
        strSubj = "International Student application form submitted";
       // strCCaddresses = "larry.brunt@ccs.spokane.edu";
        strCCaddresses = "katherine.thompson@ccs.spokane.edu";
        //body of the email populated above when writing to the file
        strEmailResult = uEmail.SendEmailMsg(sendTo, sentFrom, strSubj, true, strBody, strCCaddresses, filePath);
        //Response.Write("return from email: " + strEmailResult + "<br />");

    }

        protected void gridStudents_OnSorting(object sender, GridViewSortEventArgs e)
    {
        //gridStudents.PageIndex = e.SortExpression;
        Setup_Table();
    }

}