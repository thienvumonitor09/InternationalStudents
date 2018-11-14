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

public partial class InternationalStudents_Standardized_xxinternationalReportSummary : System.Web.UI.Page
{
    string SID;
    string sql;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            errMsg.Text = "";
            gridStudents.PageSize = 12;
            gridStudents.AllowPaging = true;
            gridStudents.AllowSorting = true;

            gridStudents.PreRender += new EventHandler(gridStudents_PageIndexChanged);
            // linkMsg.Text = "";
            Setup_Table();
        }
    }// end page load

        void gridStudents_PageIndexChanged(object sender, EventArgs e)
    {
        formatPos();
    }

    protected void formatPos()
    {

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

    protected void btnExport_Click(object sender, EventArgs e)
    {
        DateTime currDay = DateTime.Now;
        string oneLine;
        string currHour = currDay.Hour.ToString();
        string currMin = currDay.Minute.ToString();
        string filePath = Server.MapPath("/exportFiles/studentApps-" + currHour + "_" + currMin + ".txt");
        // string filePath = "\\\\ccs-webdev\\s$\\Web Sites\\Apps_Laura_7177\\exportFiles\\studentApps-" + currHour + "_" + currMin + ".txt";
        StreamWriter sw = null;
        FileStream fs = null;

        if (!File.Exists(filePath))
        {
            fs = File.Open(filePath, FileMode.Create, FileAccess.ReadWrite);
            sw = new StreamWriter(fs);
            sw.Flush();
            // write column headings to file
            oneLine = "First name,Middle name,Last name,DOB,Age,Gender,Status,Birth country,Citizenship country,Native language,English abiltiy,";
            oneLine += "VISA,Number dependents,I-20,Medical,Medical detail,Special needs,Special needs detail,Insurance,Release,Address,City,State/Province,Zip code,Country,Phone,Email,";
            oneLine += "HS name,HS grad,Date,TOEFL school,TOEFL score,TOEFL date,IELTS score,IELTS date,Start date,Program,Campus,Major,Length,";
            oneLine += "How pay,Other sources,Payment option,Housing option";
            sw.WriteLine(oneLine);
            sw.Flush();
        }
        // create a datatable
        // foreach
        // cycle through each row and add commas - oneLine += "";
        // sw.WriteLine(oneline)
        // loop done
        // Pull the financial data
        int myAge = 0;
        DateTime birthday;
        InternationalStudent myIStudent = new InternationalStudent();
        DataTable dtExport = new DataTable();
        dtExport = myIStudent.GetExportData();

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

                oneLine = myRow["firstName"].ToString() + "," + myRow["middleNames"].ToString() + "," + myRow["familyName"].ToString() + ",";
                oneLine += myRow["DOB"].ToString() + "," + myAge.ToString() + "," + myRow["Gender"].ToString() + "," + myRow["studentStatus"].ToString() + "," + myRow["countryOfBirth"].ToString() + ",";
                oneLine += myRow["countryOfCitizenship"].ToString() + "," + myRow["nativeLanguage"].ToString() + "," + myRow["englishAbility"].ToString() + "," + myRow["visaType"].ToString() + ",";
                oneLine += myRow["numberDependents"].ToString() + "," + myRow["sendI_20"].ToString() + "," + myRow["medicalConditions"].ToString() + "," + myRow["medicalCondDetail"].ToString() + "," + myRow["specialAccommodations"].ToString() + "," + myRow["specialAccommodationDetail"].ToString() + ",";
                oneLine += myRow["healthIns"].ToString() + "," + myRow["releaseInformation"].ToString() + "," + myRow["Addr"].ToString() + "," + myRow["City"].ToString() + ",";
                oneLine += myRow["StateProv"].ToString() + "," + myRow["Zip"].ToString() + "," + myRow["Country"].ToString() + "," + myRow["Phone"].ToString() + "," + myRow["Email"].ToString() + ",";
                oneLine += myRow["hsName"].ToString() + "," + myRow["hsGrad"].ToString() + "," + myRow["hsGradDate"].ToString() + "," + myRow["toeflSchoolCode"].ToString() + "," + myRow["toeflScore"].ToString() + ",";
                oneLine += myRow["toeflTestDate"].ToString() + "," + myRow["ieltsScore"].ToString() + "," + myRow["ieltsTestDate"].ToString() + "," + myRow["studiesBegin"].ToString() + "," + myRow["studyWhat"].ToString() + ",";
                oneLine += myRow["studyWhere"].ToString() + "," + myRow["studyMajor"].ToString() + "," + myRow["studyLength"].ToString() + "," + myRow["payHow"].ToString() + "," + myRow["payHowOther"].ToString() + ",";
                oneLine += myRow["payOption"].ToString() + "," + myRow["housingFindOwn"].ToString();

                sw.WriteLine(oneLine);
                sw.Flush();
            }
        }
        else
        {
            // no financial data found
        }

        // sw.Flush()
        fs.Close();
        sw = null;
        // Response.Write("returnMsg: " + returnMsg + "<br />");

    }// end export_click
}