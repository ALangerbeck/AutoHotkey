^q::
MouseGetPos, OutputVarX, OutputVarY
while GetKeyState(^q)
{
Click, %OutputVarX%, %OutputVarY%
}
return

^w::
MouseGetPos, outputX, outputY
target = X%outputX% Y%outputY%
send, %target%
return

^e::
MouseGetPos, outputX, outputY
target = X%outputX% Y%outputY%
WinGetTitle, Title, A
ControlClick, %target%, %title%

return


#MaxThreadsPerHotkey 3
#z::  ; Win+Z hotkey (change this hotkey to suit your preferences).
#MaxThreadsPerHotkey 1
if KeepWinZRunning  ; This means an underlying thread is already running the loop below.
{
    KeepWinZRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
MouseGetPos, outputX, outputY
target = X%outputX% Y%outputY%
KeepWinZRunning := true
Loop
{
    ; The next four lines are the action you want to repeat (update them to suit your preferences):
    SetControlDelay -1
    WinGetTitle, Title, A
    ControlClick, %target%, %title%

    ; But leave the rest below unchanged.
    if not KeepWinZRunning  ; The user signaled the loop to stop by pressing Win-Z again.
        break  ; Break out of this loop.
}
KeepWinZRunning := false  ; Reset in preparation for the next press of this hotkey.
return


Escape:: 
ExitApp 
Return