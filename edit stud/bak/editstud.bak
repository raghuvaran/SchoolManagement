nomainwin

[edit2]
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

dim listsec$(4)
  listsec1$(0) = "A"
  listsec1$(1) = "B"
  listsec1$(2) = "C"
  listsec1$(3) = "D"
asdf$ = "ad"
button #asd.back, "<- Back",[backadd], UL, 10,10
button #asd.close, "Close", [closeadd], UR,10, 10
statictext #asd.name, "Name:",  15,50, 30,15
textbox #asd.name, 70,45,200,20
statictext #asd.oname, "--";asdf$,  70,65, 30,15
statictext #asd.ocls, "--";asdf$,  70,105, 30,15
statictext #asd.osec, "--";asdf$,  210,105, 30,15
statictext #asd.ofname, "--";asdf$,  70,145, 30,15
statictext #asd.onum, "--";asdf$,  130,180, 30,15
statictext #asd.ofee, "--";asdf$,  95,245, 30,15
statictext #asd.cls, "Cls :",  15,90, 30,15
combobox #asd.list1, list1$(, [dummy], 70, 85, 50, 25
statictext #asd.sec, "Sec :",  180,90, 30,15
combobox #asd.listsec1, listsec1$(, [dummy], 210, 85, 50, 25
statictext #asd.fname, "Father Name:",  15,120, 30,30
textbox #asd.fname, 70,120,200,25
statictext #asd.num, "Phone:",  85,160, 35,15
textbox #asd.num, 130,155,140,25
statictext #asd.fee, "Annual Fee:   Rs",  15,220, 80,15
textbox #asd.fee, 95,215,120,25
statictext #asd.fee1, "/-",  215, 220, 50, 25
button #asd.save, "Save", [addsave], UL, 50, 270, 50, 25
button #asd.save, "Cancel", [backadd], UL, 200, 270, 50, 25

open "Edit Student Info" for window as #asd
print #asd, "trapclose [closeadd]"
print #asd.name, asdf$
print #asd.fname, asdf$
print #asd.num, asdf$
print #asd.fee, asdf$
wait
[closeadd]

close #asd
wait
[dummy]
wait
