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

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Dim Сweekno_W(2) As String

	Private btn_save As Button
	Private edittext_firstweek As EditText
	Private edittext_secondweek As EditText
	Private spinner_curweek As Spinner
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
	Activity.LoadLayout("settings")
	
	If FirstTime Then 
		week0="Первая неделя"
		week1="Вторая неделя"
		Сweekno_W(0)="Первая неделя"
		Сweekno_W(1)="Вторая неделя"
	End If
	
	'Сweekno_W(0)="Первая неделя"
	'Сweekno_W(1)="Вторая неделя"
	
	spinner_curweek.AddAll(Сweekno_W)
End Sub

Sub Activity_Resume
	edittext_firstweek.Text=week0
	edittext_secondweek.Text=week1
	Сweekno_W(0)=week0
	Сweekno_W(1)=week1
End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub btn_save_Click
	week0=edittext_firstweek.Text
	week1=edittext_secondweek.Text
	Activity.Finish()
End Sub
Sub spinner_curweek_ItemClick (Position As Int, Value As Object)
	
End Sub