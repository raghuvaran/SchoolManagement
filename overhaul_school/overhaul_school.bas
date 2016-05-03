
nomainwin
[sch]

windowWidth=1000
windowHeight=600
  UpperLeftX = 200
  UpperLeftY = 150
button #sch.fee, "Fee Payment", [feepay], UL, 10, 100
button #sch.addstud, "Add Student Details", [addstud], UL, 132, 200
button #sch.editstud, "Edit Student Details", [editstud], UL, 130, 230
button #sch.close, "Close", [quit], UR,10, 10
statictext #sch.1, "Fee Details", 20, 80, 100,15
statictext #sch.2, "Student Details", 160, 180, 100,15
open "School Management" for window as #sch
print #sch, "trapclose [quit]"
wait
'.................................
[quit]
confirm "You are about to QUIT?"; ab$
if ab$ <> "yes" then wait
close #sch
end
'-----------------------------------------------------------------------------------------

[addstud]
close #sch
windowWidth=1000
windowHeight=600
dim list$(10)
  list1$(0) = "I"
  list1$(1) = "II"
  list1$(2) = "III"
  list1$(3) = "IV"
  list1$(4) = "V"
  list1$(5) = "VI"
  list1$(6) = "VII"
  list1$(7) = "VIII"
  list1$(8) = "IX"
  list1$(9) = "X"

dim listsec$(10)
  listsec1$(0) = "A"
  listsec1$(1) = "B"
  listsec1$(2) = "C"
  listsec1$(3) = "D"

button #addstud.back, "<- Back",[backadd], UL, 10,10
button #addstud.close, "Close", [closeadd], UR,10, 10
statictext #addstud.namet, "Name:",  15,50, 30,15
textbox #addstud.name, 70,45,200,25
statictext #addstud.classt, "Class :",  15,90, 30,15
combobox #addstud.list1, list1$(, [dummy], 70, 85, 50, 25
statictext #addstud.sect, "Sec :",  180,90, 30,15
combobox #addstud.listsec1, listsec1$(, [dummy], 210, 85, 50, 25
statictext #addstud.fnamet, "Father Name:",  15,120, 30,30
textbox #addstud.fname, 70,120,200,25
statictext #addstud.numt, "Phone:",  85,160, 35,15
textbox #addstud.num, 130,155,140,25
statictext #addstud.loct, "Locality:",  85,190, 40,15
textbox #addstud.loc, 130,187,140,25
statictext #addstud.feet, "Annual Fee:   Rs",  15,220, 80,15
textbox #addstud.fee, 95,215,120,25
statictext #addstud.fee1t, "/-",  215, 220, 50, 25
button #addstud.save, "Save", [addsave], UL, 50, 270, 50, 25
button #addstud.save, "Cancel", [backadd], UL, 200, 270, 50, 25

open "Add Student" for window as #addstud
print #addstud, "trapclose [closeadd]"

wait
'............................................
[closeadd]
confirm "You are about to QUIT?"; ab$
if ab$ <> "yes" then wait
close #addstud
wait
[dummy]
wait
[backadd]
close #addstud
goto [sch]
'--------------------------------------------------------------------------

[addsave]
open "studenlist.txt" for append as #std
print #addstud.name, "!contents? name$"
print #addstud.list1, "contents? class$"
print #addstud.listsec1, "contents? sec$"
print #addstud.fname, "!contents? fname$"
print #addstud.num, "!contents? num$"
print #addstud.loc, "!contents? loc$"
print #addstud.fee, "!contents? fee$"
print #std, "Name    :"; name$
print #std, "Class   :"; class$
print #std, "Sec     :"; sec$
print #std, "Father"
print #std, "Name    :"; fname$
print #std, "Phone   :"; num$
print #std, "Locality:"; loc$
print #std, "A.fee   :"; fee$
close #std
open "student data.txt" for append as #bab
print #bab, name$
print #bab, class$
print #bab, sec$
print #bab, fname$
print #bab, num$
print #bab, loc$
print #bab, fee$
close #bab

notice "Student added to the List"
goto [backadd]
'-----------------------------------------------------------------------
[feepay]
notice "Under Construction"
wait
'------------------------------------------------------------------------
[editstud]
close #sch
windowWidth=300
windowHeight=80
dim list23$(10)
  list23$(0) = "I"
  list23$(1) = "II"
  list23$(2) = "III"
  list23$(3) = "IV"
  list23$(4) = "V"
  list23$(5) = "VI"
  list23$(6) = "VII"
  list23$(7) = "VIII"
  list23$(8) = "IX"
  list23$(9) = "X"

dim listsec23$(4)
  listsec23$(0) = "A"
  listsec23$(1) = "B"
  listsec23$(2) = "C"
  listsec23$(3) = "D"

button #edit1.back, "<- Back", [backedit1],UL,10,10
button #edit1.close, "Close", [closeedit1],UR,30,10,70,25
statictext #edit1.class, "Class:",10,75,50,15
combobox #edit1.list23, list23$(), [dummy], 60, 70, 50, 25
statictext #edit1.listsec23, "Sec:", 180, 75,35,15
combobox #edit1.listsec23, listsec23$(), [dummy], 220, 70, 50, 25
button #edit1.search, "Search", [editsearch],UL, 50,110,200,50
button #edit1.cancel, "Cancel", [backedit1], UR 30,180,70,25


open "Edit Info" for window as #edit1
print #edit1, "trapclose [closeedit1]"
wait
'---------------------------------------------------------------------------
[backedit1]
close #edit1
goto [sch]

[closeedit1]
confirm "You are about to QUIT?"; ab$
if ab$ <> "yes" then wait
close #edit1
wait
