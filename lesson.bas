Type=Class
Version=3.2
@EndOfDesignText@
'Class module
Sub Class_Globals
	Dim Сweekday As Byte
	Dim Сweekday_s As String
	
	Dim Сweekno As Byte
	Dim Сweekno_s As String
	
	Dim Сno As Byte
	Dim Сsubject As String
	Dim Ctype_ As String
	Dim Сteacher As String
	Dim Сroom As Int
	Dim Сtimestart As String
	Dim Сtimeend As String
	Private spinner_weekday As Spinner
	Private spinner_weekno As Spinner
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize (weekday As Byte,weekno As Byte,no As Byte,subject As String,type_ As String,teacher As String,room As Int,timestart As String,timeend As String)
	
	Сweekday=weekday
	Сweekno=weekno
	Сno=no
	Сsubject=subject
	Ctype_=type_
	Сteacher=teacher
	Сroom=room
	Сtimestart=timestart
	Сtimeend=timeend
	
	
End Sub
