ha=date$("days")
print "Date using date$() function:";date$()
print "No. of days:";ha
print "Retrive date:";date$(ha)


open "c:\k\new.txt" for append as #in
print #in, date$()
close #in

run "C:\Program Files (x86)\Microsoft Office\Office14\EXCEL.exe"
