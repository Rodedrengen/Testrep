; Created by Asger Juul Brunshøj

; Note: Save with encoding UTF-8 with BOM if possible.
; I had issues with special characters like in ¯\_(ツ)_/¯ that wouldn't work otherwise.
; Notepad will save UTF-8 files with BOM automatically (even though it does not say so).
; Some editors however save without BOM, and then special characters look messed up in the AHK GUI.

; Write your own AHK commands in this file to be recognized by the GUI. Take inspiration from the samples provided here.

;-------------------------------------------------------------------------------
;;; SEARCH GOOGLE ;;;
;-------------------------------------------------------------------------------
if input = g%A_Space% ; Search Google
{
    gui_search_title = LMGTFY
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=REPLACEME&btnG=Search&oq=&gs_l=")
}
else if input = a%A_Space% ; Search Google for AutoHotkey related stuff
{
    gui_search_title = Autohotkey Google Search
    gui_search("https://www.google.com/search?num=50&safe=off&site=&source=hp&q=autohotkey%20REPLACEME&btnG=Search&oq=&gs_l=")
}
else if input = l%A_Space% ; Search Google with ImFeelingLucky
{
    gui_search_title = I'm Feeling Lucky
    gui_search("http://www.google.com/search?q=REPLACEME&btnI=Im+Feeling+Lucky")
}
else if input = m%A_Space% ; Open more than one URL
{
    gui_search_title = multiple
    gui_search("https://www.google.com/search?&q=REPLACEME")
    gui_search("https://www.bing.com/search?q=REPLACEME")
    gui_search("https://duckduckgo.com/?q=REPLACEME")
}
else if input = x%A_Space% ; Search Google as Incognito
;   A note on how this works:
;   The function name "gui_search()" is poorly chosen.
;   What you actually specify as the parameter value is a command to run. It does not have to be a URL.
;   Before the command is run, the word REPLACEME is replaced by your input.
;   It does not have to be a search url, that was just the application I had in mind when I originally wrote it.
;   So what this does is that it runs chrome with the arguments "-incognito" and the google search URL where REPLACEME in the URL has been replaced by your input.
{
    gui_search_title = Google Search as Incognito
    gui_search("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe -incognito https://www.google.com/search?safe=off&q=REPLACEME")
}


;-------------------------------------------------------------------------------
;;; SEARCH OTHER THINGS ;;;
;-------------------------------------------------------------------------------
else if input = f%A_Space% ; Search Facebook
{
    gui_search_title = Search Facebook
    gui_search("https://www.facebook.com/search/results.php?q=REPLACEME")
}
else if input = y%A_Space% ; Search Youtube
{
    gui_search_title = Search Youtube
    gui_search("https://www.youtube.com/results?search_query=REPLACEME")
}
else if input = t%A_Space% ; Search torrent networks
{
    gui_search_title = Sharing is caring
    gui_search("https://kickass.to/usearch/REPLACEME")
}
else if input = kor ; Translate English to Korean
{
    gui_search_title = English to Korean
    gui_search("https://translate.google.com/#en/ko/REPLACEME")
}
else if input = den ; Translate English to Danish 
{
	gui_search_title = English to Danish
	gui_search("https://translate.google.com/#en/da/REPLACEME")
}


;-------------------------------------------------------------------------------
;;; LAUNCH WEBSITES AND PROGRAMS ;;;
;-------------------------------------------------------------------------------
else if input = / ; Go to subreddit. This is a quick way to navigate to a specific URL.
{
    gui_search_title := "/r/"
    gui_search("https://www.reddit.com/r/REPLACEME")
}
else if input = face ; facebook.com
{
    gui_destroy()
    run www.facebook.com
}
else if input = red ; reddit.com
{
    gui_destroy()
    run www.reddit.com
}
else if input = cal ; Google Calendar
{
    gui_destroy()
    run https://www.google.com/calendar
}
else if input = note ; Notepad
{
    gui_destroy()
    Run Notepad
}
else if input = paint ; MS Paint
{
    gui_destroy()
    run "C:\Windows\system32\mspaint.exe"
}
else if input = maps ; Google Maps focused on the Technical University of Denmark, DTU
{
    gui_destroy()
    run "https://www.google.com/maps/@55.7833964`,12.5244754`,12z"
}
else if input = inbox ; Open google inbox
{
    gui_destroy()
    run https://inbox.google.com/u/0/
    ; run https://mail.google.com/mail/u/0/#inbox  ; Maybe you prefer the old gmail
}
else if input = mes ; Opens Facebook unread messages
{
    gui_destroy()
    run https://www.messenger.com
}	
else if input = v2 ; Opens version 2.dk
{
    gui_destroy()
    run https://www.version2.dk/
}
else if input = url ; Open an URL from the clipboard (naive - will try to run whatever is in the clipboard)
{
    gui_destroy()
    run %ClipBoard%
}


;-------------------------------------------------------------------------------
;;; INTERACT WITH THIS AHK SCRIPT ;;;
;-------------------------------------------------------------------------------
else if input = rel ; Reload this script
{
    gui_destroy() ; removes the GUI even when the reload fails
    Reload
}
else if input = dir ; Open the directory for this script
{
    gui_destroy()
    Run, %A_ScriptDir%
}
else if input = host ; Edit host script
{
    gui_destroy()
    run, C:\Program Files (x86)\Notepad++\Notepad++.exe "%A_ScriptFullPath%"
}
else if input = user ; Edit GUI user commands
{
    gui_destroy()
    run, C:\Program Files (x86)\Notepad++\Notepad++.exe "%A_ScriptDir%\GUI\UserCommands.ahk"
}


;-------------------------------------------------------------------------------
;;; TYPE RAW TEXT ;;;
;-------------------------------------------------------------------------------
else if input = @ ; Email address
{
    gui_destroy()
    Send, simon.588.jorgensen@gmail.com
}
else if input = name ; My name
{
    gui_destroy()
    Send, Simon Kjems Jørgensen
}
else if input = phone ; My phone number
{
    gui_destroy()
    SendRaw, +45-51241205
}
else if input = logo ; ¯\_(ツ)_/¯
{
    gui_destroy()
    Send ¯\_(ツ)_/¯
}
else if input = clip ; Paste clipboard content without formatting
{
    gui_destroy()
    SendRaw, %ClipBoard%
}


;-------------------------------------------------------------------------------
;;; OPEN FOLDERS ;;;
;-------------------------------------------------------------------------------
else if input = loads ; Downloads
{
    gui_destroy()
    run C:\Users\%A_Username%\Downloads
}
else if input = rec ; Recycle Bin
{
    gui_destroy()
    Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}
else if input = folder ; Open personal folder
{
	gui_destroy()
	run, "C:\Users\simon\Documents"
}


;-------------------------------------------------------------------------------
;;; MISCELLANEOUS ;;;
;-------------------------------------------------------------------------------
else if input = start ;Starts works pc right
{
	gui_destroy()
	SendInput, echo "#Kajak8825!" | sudo -S <command>
	;Run, "C:\Users\Simon\Documents\docs\sciptsForAHK\WindowsPowerShell" -Command "c:\Users\Simon\Documents\docs\sciptsForAHK\wsl2PortFowardAndFirewall.ps1"
	;Sleep 3000
	;Run, "C:\Users\Simon\Documents\docs\sciptsForAHK\WindowsPowerShell" -Command "wsl"
	;Sleep 500
	
}
else if input = up ; Runs docker compose up -d in the directory of docker
{
	gui_destroy()
	Run, "C:\Users\simon\Documents\dockerCommands" /k "Docker-compose up -d"
}
else if input = down ; Runs docker compose down in the directory of docker
{
	gui_destroy() 
	Run, "C:\Users\simon\Documents\dockerCommands" /k "Docker-compose down"
}
else if input = docker ; Tried to open docker for desktop
{
	gui_destroy()
	Run, "C:\Program Files\Docker\Docker\Docker Desktop.exe" 
}
else if input = ping ; Ping Google
{
    gui_destroy()
    Run, cmd /K "ping www.google.com"
}
else if input = hosts ; Open hosts file in Notepad
{
    gui_destroy()
    Run notepad.exe C:\Windows\System32\drivers\etc\hosts
}
else if input = date ; What is the date?
{
    gui_destroy()
    FormatTime, date,, LongDate
    MsgBox %date%
    date =
}
else if input = week ; Which week is it?
{
    gui_destroy()
    FormatTime, weeknumber,, YWeek
    StringTrimLeft, weeknumbertrimmed, weeknumber, 4
    if (weeknumbertrimmed = 53)
        weeknumbertrimmed := 1
    MsgBox It is currently week %weeknumbertrimmed%
    weeknumber =
    weeknumbertrimmed =
}
else if input = ? ; Tooltip with list of commands
{
    GuiControl,, input, ; Clear the input box
    Gosub, gui_commandlibrary
}
