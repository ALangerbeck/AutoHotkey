^q::
;Send, Hello World
MsgBox, Hello World
return

^w::
value = 6
MsgBox, %value%
return


^e::
InputBox, Output, Type a number
send,%Output%
return