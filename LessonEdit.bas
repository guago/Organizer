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
End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Dim btn_timestart As Button
	Dim les As lesson
	Private spinner_weekday As Spinner
	Private spinner_weekno As Spinner
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
	Activity.LoadLayout("lessonedit")
	
	Dim Сweekday_W(6) As String
	Dim Сweekno_W(1) As String
	
	'-----------------------
	
	Сweekday_W(0)="Понедельник"
	Сweekday_W(1)="Вторник"
	Сweekday_W(2)="Среда"
	Сweekday_W(3)="Четверг"
	Сweekday_W(4)="Пятница"
	Сweekday_W(5)="Суббота"
	Сweekday_W(6)="Воскресенье"
	
	spinner_weekday.AddAll(Сweekday_W)
	
	'-----------------------
	
	Сweekno_W(0)="Первая неделя"
	Сweekno_W(1)="Вторая неделя"
	
	spinner_weekno.AddAll(Сweekno_W)
	
	'-----------------------
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


Sub btn_timestart_Click
	Dim Mint As String
	Dim СTimeDial As TimeDialog
	СTimeDial.Is24Hours=True
	СTimeDial.Show("","Время начала занятия","OK","Отмена","",Null)
	If СTimeDial.Minute<10 Then Mint="0"&СTimeDial.Minute Else Mint=СTimeDial.Minute
	btn_timestart.Text=СTimeDial.Hour & ":" & Mint
End Sub

Sub spinner_weekday_ItemClick (Position As Int, Value As Object)
	les.Сweekday=Position
	les.Сweekday_s=Value
End Sub

Sub spinner_weekno_ItemClick (Position As Int, Value As Object)
	les.Сweekno=Position
	les.Сweekno_s=Value
End Sub