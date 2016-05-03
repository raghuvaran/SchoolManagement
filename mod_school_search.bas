nomainwin
open "serial.txt" for input as #ser
input #ser,snum
close #ser

[search]
windowWidth=1000
windowHeight=600
  UpperLeftX = 200
  UpperLeftY = 150

button #search.back, "<- Back", [backsearch],UL,10,10
button #search.close, "Close", [closesearch],UR,30,10,70,25

statictext #search.namet, "Enter Name :",10,75,75,20
textbox #search.name, 90, 70, 150, 25
button #search.search, "Search", [namesearch],UL, 50,110,200,50
button #search.cancel, "Cancel", [backsearch], UR 30,180,70,25


open "Edit Info" for window as #search
'print #search, "trapclose [closesearch]"
wait

[namesearch]
print #search.name, "!contents? sname$"
sname$ = upper$(sname$)
open "student data.txt" for input as #datas
m=0
for i=1 to (snum-1)
if eof(#datas) then [error]
gosub [readfile]
dum$= upper$(disp$(1))
if instr(dum$, sname$) > 0 then gosub [sresult]
next i
if m>1 then goto [dispresult]
if m=1 then goto[di]
[error]
close #datas
notice "Name not found in the list!"
wait
[di]
t=m
goto [disp]

[sresult]
m=m+1
smat$(m)=disp$(0)
nmat$(m)=disp$(1)
imat$(m)=disp$(2)
cmat$(m)=disp$(3)
semat$(m)=disp$(4)
fmat$(m)=disp$(5)
pmat$(m)=disp$(6)
lmat$(m)=disp$(7)
femat$(m)=disp$(8)
return

[dispresult]
windowWidth=500
windowHeight=160
for y=1 to m
matlist$(y)=nmat$(y);"          ";imat$(y);"       |    ";cmat$(y);"               ";semat$(y)
next y
listbox #dispresult.box,matlist$(),[selected],10, 40, 250, 160
statictext #dispresult.help,"*Select one of the above",5,210,200,15
statictext #dispresult.legend,"   Name   |    Initial      |    Class   |   Sec",5,20,240,15
open "Search Results" for window as #dispresult
Print #dispresult.box, "singleclickselect"
wait

[selected]
print #dispresult.box,"selection?"
Input #dispresult.box, stry$
for y=1 to m
if stry$=matlist$(y) then t=y
next y
[disp]
disp$(0)=smat$(t)
disp$(1)=nmat$(t)
disp$(2)=imat$(t)
disp$(3)=cmat$(t)
disp$(4)=semat$(t)
disp$(5)=fmat$(t)
disp$(6)=pmat$(t)
disp$(7)=lmat$(t)
disp$(8)=femat$(t)

[matched]
close #datas
if t=m then notice "Name found!!"
if t<>m then close #dispresult
close #search
gosub [display]

[display]
windowWidth=1000
windowHeight=600
  UpperLeftX = 200
  UpperLeftY = 150

button #display.ok,"OK",[closedisplay],LL,60,40,200,50

statictext #display.st,"Serial:",  15,20, 30,20
statictext #display.s,disp$(0) ,  50,20, 150,40
statictext #display.namet,"Name:",  15,50, 30,20
statictext #display.name,disp$(1) ,  50,50, 150,40
statictext #display.namet,"Initial:",  210,50, 30,20
statictext #display.name,disp$(2) ,  240,50, 150,40
statictext #display.classt,"Class :",  15,80, 40,20
statictext #display.class,disp$(3),  50,80, 30,15
statictext #display.sect, "Sec :",  150,80, 30,20
statictext #display.sec,disp$(4),  200,80, 30,15
statictext #display.fnamet, "Father Name:",  15,110,70,15
statictext #display.fname,disp$(5), 85,110,200,25
statictext #display.numt, "Phone:",  15,140, 35,15
statictext #display.num,disp$(6), 60,140,140,25
statictext #display.loct, "Locality:",  15,170, 50,15
statictext #display.loc,disp$(7), 60,170,140,25
'statictext #display.feet, "Annual Fee:   Rs",  15,200, 80,15
'statictext #display.fee,disp$(7), 100,200,120,25
'statictext #display.fee1t, "/-",  140, 200, 50, 25
open "Display" for window as #display
print #display, "trapclose [closedisplay]"
wait


[readfile]
for o=0 to 8 step 1
line input #datas,disp$(o)
next o
return

[closedisplay]
close #display
wait




