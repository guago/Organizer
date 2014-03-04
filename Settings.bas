Type=Activity
Version=3.2
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Dim week0 As String
	Dim week1 As String
	Dim selected_week As Byte
	Dim selected_week_s As String

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Dim weekno(2) As String

	Private btn_save As Button
	Private edittext_firstweek As EditText
	Private edittext_secondweek As EditText
	Private spinner_curweek As Spinner
	Dim week_names As Map
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
	Activity.LoadLayout("settings")
	week_names.Initialize
	week_names=File.ReadMap(File.DirDefaultExternal, "week_names.txt")
	If FirstTime Then 
		selected_week=week_names.Get("curweek")
		week0=week_names.Get("week0")
		week1=week_names.Get("week1")
		weekno(0)=week_names.Get("week0")
		weekno(1)=week_names.Get("week1")
		spinner_curweek.SelectedIndex =selected_week
		
		If File.Exists(File.DirDefaultExternal, "week_names.txt") Then 
		
		Else 
			File.WriteMap(File.DirDefaultExternal, "week_names.txt", week_names)
		End If
	End If
	
	If FirstTime = False Then
	End If
	
	spinner_curweek.AddAll(weekno)
	
	
	
End Sub

Sub Activity_Resume
	edittext_firstweek.Text=week0
	edittext_secondweek.Text=week1
	spinner_curweek.Clear()
	spinner_curweek.Add(week0)
	spinner_curweek.Add(week1)
	spinner_curweek.SelectedIndex =selected_week
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub btn_save_Click
	week0=edittext_firstweek.Text
	week1=edittext_secondweek.Text
	selected_week=spinner_curweek.SelectedIndex
	selected_week_s=spinner_curweek.SelectedItem
	Main.curweek=spinner_curweek.SelectedIndex
	week_names.Put("week0",week0)
	week_names.Put("week1",week1)
	week_names.Put("curweek",selected_week)
	File.WriteMap(File.DirDefaultExternal, "week_names.txt", week_names)
	Activity.Finish()
End Sub
Sub spinner_curweek_ItemClick (Position As Int, Value As Object)
	
End Sub