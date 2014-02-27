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
	Dim les As lesson
	Dim tstart As String
	Dim tend As String
	Dim hrss As Byte
	Dim mnts As Byte
	Dim hrse As Byte
	Dim mnte As Byte
	Private spinner_weekday As Spinner
	Private spinner_weekno As Spinner
	Private spinner_type As Spinner
	Private edittext_subject As EditText
	Private btn_save As Button
	Private edittext_teacher As EditText
	Private edittext_room As EditText
	Private btn_timestart As Button
	Private btnl_timeend As Button
	Dim les_array(6,3,6) As lesson
	Private spinner_no As Spinner
End Sub

Sub Activity_Create(FirstTime As Boolean)
	les.Initialize(0,0,1,"","-","",0,"9:00","10:35")
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
	Activity.LoadLayout("lessonedit")
	
	Dim Сweekday_W(6) As String
	Dim Сweekno_W(3) As String
	Dim Ctype_W(4) As String
	Dim Cno_W(6) As String
	
	'-----------------------
	
	Сweekday_W(0)="Понедельник"
	Сweekday_W(1)="Вторник"
	Сweekday_W(2)="Среда"
	Сweekday_W(3)="Четверг"
	Сweekday_W(4)="Пятница"
	Сweekday_W(5)="Суббота"
	
	spinner_weekday.AddAll(Сweekday_W)
	
	'-----------------------
	
	Сweekno_W(0)="-"
	Сweekno_W(1)="Первая неделя"
	Сweekno_W(2)="Вторая неделя"
	
	spinner_weekno.AddAll(Сweekno_W)
	
	'-----------------------
	
	Ctype_W(0)="-"
	Ctype_W(1)="Лекция"
	Ctype_W(2)="Практика"
	Ctype_W(3)="Лабораторная"
	
	spinner_type.AddAll(Ctype_W)
	
	'-----------------------
	
	Cno_W(0)="1"
	Cno_W(1)="2"
	Cno_W(2)="3"
	Cno_W(3)="4"
	Cno_W(4)="5"
	Cno_W(5)="6"
	
	spinner_no.AddAll(Cno_W)
	
	'-----------------------
	hrss=9
	mnts=0
	hrse=10
	mnte=35
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub


Sub btn_timestart_Click
	Dim Mint As String
	Dim СTimeDial As TimeDialog
	СTimeDial.Is24Hours=True
	СTimeDial.SetTime(hrss,mnts,True)
	СTimeDial.Show("","Время начала занятия","OK","Отмена","",Null)
	If СTimeDial.Minute<10 Then Mint="0"&СTimeDial.Minute Else Mint=СTimeDial.Minute
	btn_timestart.Text=СTimeDial.Hour & ":" & Mint
	tstart=СTimeDial.Hour & ":" & Mint
	hrss=СTimeDial.Hour
	mnts=СTimeDial.Minute
End Sub

Sub btnl_timeend_Click
	Dim Mint As String
	Dim СTimeDial As TimeDialog
	СTimeDial.Is24Hours=True
	СTimeDial.SetTime(hrse,mnte,True)
	СTimeDial.Show("","Время окончания занятия","OK","Отмена","",Null)
	If СTimeDial.Minute<10 Then Mint="0"&СTimeDial.Minute Else Mint=СTimeDial.Minute
	btnl_timeend.Text=СTimeDial.Hour & ":" & Mint
	tend=СTimeDial.Hour & ":" & Mint
	hrse=СTimeDial.Hour
	mnte=СTimeDial.Minute
End Sub

Sub btn_save_Click
	les_array(spinner_weekday.SelectedIndex,spinner_weekno.SelectedIndex,spinner_no.SelectedIndex).Сsubject=edittext_subject.Text
	les_array(spinner_weekday.SelectedIndex,spinner_weekno.SelectedIndex,spinner_no.SelectedIndex).Сteacher=edittext_teacher.Text
	les_array(spinner_weekday.SelectedIndex,spinner_weekno.SelectedIndex,spinner_no.SelectedIndex).Сroom=edittext_room.Text
	les_array(spinner_weekday.SelectedIndex,spinner_weekno.SelectedIndex,spinner_no.SelectedIndex).Сtimestart=tstart
	les_array(spinner_weekday.SelectedIndex,spinner_weekno.SelectedIndex,spinner_no.SelectedIndex).Сtimeend=tend
	les_array(spinner_weekday.SelectedIndex,spinner_weekno.SelectedIndex,spinner_no.SelectedIndex).Сweekday_s=spinner_weekday.SelectedItem
	les_array(spinner_weekday.SelectedIndex,spinner_weekno.SelectedIndex,spinner_no.SelectedIndex).Сweekno_s=spinner_weekno.SelectedItem
	les_array(spinner_weekday.SelectedIndex,spinner_weekno.SelectedIndex,spinner_no.SelectedIndex).Сno=spinner_no.SelectedItem
	les_array(spinner_weekday.SelectedIndex,spinner_weekno.SelectedIndex,spinner_no.SelectedIndex).Ctype_=spinner_type.SelectedItem
	'File.WriteString("/storage/emulated/0","test.txt",edittext_no.Text&" "&edittext_subject.Text&" "&edittext_teacher.Text&" "&edittext_room.Text&" "&tstart&" "&tend)
	'Main.s=edittext_no.Text&" "&edittext_subject.Text&" "&edittext_teacher.Text&" "&edittext_room.Text&" "&tstart&" "&tend
	'les_array(spinner_weekday.SelectedIndex,spinner_weekno.SelectedIndex,spinner_no.SelectedIndex)
	
	Activity.Finish()
End Sub
