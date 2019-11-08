; --------------------------------------------------
; This script generates the demo svg
; --------------------------------------------------
#SingleInstance Force
SetkeyDelay 0, 50

; NOTE: This should be executed in the demo folder

Outfile := "cast.svg"          ; cast.svg     | cast-js.svg
Template := "window_frame"     ; window_frame | window_frame_js

Return

Type(Command, Delay=2000) {
  Send % Command
  Sleep 500
  Send {Enter}
  Sleep Delay
}

F12::
  Type("rm -rf test")
  Type("termtosvg " Outfile " -t " Template)

  Type("mkdir test && cd ./test")
  Type("run")

  Type("{#} Create a new Runfile", 500)
  Type("run new")
  Type("ls")
  Type("cat Runfile", 4000)

  Type("{#} Use the Runfile", 500)
  Type("run")
  Type("run --help", 3000)
  Type("run hello")
  Type("run hello Luke")

  Type("exit")
Return

^F12::
  Reload
return

^x::
  ExitApp
return
