﻿;==================================================================================================

#NoEnv

SetBatchLines -1
SetTitleMatchMode 2
#SingleInstance Force
#NoTrayIcon

;by: jakiś ziomek z reddita
;kot poprawił i dodał coś od siebie

;===================================================================================================
;GUI
;===================================================================================================

; Generated by AutoGUI 1.4.9a
; Naprawione przez k0
#NoEnv
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

wintit = Minecraft 1. ahk_exe javaw.exe

Gui Font, Italic
Gui Add, Text, x87 y40 w60 h24 +0x200, by k0, v. 3.3
Gui Font
Gui Add, Button, x5 y176 w95 h36 gFishing, % " Przytrzymywanie ppm"
Gui Add, Button, x109 y176 w95 h36 gDig, % "Przytrzymywanie lpm"
Gui Add, Text, x5 y224 w197 h31, Co ile sekund ma być wykonywane kliknięcie?
Gui Add, Edit, x5 y264 w197 h21 vKlik
Gui Add, Button, x5 y288 w80 h23 gclicklpm, % "LPM"
Gui Add, Button, x117 y288 w80 h23 gclickppm, % "PPM"
Gui Add, Button, x5 y328 w197 h23 grapidppm, % "Spam ppm"
Gui Add, Button, x5 y352 w197 h23 grapidlpm, % "Spam lpm"
Gui Add, Text, x5 y392 w192 h23 +0x200, Wpisz ilość CPS dla autoklikera
Gui Add, Edit, x5 y416 w192 h21 vCPS
Gui Add, Button, x5 y440 w80 h23 gSpamlpm, % "LPM"
Gui Add, Button, x117 y440 w80 h23 gSpamppm, % "PPM"
Gui Add, Button, x5 y480 w192 h38 gStop, % "Zatrzymaj wszystkie makra"
Gui Font, s20 Bold, Arial
Gui Add, Text, x28 y8 w152 h32 +0x200 Center, MakroKit
Gui Font
Gui Add, Text, x11 y72 w186 h44, Jeśli program nie działa, ponieważ Twoje okno Minecrafta ma inną nazwę niż standardowa, zmień ją tutaj:
Gui Add, Edit, x-392 y-64 w186 h21, vCPS
Gui Add, Button, x11 y137 w186 h23 gName, % "Zmień nazwę"
Gui Add, Edit, x11 y116 w186 h21 vNazwa

Gui Show, w208 h526, MakroKit
WinSet, Transparent, 170, MakroKit
Return
GuiEscape:
GuiClose:
	BreakLoop = 1
    ExitApp


;===================================================================================================
;===================================================================================================
Fishing:
{
IfWinExist %wintit%
	BreakLoop = 0
ControlClick, , %wintit%, ,Right, , NAD
		Loop
		{
			if (BreakLoop = 1)
			{
				Sleep 500
				ControlClick, , %wintit%, ,Right, , NAU
				BreakLoop = 0
				break
			}
		}
	Return
}
Dig:
{
IfWinExist %wintit%
	BreakLoop = 0
ControlClick, , %wintit%, ,Left, , NAD
		Loop
		{
			if (BreakLoop = 1)
			{
				Sleep 500
				ControlClick, , %wintit%, ,Left, , NAU
				BreakLoop = 0
				break
			}
		}
	Return
}
rapidlpm:
{
IfWinExist %wintit%
	BreakLoop = 0
		Loop
		{
			if (BreakLoop = 1)
			{
				BreakLoop = 0
				break
			}
				ControlClick, , %wintit%, ,Left, , NAD
				Sleep 100
				ControlClick, , %wintit%, ,Left, , NAU
		}
	Return
}

rapidppm:
{
IfWinExist %wintit%
	BreakLoop = 0
		Loop
		{
			if (BreakLoop = 1)
			{
				BreakLoop = 0
				break
			}
				ControlClick, , %wintit%, ,Right, , NAD
				Sleep 100
				ControlClick, , %wintit%, ,Right, , NAU
		}
	Return
}

clicklpm:
{
Gui, Submit, NoHide
IfWinExist %wintit%
	BreakLoop = 0
		Loop
		{
			if (BreakLoop = 1)
			{
				BreakLoop = 0
				break
			}
			ControlClick, , %wintit%, ,Left, , NA
			Sleep 1000 * Klik
		}
	Return
}
clickppm:
{
Gui, Submit, NoHide
IfWinExist %wintit%
	BreakLoop = 0
		Loop
		{
			if (BreakLoop = 1)
			{
				BreakLoop = 0
				break
			}
			ControlClick, , %wintit%, ,Left, , NA
			Sleep 1000 * Klik
		}
	Return
}


Spamlpm:
{
Gui, Submit, NoHide
IfWinExist %wintit%
	BreakLoop = 0
		Loop
		{
			if (BreakLoop = 1)
			{
				BreakLoop = 0
				break
			}

			Sleep 1000 / CPS
				ControlClick, , %wintit%, ,Left, , NA
		}
	Return
}

Spamppm:
{
Gui, Submit, NoHide
IfWinExist %wintit%
	BreakLoop = 0
		Loop
		{
			if (BreakLoop = 1)
			{
				BreakLoop = 0
				break
			}

			Sleep 1000 / CPS
				ControlClick, , %wintit%, ,Right, , NA
		}
	Return
}
;==================================================================================================
Stop:
{
BreakLoop = 1
return
}
;===================================================================================================
Name:
{
Gui, Submit, NoHide
wintit := Nazwa
return
}