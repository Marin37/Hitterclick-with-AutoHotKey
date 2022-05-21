#SingleInstance, force

; A way of exiting the script, I use this by default
Escape::
ExitApp
Return

; Loop that just permaclicks
clickLoop:
Send {Click}
Return

; Default behavior DO NOT click
clickToggle = false

~F8::
; The key toggles the variable
clickToggle := !clickToggle

; When its pressed 1st time, toggles to true and clicks
; When its pressed 2nd time, toggles to false and stops
if (clickToggle)
    SetTimer, clickLoop, 5 ; when we loop we take a timer for each iteration
Else
    SetTimer, clickLoop, Off ; or Off when it should stop
Return


~F3::
; You can toggle only off with this key aswell, but this is only the variable
clickToggle := false
; We also need to stop the clickLoop
SetTimer, clickLoop, Off

; The key should allow only pressing once
; So this timer is but a filter
Sleep, 500

; Instead of looping, it works while it is pressed
While GetKeyState("F3", "P") {
    Send {Click}
}
Return