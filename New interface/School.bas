
nomainwin
open "serial.txt" for append as #ser
close #ser
password$="bablu"
fsearch=0
feepaywin=0
open "serial.txt" for input as #ser
if eof(#ser)=-1 then
    snum=1
    open "student data.txt" for append as #in
    close #in
    open "fee data.txt" for append as #in
    close #in
    open "date data.txt" for append as #in
    close #in
    open "time data.txt" for append as #in
    close #in
    snum=1
    close #ser
    goto [sch]
    end if
input #ser,snum
close #ser

[sch]
'Form created with the help of Freeform 3 v07-15-08
'Generated on May 27, 2013 at 14:19:05


[setup.sch.Window]

    '-----Begin code for #sch

    WindowWidth = 1000
    WindowHeight = 600
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    '-----Begin GUI objects code

    button #sch.button1,"Tools",[tools], UL, 835,  12, 140,  60
    button #sch.button2,"Fee Payement",[feemenu], UL,  75, 212, 200,  60
    button #sch.button3,"Search",[search], UL, 555, 212, 240,  60
    button #sch.button4,"Add Student Details",[addstud], UL, 555, 292, 240,  60
    button #sch.button5,"Edit Student Details",[editstud], UL, 555, 372, 240,  60
    statictext #sch.statictext7, "Fee Details :", 115, 172, 120,  20
    statictext #sch.statictext8, "Student Details :", 595, 172, 160,  20

    '-----End GUI objects code

    open "School Management" for window as #sch
    print #sch, "font calibri 10"
    print #sch.statictext7, "!font calibri_light 16"
    print #sch.statictext8, "!font calibri_light 16"
    print #sch, "trapclose [quit]"
wait
'.................................
[quit]
gosub [quitc]
close #sch
end
[quitc]
confirm "You are about to QUIT?"; ab$
if ab$ <> "yes" then wait
return
'-----------------------------------------------------------------------------------------
[tools]
close #sch
'Form created with the help of Freeform 3 v07-15-08
'Generated on May 27, 2013 at 14:20:19


    '-----Begin code for #tools

    WindowWidth = 1000
    WindowHeight = 600
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    '-----Begin GUI objects code

    button #tools.button1,"<- Back",[backtools], UL,  15,  52, 140,  40
    button #tools.button2,"Sync data into excel",[syncexcel], UL, 255, 172, 300,  60

    '-----End GUI objects code

    open "Tools" for window as #tools
    print #tools, "font calibri 10"
    print #tools.button1, "!font calibri_light 12"
    print #tools.button2, "!font calibri_light 12"
wait
[syncexcel]
'kill "studentdata_excel.txt"
run "notepad help.txt"
open "studentdata_excel.txt" for output as #file1
open "student data.txt" for input as #datas
open "fee data.txt" for input as #fee
print #file1,"Serial No. ; Name ;Initial ;Class ;Section ;Father Name ;Phone ;Locality ;Annual Fee;Paid ;Balance ;"
for f=1 to (snum-1)
gosub [readfile]
for o=0 to 8 step 1
print #file1,disp$(o);
print #file1," ;";
next o
gosub [readfee]
print #file1,dummy$;
print dummy$
print #file1," "
next f
close #datas
close #fee
close #file1
notice "Student data file is ready to get imported into MS Excel"


[backtools]
close #tools
goto [sch]
'-----------------------------------------------------------------------------------------
[readfee]
for i=0 to 8 step 1
input #fee,fee(i)
if i<>0 and i<>8 then
paid=paid+fee(i)
end if
next i
dummy$=paid;" ;";fee(8);" ;"
return
'-----------------------------------------------------------------------------------------
[password]
prompt "-Enter Password to access-";psw$
if psw$="" then wait
if psw$<>password$ then
confirm "Wrong Password! Try Again!!";dummy$
if dummy$="no" then wait
else
return
end if


'-----------------------------------------------------------------------------------------
[addstud]
gosub [password]
close #sch
'Form created with the help of Freeform 3 v07-15-08
'Generated on May 27, 2013 at 15:48:25


[setup.main.Window]

    '-----Begin code for #main

    WindowWidth = 1000
    WindowHeight = 600
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    '-----Begin GUI objects code

    button #addstud.button1,"<- Back",[backaddstud], UL,  35,  32, 140,  40
    statictext #addstud.statictext2, "Name :",  95, 132,  46,  20
    statictext #addstud.statictext3, "Initial :", 495, 132,  45,  20
    statictext #addstud.statictext4, "Class :",  95, 192,  43,  20
    statictext #addstud.statictext5, "Sec :", 495, 192,  22,  20
    statictext #addstud.statictext6, "Father",  75, 232,  41,  20
    statictext #addstud.statictext7, "Name :",  95, 252,  46,  20
    statictext #addstud.statictext8, "Phone :\",  95, 312,  54,  20
    TextboxColor$ = "white"
    textbox #addstud.name, 155, 132, 220,  25
    textbox #addstud.in, 555, 132,  60,  25
    textbox #addstud.fname, 155, 232, 220,  25
    ComboboxColor$ = "white"
    combobox #addstud.listsec1, listsec1$(, [dummy],  555, 192,  60, 100
    combobox #addstud.list1, list1$(, [dummy],  155, 192,  60, 100
    textbox #addstud.num, 155, 312, 180,  25
    statictext #addstud.statictext17, "Locality :", 475, 312,  58,  20
    textbox #addstud.loc, 555, 312, 140,  25
    statictext #addstud.statictext19, "Annual Fee :",  75, 392,  80,  20
    textbox #addstud.fee, 215, 390, 100,  25
    statictext #addstud.statictext21, "`", 195, 395,  25,  20
    button #addstud.button22,"Save",[addsave], UL, 235, 472, 140,  40
    button #addstud.button23,"Cancel",[backadd], UL, 515, 472, 140,  40

    '-----End GUI objects code

    open "Add Student" for window as #addstud
    print #addstud, "font calibri 12"
    print #addstud.statictext21, "!font rupee_foradian 12"
    print #addstud, "trapclose [closeadd]"
    wait
    
'............................................
[closeadd]
gosub [quitc]
close #addstud
wait
[dummy]
wait
[backadd]
close #addstud
goto [sch]
'--------------------------------------------------------------------------
[serial]
open "serial.txt" for input as #ser
input #ser,snum
close #ser
return
'--------------------------------------------------------------------------
[addsave]
open "studenlist.txt" for append as #std
print #addstud.name, "!contents? name$"
print #addstud.in, "!contents? in$"
print #addstud.list1, "contents? class$"
print #addstud.listsec1, "contents? sec$"
print #addstud.fname, "!contents? fname$"
print #addstud.num, "!contents? num$"
print #addstud.loc, "!contents? loc$"
print #addstud.fee, "!contents? fee$"
print #std, "Serial  :";snum
print #std, "Name    :"; name$
print #std, "Initial  :";in$
print #std, "Class   :"; class$
print #std, "Sec     :"; sec$
print #std, "Father"
print #std, "Name    :"; fname$
print #std, "Phone   :"; num$
print #std, "Locality:"; loc$
print #std, "A.fee   :"; fee$
close #std
open "student data.txt" for append as #bab
print #bab,snum
print #bab, name$
print #bab, in$
print #bab, class$
print #bab, sec$
print #bab, fname$
print #bab, num$
print #bab, loc$
print #bab, fee$
close #bab
open "fee data.txt" for append as #bab
gosub [datainitial]
close #bab
open "date data.txt" for append as #bab
gosub [datainitial]
close #bab
open "time data.txt" for append as #bab
gosub [datainitial]
close #bab

notice "Student is added to the List"
notice "Registration number --  :";snum
snum=snum+1
open "serial.txt" for output as #ser
print #ser,snum
close #ser

goto [backadd]

[datainitial]
print #bab,snum
print #bab, "0"
print #bab, "0"
print #bab, "0"
print #bab, "0"
print #bab, "0"
print #bab, "0"
print #bab, "0"
print #bab, "0"
return
'-----------------------------------------------------------------------
[feemenu]
close #sch
[feemenuagain]
    '-----Begin code for #feemenu

windowWidth=1000
windowHeight=600
  UpperLeftX = 200
  UpperLeftY = 150
 '   UpperLeftX=int((DisplayWidth-WindowWidth)/2)
 '   UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    '-----Begin GUI objects code

    button #feemenu.button1,"<- Back",[backfeemenu], UL, 10,10
    button #feemenu.button2,"Pay Fee",[feepayment], UL, 60, 100, 200,  40
    button #feemenu.button3,"View Fee details",[viewfee], UL, 60, 150, 200,  40

    '-----End GUI objects code

    open "Fee account" for window as #feemenu
    print #feemenu, "font calibri 10"
    print #feemenu, "trapclose [closefeemenu]"
    wait
[backfeemenu]
close #feemenu
goto [sch]
[closefeemenu]
gosub [quitc]
close#feemenu
wait
'-----------------------------------------------------------------------
[feepayment]
gosub [password]
close #feemenu
fsearch=1
goto [search]
'notice "Under Construction"
wait
'------------------------------------------------------------------------
[editstud]
gosub [password]
close #sch

[edit1]
gosub [serial]
'Form created with the help of Freeform 3 v07-15-08
'Generated on May 27, 2013 at 15:56:45


[setup.edit1.Window]

    '-----Begin code for #edit1

    WindowWidth = 1000
    WindowHeight = 600
    UpperLeftX=int((DisplayWidth-WindowWidth)/2)
    UpperLeftY=int((DisplayHeight-WindowHeight)/2)


    '-----Begin GUI objects code

    button #edit1.button1,"<- Back",[backedit1], UL,  20,  20, 140,  40
    button #edit1.button2,"Search",[editsearch], UL, 275, 252, 360, 100
    TextboxColor$ = "white"
    textbox #edit1.snume1, 335, 192, 220,  25
    statictext #edit1.statictext4, "Enter Serial :", 215, 192,  69,  20

    '-----End GUI objects code

    open "Edit Info" for window as #edit1
    print #edit1, "font calibri 10"
    print #edit1.button2, "!font calibri_light 16"
    print #edit1, "trapclose [closeedit1]"
    wait
'---------------------------------------------------------------------------
[backedit1]
close #edit1
goto [sch]

[closeedit1]
gosub [quitc]
close #edit1
wait
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

[editsearch]

open "student data.txt" for input as #babb
print #edit1.snume1, "!contents? snume$"
e=snum*9
 for i=1 to e
if eof(#babb) then [stopLooping]
line input #babb, line$
 print line$
 if line$=snume$ then [found]
 next i
close #babb


[stopLooping]
notice "Serial number entered is not found!!"
close #babb
wait
'goto [backedit1]

'..........................................................
[found]
