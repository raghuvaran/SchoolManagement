
nomainwin
  WindowWidth = 500
  WindowHeight = 500
  UpperLeftX = 200
  UpperLeftY = 150

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



textbox #wind.text1, 150, 10, 200, 20
textbox #wind.text2, 150, 70, 200, 20
textbox #wind.text3, 150, 1000, 200, 20
statictext #wind.stat1,"Name of the Student", 10,10,130,20
combobox #wind.list1, list1$(, [ddd], 150, 40, 200, 20
button #wind.but, "GO!", [go], LL, 10,10

open "School" for window as #wind
[ddd]
wait
[go]
open "sat.txt" for append as #go
print #wind.text1, "!contents? abc1$"
print #wind.text2, "!contents? abc2$"
print #wind.text3, "!contents? abc3$"
print #wind.list1, "contents? acd$"
print #go, 1;abc1$ 
print #go, 2;abc2$
print #go, 3;abc3$
print #go, 4;acd$

close #go
close#wind
end

