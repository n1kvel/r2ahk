#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#Include classMemory.ahk
#Include offset.ahk
#SingleInstance Force
#Persistent
;#IfWinActive, ahk_class ProjectR2

ScriptManage := {}                           ; создаём объект для управления скриптами
ScriptManage.GetScript := Func("GetScript")  ; создаём несколько методов
ScriptManage.Run := Func("RunScript")    
ScriptManage.Terminate := Func("TerminateScript")
OnExit, OnExit

if (_ClassMemory.__Class != "_ClassMemory")
{
    msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
    ExitApp
}

CoordMode, Mouse, Screen

global SuperJump
global FlySpeedV
global FlySpeedH

Gui Add, Tab2, x0 y0 w307 h366 vTabVar, Settings|Binds|Info|Character

Gui Tab, 1
Gui Add, Text, x5 y25 w100 h15 +Center , Окно
Gui Add, Text, x110 y25 w100 h15 +Center , Сервер
Gui Add, CheckBox, x209 y25 +Right gScriptTop vCheckBox_ScriptTop, AlwaysOnTop
Gui Add, DropDownList, x5 y40 w100 gR2mem vGetWinR2, %WinR2List%
Gui Add, DropDownList, x110 y40 w100 gOffset vOffset, %ListServer%
Gui Add, Button, x213 y39 w85 gUpdateWinR2List, Обновить
Gui Add, GroupBox, x5 y60 w293 h145
Gui Add, CheckBox, x20 y75 gClicker vCheckBox_Clicker, Кликер
Gui Add, CheckBox, x80 y75 gPosCursor vCheckBox_PosCursor, Координаты мыши
Gui Add, CheckBox, x20 y95 gGmark vCheckBox_Gmark, Отображение значков
Gui Add, CheckBox, x20 y115 gFreeCam vCheckBox_FreeCam, Свободная камера
Gui Add, CheckBox, x20 y155 gNoClip vCheckBox_NoClip, NoClip
Gui Add, CheckBox, x80 y155 gFreeze vCheckBox_Freeze, Gravity 0
Gui Add, CheckBox, x150 y155 vCheckBox_SuperJump, Super Jump
Gui Add, CheckBox, x20 y175 gInvisible vCheckBox_Invisible, Анти-инвиз
Gui Add, CheckBox, x115 y175 gAgro vCheckBox_Agro, Подсвечивать агрящихся
Gui Add, GroupBox, x5 y205 w293 h100 +Center, Информация
Gui Add, DropDownList, x15 y226 w200 vListOFobjects, Все объекты|Персонажи в радиусе обзора|Невидимые в радиусе обзора|НПС и монстры в радиусе обзора|Дроп
Gui Add, Button, x226 y225 w50 gListRun, Запустить
Gui Add, CheckBox, x15 y255 vList_AlwaysOnTop, Поверх всех окон
Gui Add, CheckBox, x140 y255 gInfoCursor vCheckBox_InfoCursor, При наведении на цель
Gui Add, Slider, x120 y275 w170 h20 TickInterval10 ToolTipTop Range1-100 vList_Vis, 100
Gui Add, Text, x15 y270 w100 h23 +0x200, Прозрачность окна
Gui Add, GroupBox, x5 y305 w293 h50 +Center, Сохранить/Загрузить настройки
Gui Add, Button, x70 y325 gSave, Сохранить
Gui Add, Button, x170 y325 gLoad, Загрузить


Gui Tab, 2
Gui Add, GroupBox, x5 y25 w293 h50 +Center, Basic
Gui Add, Text, x20 y45 h20 0x200 , Хилл
Gui Add, Text, x115 y45 h20 0x200 , ТП
Gui Add, Text, x200 y45 h20 0x200 , Крит
Gui Add, Hotkey, x50 y45 w50 h20 vHotkey_Bot_HP
Gui Add, Hotkey, x135 y45 w50 h20 vHotkey_Bot_TP
Gui Add, Hotkey, x230 y45 w50 h20 vHotkey_Bot_Crit
Gui Add, GroupBox, x5 y75 w293 h80 +Center, Clicker
Gui Add, CheckBox, x30 y95 w65 h20 gClicker vCheckBox_Clicker_1, Бинд №1
Gui Add, CheckBox, x170 y95 w65 h20 gClicker vCheckBox_Clicker_2, Бинд №2
Gui Add, CheckBox, x30 y125 w65 h20 gClicker vCheckBox_Clicker_3, Бинд №3
Gui Add, CheckBox, x170 y125 w65 h20 gClicker vCheckBox_Clicker_4, Бинд №4
Gui Add, Hotkey, x95 y95 w50 h20 vHotkey_Clicker_1
Gui Add, Hotkey, x235 y95 w50 h20 vHotkey_Clicker_2
Gui Add, Hotkey, x95 y125 w50 h20 vHotkey_Clicker_3
Gui Add, Hotkey, x235 y125 w50 h20 vHotkey_Clicker_4
Gui Add, GroupBox, x5 y155 w293 h75 +Center, NoClip
Gui Add, Hotkey, x85 y175 w45 h20 vHotkey_NoClip_1
Gui Add, Hotkey, x35 y200 w45 h20 vHotkey_NoClip_2
Gui Add, Hotkey, x85 y200 w45 h20 vHotkey_NoClip_3
Gui Add, Hotkey, x135 y200 w45 h20 vHotkey_NoClip_4
Gui Add, Hotkey, x220 y175 w45 h20 vHotkey_NoClip_5
Gui Add, Hotkey, x220 y200 w45 h20 vHotkey_NoClip_6
Gui Add, GroupBox, x5 y230 w293 h100 +Center, Stats Change
Gui Add, CheckBox, x50 y250 h20 gStats vCheckBox_StatChange_1, Дальность атаки
Gui Add, CheckBox, x50 y275 h20 gStats vCheckBox_StatChange_2, Скорость передвижения
Gui Add, CheckBox, x50 y300 h20 gStats vCheckBox_StatChange_3, Скорость атаки
Gui Add, Hotkey, x163 y250 w45 h20 vHotkey_StatChange_1
Gui Add, Hotkey, x198 y275 w45 h20 vHotkey_StatChange_2
Gui Add, Hotkey, x154 y300 w45 h20 vHotkey_StatChange_3

Gui Tab, 3
Gui Add, GroupBox, x5 y25 w293 h75 +Center, Сharacter information
Gui Font, Bold, Arial
Gui Add, Progress, x20 y47 w132 h20 BackgroundBlack cRed vCurrentHP Range0-100
Gui Add, Progress, x20 y67 w132 h20 BackgroundBlack cBlue vCurrentMP Range0-100
Gui Add, Text, x42 y50 w90 h20 +Center BackgroundTrans cWhite vCHP
Gui Add, Text, x42 y70 w90 h20 +Center BackgroundTrans cWhite vCMP
Gui Font
Gui Add, Text, x170 y45 w125 h15 0x200 vName, Ник:
Gui Add, Text, x170 y60 w125 h15 0x200 vWeight, Вес:
Gui Add, Text, x170 y75 w125 h15 0x200 vCell, Ячеек:
Gui Add, GroupBox, x5 y100 w293 h50 +Center, Опыт
Gui Add, Text, x15 y115 w270 h15 vExp1, Опыт на текущем уровне -
Gui Add, Text, x61 y130 w224 h15 vExp2, Получено опыта -
Gui Add, GroupBox, x5 y150 w293 h150 +Center, Скрытые статы
Gui Add, Text, x13 y165 w140 h15 vDef1a, Уклон от ближ. атак -
Gui Add, Text, x16 y180 w137 h15 vDef1b, Уклон от дист. атак -
Gui Add, Text, x20 y195 w133 h15 vDef1c, Уклон от маг. атак -
Gui Add, Text, x153 y165 w143 h15 vDef2a, Поглот от ближ. атак -
Gui Add, Text, x156 y180 w140 h15 vDef2b, Поглот от дист. атак -
Gui Add, Text, x160 y195 w136 h15 vDef2c, Поглот от маг. атак -
Gui Add, Text, x15 y215 w138 h15 vAtt1a, Уровень ближ. атак -
Gui Add, Text, x19 y230 w134 h15 vAtt1b, Уровень дист. атак -
Gui Add, Text, x22 y245 w131 h15 vAtt1c, Уровень маг. атак -
Gui Add, Text, x156 y215 w140 h15 vAtt2a, Точность ближ. атак -
Gui Add, Text, x159 y230 w137 h15 vAtt2b, Точность дист. атак -
Gui Add, Text, x163 y245 w133 h15 vAtt2c, Точность маг. атак -
Gui Add, Text, x29 y265 w124 h15 vAttR, Дальность атаки -
Gui Add, Text, x160 y265 w136 h15 vSp1, Скорость перемещ. -
Gui Add, Text, x37 y280 w116 h15 vSp2, Скорость атаки -

Gui Add, GroupBox, x5 y300 w293 h55 +Center, Количество объектов
Gui Add, Text, x30 y315 w95 h15 vTPlayer, Персонажи -
Gui Add, Text, x32 y330 w93 h15 vTInv, Инвизеров -
Gui Add, Text, x135 y315 w80 h15 vTMob, Мобы -
Gui Add, Text, x135 y330 w80 h15 vTNpc, НПС -
Gui Add, Text, x220 y315 w70 h15 vTDrop, Дроп -

Gui Tab, 4
Gui Add, GroupBox, x5 y25 w190 h80 +Center, FOV Changer
Gui Add, Text, x15 y45 w61 h20 +0x200, Персонаж -
Gui Add, Text, x25 y70 w61 h20 +0x200, FreeCam -
Gui Add, Edit, x75 y45 w40 h20 vFOVPlayer Limit3
Gui, Add, UpDown, Range2-179, 70
Gui Add, Edit, x75 y70 w40 h20 vFOVFreeCam Limit3
Gui, Add, UpDown, Range2-179, 60
Gui Add, Button, x120 y44 w50 gFOVChangeC, Изменить
Gui Add, Button, x120 y69 w50 gFOVChangeF, Изменить

Gui Add, GroupBox, x200 y25 w98 h40 +Center, Model Size
Gui Add, Slider, x205 y40 w90 h20 gModelSize TickInterval10 ToolTipTop Range0-30 vModelSize, 10

Gui Add, GroupBox, x200 y65 w98 h40 +Center, Camera Range
Gui Add, Slider, x205 y80 w90 h20 gCameraRange TickInterval1000 ToolTipTop Range0-3000 vCameraRange, 1000

Gui Add, GroupBox, x5 y105 w293 h90 +Center, XYZ Changer
Gui Add, Text, x10 y120 w15 h20 +0x200, X -
Gui Add, Text, x108 y120 w15 h20 +0x200, Y -
Gui Add, Text, x205 y120 w15 h20 +0x200, Z -
Gui Add, Text, x10 y175 w170 vXYZChangeRange, Дальность до точки:
Gui Add, Edit, x28 y120 w70 h20 +Number Limit7 vXChange,
Gui Add, Edit, x126 y120 w70 h20 +Number Limit7 vYChange,
Gui Add, Edit, x223 y120 w70 h20 +Number Limit7 vZChange,
Gui Add, DropDownList, x10 y146 w283 gXYZList vListTeleportL,
Gui Add, Button, x180 y168 gXYZChangeC, Character
Gui Add, Button, x240 y168 gXYZChangeF, FreeCam
Gui Add, GroupBox, x5 y195 w293 h80 +Center, Координаты
Gui Add, Text, x40 y210, Персонаж
Gui Add, Text, x20 y225 w130 vX0, X -
Gui Add, Text, x20 y240 w130 vY0, Y -
Gui Add, Text, x20 y255 w130 vZ0, Z -
Gui Add, Text, x180 y210, FreeCam
Gui Add, Text, x160 y225 w130 vX1, X -
Gui Add, Text, x160 y240 w130 vY1, Y -
Gui Add, Text, x160 y255 w130 vZ1, Z -
Gui Add, GroupBox, x5 y275 w293 h85 +Center, Статы
Gui Add, Text, x20 y288 w60 +Center, Дальность
Gui Add, Text, x115 y288, Скорость бега
Gui Add, Text, x205 y288, Скорость атаки
Gui Add, Edit, x20 y305 w60 +Number Limit4 vRangeChange
Gui Add, Edit, x120 y305 w60 +Number Limit4 vSpeedChange
Gui Add, Edit, x215 y305 w60 +Number Limit4 vAttackSpeedChange
Gui Add, Button, x19 y328 gStatChange_1, Изменить
Gui Add, Button, x119 y328 gStatChange_2, Изменить
Gui Add, Button, x214 y328 gStatChange_3, Изменить

Window()
LoadSettings()
ListTeleport()
SetTimer, UpdateGui, 250
Gui -MinimizeBox
Gui Show, w305 h365, R2 Help

loop
{
	GuiControlGet, CheckBox_SuperJump
	GuiControlGet, CheckBox_Freeze
	GuiControlGet, CheckBox_NoClip
	GuiControlGet, CheckBox_PosCursor
	GuiControlGet, CheckBox_InfoCursor
	if (CheckBox_Freeze && CheckBox_SuperJump){
		GuiControl,, CheckBox_SuperJump, 0
	}
	if (GetKeyState("Space", "P") && CheckBox_SuperJump){
		SuperJump()
	}
	if (CheckBox_NoClip){
		NoClip()
	}
	if (CheckBox_PosCursor){
		CoordMode, ToolTip, Screen
		MouseGetPos, CursorPosX, CursorPosY
		ToolTip, % "Mouse Position: " CursorPosX ", " CursorPosY,CursorPosX+30,CursorPosY+30
	}
	if (CheckBox_InfoCursor){
		CoordMode, ToolTip, Window
		InfoCursor()
	}
	sleep 1
}
return

;------------------------------------------------------------------------------------------------
	
UpdateGui:
{
	GuiControlGet, Current_Tab,,TabVar
	if (Current_Tab = "Info"){
		hp := r2.read(b_offset_1, "UInt", 0x60, o_chp)
		mp := r2.read(b_offset_1, "UInt", 0x60, o_cmp)
		maxhp := r2.read(b_offset_1, "UInt", 0x60, o_mhp)
		maxmp := r2.read(b_offset_1, "UInt", 0x60, o_mmp) 
		name := r2.readstring(b_offset_1, 0,"CP1251", 0x60, o_nickname)
		currentweight := r2.read(b_cweight, "UInt")
		maxweight := r2.read(b_mweight, "UInt")
		cell := r2.read(b_ccell, "UInt") 
		exp := r2.read(b_offset_1, "UInt", 0x60, o_exp)
		d1 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_ar1)
		d2 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_ar4)
		d3 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_ar3)
		d4 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_ar6)
		d5 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_ar2)
		d6 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_ar5)
		a1 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_at1)
		a2 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_at2)
		a3 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_at3)
		a4 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_at4) 
		a5 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_at5)
		a6 := r2.read(b_offset_1, "UShort", 0x60, o_pstat_at6)
		hpbar := HP/MaxHP*100
		mpbar := MP/MaxMP*100
		TNpc := 0
		TMob := 0
		TPlayer := 0
		TInv := 0
		o_offset := 0x0
		TDrop := r2.read(b_offset_1, "UInt", 0x34)
		entity := r2.read(b_offset_1, "UInt", 0xc, 0x0, 0x0)
		SetFormat, Float, 0
		s1 := r2.read(b_offset_1, "UFloat", 0x60, o_pspeed) 
		ar := r2.read(b_offset_1, "UFloat", 0x60, o_prange) 
		s2 := r2.read(b_offset_1, "UInt", 0x60, o_paspeed)
		if (exp = 0){
			expch := 0, exp2 := 0
		}
		if (expch < exp){
			exp2 := Exp - expch, expch := Exp
		}
		loop, 100000
		{
			identifier := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier)
			checkinvis := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_typeinvis)
			checkmob := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_checknpc_1)
			checknpc := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier, o_checknpc_2)
			if (r2.read(b_offset_1, "UInt", 0xc, o_offset, 0x0) != entity){
				break
			}
			if (identifier != 0 && checknpc = 1){
				TPlayer++
				if (checkinvis = 16777217 OR checkinvis = 16842752){
					TInv++
				}
			}
			if (identifier != 0 && checknpc = 2){
				if (checkmob = 2){
					TNpc++
				}
				if (checkmob = 1){
					TMob++
				}
			}		
			SetFormat Integer, H
			o_offset += 4
			SetFormat Integer, D
		}
		GuiControl,, CurrentHP, %hpbar%
		GuiControl,, CurrentMP, %mpbar%
		GuiControl,, CHP, %HP% / %MaxHP%
		GuiControl,, CMP, %MP% / %MaxMP%
		GuiControl,, Name, Ник: %name%
		GuiControl,, Weight, Вес: %currentweight% / %maxweight%
		GuiControl,, Cell, Ячеек: %cell% / %mcell%
		GuiControl,, Exp1, Опыт на текущем уровне - %exp%
		GuiControl,, Exp2, Получено опыта - %exp2%
		GuiControl,, Def1a, Уклон от ближ. атак - %d1%
		GuiControl,, Def1b, Уклон от дист. атак - %d3%
		GuiControl,, Def1c, Уклон от маг. атак - %d5%
		GuiControl,, Def2a, Поглот от ближ. атак - %d2%
		GuiControl,, Def2b, Поглот от дист. атак - %d4%
		GuiControl,, Def2c, Поглот от маг. атак - %d6%
		GuiControl,, Att1a, Уровень ближ. атак - %a1%
		GuiControl,, Att1b, Уровень дист. атак - %a3%
		GuiControl,, Att1c, Уровень маг. атак - %a5%
		GuiControl,, Att2a, Точность ближ. атак - %a2%
		GuiControl,, Att2b, Точность дист. атак - %a4%
		GuiControl,, Att2c, Точность маг. атак - %a6%
		GuiControl,, Sp1, Скорость перемещ. - %s1%
		GuiControl,, Sp2, Скорость атаки - %s2% (мс)
		GuiControl,, AttR, Дальность атаки - %ar%
		GuiControl,, TPlayer, Персонажи - %TPlayer%
		GuiControl,, TInv, Инвизеров - %TInv%
		GuiControl,, TNpc, НПС - %TNpc%
		GuiControl,, TMob, Мобы - %TMob%
		GuiControl,, TDrop, Дроп - %TDrop%
		DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
	}
	if (Current_Tab = "Character"){
		GuiControlGet, XChange
		GuiControlGet, ZChange
		GuiControlGet, RangeChange
		GuiControlGet, SpeedChange
		GuiControlGet, AttackSpeedChange
		SetFormat, Float, 0.5
		x := r2.read(b_offset_1, "UFloat", 0x60, o_identifier, o_posx)
		y := r2.read(b_offset_1, "UFloat", 0x60, o_identifier, o_posy)
		z := r2.read(b_offset_1, "UFloat", 0x60, o_identifier, o_posz)
		xcam := r2.read(b_offset_3, "UFloat", o_fcamposx)
		ycam := r2.read(b_offset_3, "UFloat", o_fcamposy)
		zcam := r2.read(b_offset_3, "UFloat", o_fcamposz)
		SetFormat, Float, 0
		XZChangeRange := Sqrt((x-XChange)**2+(z-ZChange)**2)
		GuiControl,, XYZChangeRange, Дальность до точки - %XZChangeRange%
		GuiControl,, X0, X - %x%
		GuiControl,, Y0, Y - %y%
		GuiControl,, Z0, Z - %z%
		GuiControl,, X1, X - %xcam%
		GuiControl,, Y1, Y - %ycam%
		GuiControl,, Z1, Z - %zcam%
		if (!RangeChange){
			ar := r2.read(b_offset_1, "UFloat", 0x60, o_prange) 
			GuiControl,, RangeChange, %ar%
		}
		if (!SpeedChange){
			s1 := r2.read(b_offset_1, "UFloat", 0x60, o_pspeed) 
			GuiControl,, SpeedChange, %s1%
		}
		if (!AttackSpeedChange){
			s2 := r2.read(b_offset_1, "UInt", 0x60, o_paspeed)
			GuiControl,, AttackSpeedChange, %s2%
		}
	}
}
return

R2mem:
{
	GuiControlGet, GetWinR2
	global r2 := new _ClassMemory("ahk_id "GetWinR2, "", hProcessCopy)
	IniWrite, %GetWinR2%, config.ini, Settings, GetWinR2
}
return

UpdateWinR2List:
{
	Window()
}
return

Window()
{
	GuiControl,, GetWinR2, |
	WinGet, L, List, ahk_class ProjectR2
	Loop, %L%
	{
		WinR2List .= L%A_Index% "|"
	}
	GuiControl,, GetWinR2, %WinR2List%
}

Offset:
{
	GuiControlGet, Offset
	IniWrite, %Offset%, config.ini, Settings, Offset
	offset_selection(Offset)
}
return

Load:
{
	LoadSettings()
}
return

LoadSettings()
{
	IniRead, ListServer, config.ini, SettingsStatic, ListServer
	IniRead, SuperJump, config.ini, SettingsStatic, SuperJump
	IniRead, List_Vis, config.ini, Settings, List_Vis
	IniRead, Hotkey_Bot_HP, config.ini, Binds, Hotkey_Bot_HP
	IniRead, Hotkey_Bot_TP, config.ini, Binds, Hotkey_Bot_TP
	IniRead, Hotkey_Bot_Crit, config.ini, Binds, Hotkey_Bot_Crit
	IniRead, CheckBox_Clicker_1, config.ini, Settings, CheckBox_Clicker_1
	IniRead, CheckBox_Clicker_2, config.ini, Settings, CheckBox_Clicker_2
	IniRead, CheckBox_Clicker_3, config.ini, Settings, CheckBox_Clicker_3
	IniRead, CheckBox_Clicker_4, config.ini, Settings, CheckBox_Clicker_4
	IniRead, Hotkey_Clicker_1, config.ini, Binds, Hotkey_Clicker_1
	IniRead, Hotkey_Clicker_2, config.ini, Binds, Hotkey_Clicker_2
	IniRead, Hotkey_Clicker_3, config.ini, Binds, Hotkey_Clicker_3
	IniRead, Hotkey_Clicker_4, config.ini, Binds, Hotkey_Clicker_4
	IniRead, Hotkey_NoClip_1, config.ini, Binds, Hotkey_NoClip_1
	IniRead, Hotkey_NoClip_2, config.ini, Binds, Hotkey_NoClip_2
	IniRead, Hotkey_NoClip_3, config.ini, Binds, Hotkey_NoClip_3
	IniRead, Hotkey_NoClip_4, config.ini, Binds, Hotkey_NoClip_4
	IniRead, Hotkey_NoClip_5, config.ini, Binds, Hotkey_NoClip_5
	IniRead, Hotkey_NoClip_6, config.ini, Binds, Hotkey_NoClip_6
	IniRead, CheckBox_StatChange_1, config.ini, Settings, CheckBox_StatChange_1
	IniRead, CheckBox_StatChange_2, config.ini, Settings, CheckBox_StatChange_2
	IniRead, CheckBox_StatChange_3, config.ini, Settings, CheckBox_StatChange_3
	IniRead, Hotkey_StatChange_1, config.ini, Binds, Hotkey_StatChange_1
	IniRead, Hotkey_StatChange_2, config.ini, Binds, Hotkey_StatChange_2
	IniRead, Hotkey_StatChange_3, config.ini, Binds, Hotkey_StatChange_3
	IniRead, RangeChange, config.ini, SettingsStatic, RangeChange
	IniRead, SpeedChange, config.ini, SettingsStatic, SpeedChange
	IniRead, AttackSpeedChange, config.ini, SettingsStatic, AttackSpeedChange
	GuiControl,, Offset, %ListServer%
	GuiControl,, List_Vis, %List_Vis%
	GuiControl,, Hotkey_Bot_HP, %Hotkey_Bot_HP%
	GuiControl,, Hotkey_Bot_TP, %Hotkey_Bot_TP%
	GuiControl,, Hotkey_Bot_Crit, %Hotkey_Bot_Crit%
	GuiControl,, CheckBox_Clicker_1, %CheckBox_Clicker_1%
	GuiControl,, CheckBox_Clicker_2, %CheckBox_Clicker_2%
	GuiControl,, CheckBox_Clicker_3, %CheckBox_Clicker_3%
	GuiControl,, CheckBox_Clicker_4, %CheckBox_Clicker_4%	
	GuiControl,, Hotkey_Clicker_1, %Hotkey_Clicker_1%
	GuiControl,, Hotkey_Clicker_2, %Hotkey_Clicker_2%
	GuiControl,, Hotkey_Clicker_3, %Hotkey_Clicker_3%
	GuiControl,, Hotkey_Clicker_4, %Hotkey_Clicker_4%
	GuiControl,, Hotkey_NoClip_1, %Hotkey_NoClip_1%
	GuiControl,, Hotkey_NoClip_2, %Hotkey_NoClip_2%
	GuiControl,, Hotkey_NoClip_3, %Hotkey_NoClip_3%
	GuiControl,, Hotkey_NoClip_4, %Hotkey_NoClip_4%
	GuiControl,, Hotkey_NoClip_5, %Hotkey_NoClip_5%
	GuiControl,, Hotkey_NoClip_6, %Hotkey_NoClip_6%
	GuiControl,, CheckBox_StatChange_1, %CheckBox_StatChange_1%
	GuiControl,, CheckBox_StatChange_2, %CheckBox_StatChange_2%
	GuiControl,, CheckBox_StatChange_3, %CheckBox_StatChange_3%	
	GuiControl,, Hotkey_StatChange_1, %Hotkey_StatChange_1%
	GuiControl,, Hotkey_StatChange_2, %Hotkey_StatChange_2%
	GuiControl,, Hotkey_StatChange_3, %Hotkey_StatChange_3%
	GuiControl,, RangeChange, %RangeChange%
	GuiControl,, SpeedChange, %SpeedChange%
	GuiControl,, AttackSpeedChange, %AttackSpeedChange%
}

Save:
{
	GuiControlGet, List_Vis
	GuiControlGet, Hotkey_Clicker_1
	GuiControlGet, Hotkey_Clicker_2
	GuiControlGet, Hotkey_Clicker_3
	GuiControlGet, Hotkey_Clicker_4
	GuiControlGet, Hotkey_NoClip_1
	GuiControlGet, Hotkey_NoClip_2
	GuiControlGet, Hotkey_NoClip_3
	GuiControlGet, Hotkey_NoClip_4
	GuiControlGet, Hotkey_NoClip_5
	GuiControlGet, Hotkey_NoClip_6
	GuiControlGet, Hotkey_StatChange_1
	GuiControlGet, Hotkey_StatChange_2
	GuiControlGet, Hotkey_StatChange_3
	GuiControlGet, RangeChange
	GuiControlGet, SpeedChange
	GuiControlGet, AttackSpeedChange
	GuiControlGet, Hotkey_Bot_HP
	GuiControlGet, Hotkey_Bot_TP
	GuiControlGet, Hotkey_Bot_Crit
	GuiControlGet, CheckBox_Clicker_1
	GuiControlGet, CheckBox_Clicker_2
	GuiControlGet, CheckBox_Clicker_3
	GuiControlGet, CheckBox_Clicker_4
	GuiControlGet, CheckBox_StatChange_1
	GuiControlGet, CheckBox_StatChange_2
	GuiControlGet, CheckBox_StatChange_3
	IniWrite, %Hotkey_Clicker_1%, config.ini, Binds, Hotkey_Clicker_1
	IniWrite, %Hotkey_Clicker_2%, config.ini, Binds, Hotkey_Clicker_2
	IniWrite, %Hotkey_Clicker_3%, config.ini, Binds, Hotkey_Clicker_3
	IniWrite, %Hotkey_Clicker_4%, config.ini, Binds, Hotkey_Clicker_4
	IniWrite, %Hotkey_NoClip_1%, config.ini, Binds, Hotkey_NoClip_1
	IniWrite, %Hotkey_NoClip_2%, config.ini, Binds, Hotkey_NoClip_2
	IniWrite, %Hotkey_NoClip_3%, config.ini, Binds, Hotkey_NoClip_3
	IniWrite, %Hotkey_NoClip_4%, config.ini, Binds, Hotkey_NoClip_4
	IniWrite, %Hotkey_NoClip_5%, config.ini, Binds, Hotkey_NoClip_5
	IniWrite, %Hotkey_NoClip_6%, config.ini, Binds, Hotkey_NoClip_6
	IniWrite, %Hotkey_StatChange_1%, config.ini, Binds, Hotkey_StatChange_1
	IniWrite, %Hotkey_StatChange_2%, config.ini, Binds, Hotkey_StatChange_2
	IniWrite, %Hotkey_StatChange_3%, config.ini, Binds, Hotkey_StatChange_3
	IniWrite, %Hotkey_Bot_HP%, config.ini, Binds, Hotkey_Bot_HP
	IniWrite, %Hotkey_Bot_TP%, config.ini, Binds, Hotkey_Bot_TP
	IniWrite, %Hotkey_Bot_Crit%, config.ini, Binds, Hotkey_Bot_Crit
	IniWrite, %List_Vis%, config.ini, Settings, List_Vis
	IniWrite, %CheckBox_Clicker_1%, config.ini, Settings, CheckBox_Clicker_1
	IniWrite, %CheckBox_Clicker_2%, config.ini, Settings, CheckBox_Clicker_2
	IniWrite, %CheckBox_Clicker_3%, config.ini, Settings, CheckBox_Clicker_3
	IniWrite, %CheckBox_Clicker_4%, config.ini, Settings, CheckBox_Clicker_4
	IniWrite, %CheckBox_StatChange_1%, config.ini, Settings, CheckBox_StatChange_1
	IniWrite, %CheckBox_StatChange_2%, config.ini, Settings, CheckBox_StatChange_2
	IniWrite, %CheckBox_StatChange_3%, config.ini, Settings, CheckBox_StatChange_3
	IniWrite, %RangeChange%, config.ini, SettingsStatic, RangeChange
	IniWrite, %SpeedChange%, config.ini, SettingsStatic, SpeedChange
	IniWrite, %AttackSpeedChange%, config.ini, SettingsStatic, AttackSpeedChange
}
return
	
ListTeleport()
{
	Loop, read, teleport.txt
	{
		Loop, parse, A_LoopReadLine, `n
		{
			tpstr := StrSplit(A_LoopField, A_Tab)
			tpname := tpstr[1]
			GuiControl,, ListTeleportL, %tpname%
		}
	}
}

XYZList:
{
	GuiControlGet, ListTeleportL
	if (ListTeleportL = "Координаты персонажа")
	{
		SetFormat, Float, 0
		x := r2.read(b_offset_1, "UFloat", 0x60, o_identifier, o_posx)
		y := r2.read(b_offset_1, "UFloat", 0x60, o_identifier, o_posy)
		z := r2.read(b_offset_1, "UFloat", 0x60, o_identifier, o_posz)
		GuiControl,, XChange, % x
		GuiControl,, YChange, % y
		GuiControl,, ZChange, % z
		return
	}
	if (ListTeleportL = "Координаты свободной камеры")
	{
		SetFormat, Float, 0
		xcam := r2.read(b_offset_3, "UFloat", o_fcamposx)
		ycam := r2.read(b_offset_3, "UFloat", o_fcamposy)
		zcam := r2.read(b_offset_3, "UFloat", o_fcamposz)
		GuiControl,, XChange, % xcam
		GuiControl,, YChange, % ycam
		GuiControl,, ZChange, % zcam
		return
	}
	Loop, read, teleport.txt
	{
		Loop, parse, A_LoopReadLine, `n
		{
			{
				tpstr := StrSplit(A_LoopField, A_Tab)
				if (ListTeleportL = tpstr[1] && tpstr[5] != 1 )
				{
					GuiControl,, XChange, % tpstr[2]
					GuiControl,, YChange, % tpstr[3]
					GuiControl,, ZChange, % tpstr[4]
					break 2
				}
				if (ListTeleportL = tpstr[1] && tpstr[5] = 1)
				{
					GuiControl,, XChange,
					GuiControl,, YChange,
					GuiControl,, ZChange,
					break 2
				}
			}
		}
	}
}
return

XYZChangeC:
{
	GuiControlGet, XChange
	GuiControlGet, YChange
	GuiControlGet, ZChange
	r2.write(b_offset_1, XChange, "UFloat", 0x60, o_identifier, o_posx)
	r2.write(b_offset_1, XChange, "UFloat", 0x60, o_posxs)
	r2.write(b_offset_1, YChange, "UFloat", 0x60, o_identifier, o_posy)
	r2.write(b_offset_1, YChange, "UFloat", 0x60, o_posys)
	r2.write(b_offset_1, ZChange, "UFloat", 0x60, o_identifier, o_posz)
	r2.write(b_offset_1, ZChange, "UFloat", 0x60, o_poszs)
}
return

XYZChangeF:
{
	GuiControlGet, XChange
	GuiControlGet, YChange
	GuiControlGet, ZChange
	r2.write(b_offset_3, XChange, "UFloat", o_fcamposx)
	r2.write(b_offset_3, YChange, "UFloat", o_fcamposy)
	r2.write(b_offset_3, ZChange, "UFloat", o_fcamposz)
}
return

SuperJump()
{
	Jump := r2.read(b_offset_1, "UFloat", 0x60, o_identifier, o_gravity)
	Jump > -10 ? r2.write(b_offset_1, SuperJump, "UFloat", 0x60, o_identifier, o_gravity) : FALSE
}

ModelSize:
{
	GuiControlGet, ModelSize
	ModelSize := ModelSize/10
	r2.write(b_offset_1, 1*ModelSize, "UFloat", 0x60, o_identifier, o_modelsize_1)
	r2.write(b_offset_1, 1/ModelSize, "UFloat", 0x60, o_identifier, o_modelsize_2)
}
return

CameraRange:
{
	GuiControlGet, CameraRange
	if (CameraRange < 200){
		DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", b_camrange_1, "UInt", 4, "UInt", 0x04, "UInt *", 0)
		DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", b_camrange_2, "UInt", 4, "UInt", 0x04, "UInt *", 0)
		r2.write(b_camrange_1, CameraRange, "UFloat")
		r2.write(b_camrange_2, 1000, "UFloat")
		DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", b_camrange_1, "UInt", 4, "UInt", 0x02, "UInt *", 0)	
		DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", b_camrange_2, "UInt", 4, "UInt", 0x02, "UInt *", 0)
	} else {
		DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", b_camrange_1, "UInt", 4, "UInt", 0x04, "UInt *", 0)
		DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", b_camrange_2, "UInt", 4, "UInt", 0x04, "UInt *", 0)
		r2.write(b_camrange_1, 200, "UFloat")
		r2.write(b_camrange_2, CameraRange, "UFloat")
		DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", b_camrange_1, "UInt", 4, "UInt", 0x02, "UInt *", 0)	
		DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", b_camrange_2, "UInt", 4, "UInt", 0x02, "UInt *", 0)
	}
}
return

Clicker:
{
	GuiControlGet, CheckBox_Clicker
	GuiControlGet, CheckBox_Clicker_1
	GuiControlGet, CheckBox_Clicker_2
	GuiControlGet, CheckBox_Clicker_3
	GuiControlGet, CheckBox_Clicker_4
	GuiControlGet, Hotkey_Clicker_1
	GuiControlGet, Hotkey_Clicker_2
	GuiControlGet, Hotkey_Clicker_3
	GuiControlGet, Hotkey_Clicker_4
	if (CheckBox_Clicker){
		k := 1
		loop, 4
		{
			Click%k% := []
			IniRead, ClickerCord_%A_Index%, config.ini, SettingsStatic, ClickerCord_%A_Index%
			for Hotkey_Clicker_%k%_index, str1 in StrSplit(ClickerCord_%k%, "."){
				str2 := StrSplit(str1, ";")
				Click%k%[A_Index,1] := str2[1]
				Click%k%[A_Index,2] := str2[2]
			}
			k++
		}
		loop,4
		{
			if (CheckBox_Clicker_%A_Index%)
				Hotkey, % Hotkey_Clicker_%A_Index%, SendClicker_%A_Index%, on
			else
				Hotkey, % Hotkey_Clicker_%A_Index%, SendClicker_%A_Index%, off
		}
	} else {
		loop, 4
		{
		Hotkey, % Hotkey_Clicker_%A_Index%, SendClicker_%A_Index%, off
		}
	}	
}
return

SendClicker_1:
{
	loop, %Hotkey_Clicker_1_index%
	{
		param := Click1[A_Index,1]
		s := Click1[A_Index,2]
		Sleep %s%
		SendInput {%param%}
		
	}
}
return

SendClicker_2:
{
	loop, %Hotkey_Clicker_2_index%
	{
		param := Click2[A_Index,1]
		s := Click2[A_Index,2]
		Sleep %s%
		SendInput {%param%}
	}
}
return

SendClicker_3:
{
	loop, %Hotkey_Clicker_3_index%
	{
		param := Click3[A_Index,1]
		s := Click3[A_Index,2]
		Sleep %s%
		SendInput {%param%}
	}
}
return

SendClicker_4:
{
	loop, %Hotkey_Clicker_4_index%
	{
		param := Click4[A_Index,1]
		s := Click4[A_Index,2]
		Sleep %s%
		SendInput {%param%}
	}
}
return

NoClip:
{
	IniRead, FlySpeedV, config.ini, SettingsStatic, FlySpeedV
	IniRead, FlySpeedH, config.ini, SettingsStatic, FlySpeedH
}
return

NoClip()
{
	GuiControlGet, CheckBox_Freeze
	loop, 6
	{
		GuiControlGet, Hotkey_NoClip_%A_Index%
	}
	FlyVelocityX := 0
	FlyVelocityZ := 0
	angle := r2.read(b_offset_3, "UFloat", o_camangle)
	if (GetKeyState(Hotkey_NoClip_1, "P")) {
			FlyVelocityX := FlyVelocityX - cos(angle), FlyVelocityZ := FlyVelocityZ - sin(angle), KeyCheckV := True
		}
	if (GetKeyState(Hotkey_NoClip_2, "P")) {
			FlyVelocityX := FlyVelocityX + sin(angle), FlyVelocityZ := FlyVelocityZ - cos(angle), KeyCheckV := True
		}
	if (GetKeyState(Hotkey_NoClip_3, "P")) {
			FlyVelocityX := FlyVelocityX + cos(angle), FlyVelocityZ := FlyVelocityZ + sin(angle), KeyCheckV := True
		}
	if (GetKeyState(Hotkey_NoClip_4, "P")) {
			FlyVelocityX := FlyVelocityX - sin(angle), FlyVelocityZ := FlyVelocityZ + cos(angle), KeyCheckV := True
		}
	if (CheckBox_Freeze && GetKeyState(Hotkey_NoClip_5, "P")) {
			FlyVelocityY := 1, KeyCheckH := True
		}
	if (CheckBox_Freeze && GetKeyState(Hotkey_NoClip_6, "P")) {
			FlyVelocityY := -1, KeyCheckH := True
		}
	if (KeyCheckV){
		r2.write(b_offset_1, r2.read(b_offset_1, "UFloat", 0x60, o_identifier, o_posx) + FlyVelocityX * FlySpeedV, "UFloat", 0x60, o_identifier, o_posx)
		r2.write(b_offset_1, r2.read(b_offset_1, "UFloat", 0x60, o_identifier, o_posz) + FlyVelocityZ * FlySpeedV, "UFloat", 0x60, o_identifier, o_posz)
	}
	if (KeyCheckH){
		r2.write(b_offset_1, r2.read(b_offset_1, "UFloat", 0x60, o_identifier, o_posy) + FlyVelocityY * FlySpeedH, "UFloat", 0x60, o_identifier, o_posy)
	}
}

Stats:
{
	loop, 3
	{
		GuiControlGet, CheckBox_StatChange_%A_Index%
		GuiControlGet, Hotkey_StatChange_%A_Index%
		if (CheckBox_StatChange_%A_Index%)
			Hotkey, % Hotkey_StatChange_%A_Index%, StatChange_%A_Index%, on
		else
			Hotkey, % Hotkey_StatChange_%A_Index%, StatChange_%A_Index%, off
	}
}
return

StatChange_1:
{
	GuiControlGet, RangeChange
	r2.write(b_offset_1, RangeChange , "UFloat", 0x60, o_prange)
}
return

StatChange_2:
{
	GuiControlGet, SpeedChange
	r2.write(b_offset_1, SpeedChange, "UFloat", 0x60, o_pspeed)
}
return

StatChange_3:
{
	GuiControlGet, AttackSpeedChange
	r2.write(b_offset_1, AttackSpeedChange, "UInt", 0x60, o_paspeed)
}
return

ScriptTop:
{
	GuiControlGet, CheckBox_ScriptTop
	If (CheckBox_ScriptTop){
		WinSet, AlwaysOnTop, On, A
	} else {
		WinSet, AlwaysOnTop, Off, A
	}
}
return

Gmark:
{
	GuiControlGet, CheckBox_Gmark
	CheckBox_Gmark ? r2.write(b_offset_2, 1, "UInt", o_icon) : r2.write(b_offset_2, 0, "UInt", o_icon)
}
return

FOVChangeC:
{
	GuiControlGet, FOVPlayer
	DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", b_fov, "UInt", 4, "UInt", 0x04, "UInt *", 0)
	r2.write(b_fov, FOVPlayer, "UFloat")
	DllCall("VirtualProtectEx", "UInt", hProcessCopy, "UInt", b_fov, "UInt", 4, "UInt", 0x02, "UInt *", 0)
}
return

FOVChangeF:
{
	GuiControlGet, FOVFreeCam
	r2.write(b_offset_3, FOVFreeCam, "UFloat", o_fcamfov)
}
return

FreeCam:
{
	GuiControlGet, CheckBox_FreeCam
	If (CheckBox_FreeCam){
		r2.write(b_offset_3, r2.read(b_offset_3, "UFloat", o_camposx), "UFloat", o_fcamposx)
		r2.write(b_offset_3, r2.read(b_offset_3, "UFloat", o_camposy), "UFloat", o_fcamposy)
		r2.write(b_offset_3, r2.read(b_offset_3, "UFloat", o_camposz), "UFloat", o_fcamposz)
		r2.write(b_offset_1, 1, "UInt", 0x60, o_move)
		r2.write(b_offset_3, 1, "UInt", o_fcam)
	} else {
		r2.write(b_offset_3, 0, "UInt", o_fcam)
		r2.write(b_offset_1, 0, "UInt", 0x60, o_move)
	}
}
return

InfoCursor:
{
	GuiControlGet, CheckBox_InfoCursor
	if (CheckBox_InfoCursor){
		GuiControl,, CheckBox_PosCursor, 0
	} else {
		ToolTip 
	}
}
return

InfoCursor()
{
	GuiControlGet, Offset
	if WinActive("ahk_class ProjectR2") {
		mouseobject := r2.read(b_offset_2, "Uint", o_mouseobject)
		mousedrop := r2.read(b_offset_2, "Uint", o_mousedrop)
		mouseinventory := r2.read(b_offset_2, "Uint", o_mouseinventory)
		if (mouseobject){
			target := ""
			id_1 := r2.read(b_offset_2, "Uint", o_mouseobject, o_id_1)
			SetFormat Float, 0.6
			range := r2.read(b_offset_2, "UFloat", o_mouseobject, o_identifier, o_posrange)
			if (id_1 = 0){
				id_2 := r2.read(b_offset_2, "Uint", o_mouseobject, o_id_2)
				id_3 := r2.read(b_offset_2, "Uint", o_mouseobject, o_id_3)
				item_1 := r2.read(b_offset_2, "Uint", o_mouseobject, o_weapon)
				item_2 := r2.read(b_offset_2, "Uint", o_mouseobject, o_shield)
				item_3 := r2.read(b_offset_2, "Uint", o_mouseobject, o_armor)
				item_4 := r2.read(b_offset_2, "Uint", o_mouseobject, o_pet)			
				loop, 4{
					id_m := id_%A_Index%
					id_i := item_%A_Index%
					if (id_m){
						IniRead, id, id\%Offset%.ini, ID, %id_m%, %A_Space%
						id_%A_Index% = [%id_m%] %id%
					}
					if (id_i){
						IniRead, id, id\%Offset%.ini, Item, %id_i%, %A_Space%
						item_%A_Index% = [%id_i%] %id%
					}
				}
			}
			o_offset := 0x0
			SetFormat Integer, H
			identifier_target := r2.pointer(b_offset_2, "Uint", o_mouseobject, o_identifier_target)
			identifier_my := r2.pointer(b_offset_1, "Uint", 0x60, o_identifier)
			SetFormat Integer, D
			entity := r2.read(b_offset_1, "UInt", 0xc, 0x0, 0x0)
			if (identifier_target){
				if (identifier_target = identifier_my){
					target := r2.readString(b_offset_1, 0,"CP1251", 0x60, o_nickname)
				} else {
					Loop	
					{
						SetFormat Integer, H
						identifier := r2.pointer(b_offset_1, "UInt", 0xc, o_offset, o_identifier)
						SetFormat Integer, D
						if (identifier = identifier_target) {
							target := r2.readString(b_offset_1, 0,"CP1251", 0xc, o_offset, o_nickname)
							if (!target){
								id := r2.read(b_offset_2, "Uint", 0xc, o_offset, o_id_3)
								IniRead, idini, id\%Offset%.ini, ID, %id%, %A_Space%
								target = [%id%] %idini%
							}
							DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
							break
						}
						SetFormat Integer, H
						o_offset += 4
						SetFormat Integer, D
						if (r2.read(b_offset_1, "UInt", 0xc, o_offset, 0x0) != entity){
							DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
							break
						}
					}
				}
			}
			if (id_1 != 0) {
				ToolTip, % "Дальность: " range "`nТаргерт: " target "`nID Монстра\НПС: " id_1, 10, 240
			} else {
				ToolTip, % "Дальность: " range "`nТаргерт: " target "`nID Модели: " id_2 "`nID Перевоплощения: " id_3 "`nОружие: " item_1 "`nЩит: " item_2 "`nДоспех: " item_3 "`nID Питомец: " item_4, 10, 240
				sleep 200
			}
			return
		}
		if (mousedrop){
			SetFormat Float, 0.6
			range := r2.read(b_offset_2, "UFloat", o_mousedrop, 0x0, o_posrange)
			id_drop := r2.read(b_offset_2, "UInt", o_mousedrop, o_drop_id)
			IniRead, dropidini, id\%Offset%.ini, Item, %id_drop%, %A_Space%
			id_drop = [%id_drop%] %dropidini%
			ToolTip, % "Дальность: " range "`nID: " id_drop, 10, 240
			return
		}
		if (mouseinventory){
			id_inventory := r2.read(b_offset_2, "UInt", o_mouseinventory, o_inventory_id)
			ToolTip, % "ID: " id_inventory, 10, 240
			return
		}
		if (!mouseobject && !mousedrop && !mouseinventory){
			ToolTip
		}
	} else {
		ToolTip
	}
}

PosCursor:
{
	GuiControlGet, CheckBox_PosCursor
	if (CheckBox_PosCursor){
		GuiControl,, CheckBox_InfoCursor, 0
	} else {
		ToolTip
	}
}
return

Invisible:
{
	GuiControlGet, CheckBox_Invisible
	IniRead, Invis_type, config.ini, SettingsStatic, Invis_type
	if (Invis_type = 1)	{
		If (CheckBox_Invisible){
			ScriptManage.Run(6)
		} else {
			ScriptManage.Terminate(6)
		}
	}
	if (Invis_type = 2) {
		If (CheckBox_Invisible){
			r2.write(b_offset_1, 1, "UInt", 0x60, o_buff_antiinvis)
		} else {
			r2.write(b_offset_1, 0, "UInt", 0x60, o_buff_antiinvis)
		}
	} 
}
return

Agro:
{
	GuiControlGet, CheckBox_Agro
	If (CheckBox_Agro){
		ScriptManage.Run(7)
	} else {
		ScriptManage.Terminate(7)
	}
}
return

Freeze:
{
	GuiControlGet, CheckBox_Freeze
	CheckBox_Freeze ? ScriptManage.Run(8) : ScriptManage.Terminate(8)
}
return


ListRun:
{
	GuiControlGet, ListOFobjects
	GuiControlGet, List_AlwaysOnTop
	GuiControlGet, List_Vis
	IniWrite, %List_AlwaysOnTop%, config.ini, Settings, List_AlwaysOnTop
	IniWrite, %List_Vis%, config.ini, Settings, List_Vis
	if (ListOFobjects = "Все объекты"){ 
		ScriptManage.Run(1)
	}
	if (ListOFobjects = "Персонажи в радиусе обзора"){ 
		ScriptManage.Run(2)
	}
	if (ListOFobjects = "Невидимые в радиусе обзора"){ 
		ScriptManage.Run(3)
	}
	if (ListOFobjects = "НПС и монстры в радиусе обзора"){ 
		ScriptManage.Run(4)
	}
	if (ListOFobjects = "Дроп"){ 
		ScriptManage.Run(5)
	}
}
return

TerminateScript(this, n)
{
   Critical
   Process, Close, % this[n].PID
   Process, WaitClose, % this[n].PID
   FileDelete, % this[n].Path
}

RunScript(this, n)
{
; ---------------------------------------------------------------------------
; Показываем все объекты

	Text1 =
	(%
		#NoEnv
		#NoTrayIcon
		#Include classMemory.ahk
		#Include offset.ahk
		IniRead, GetWinR2, config.ini, Settings, GetWinR2
		IniRead, Offset, config.ini, Settings, Offset
		IniRead, List_AlwaysOnTop, config.ini, Settings, List_AlwaysOnTop
		IniRead, List_Vis, config.ini, Settings, List_Vis	
		offset_selection(Offset)
		OnExit, OnExit
		
		if (_ClassMemory.__Class != "_ClassMemory")
		{
			msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
			ExitApp
		}
		r2 := new _ClassMemory("ahk_id "GetWinR2, "", hProcessCopy)
		if (r2 = ""){
			Msgbox "ошибка ID процесса не считано"
			ExitApp
		}
		
		Gui +Resize
		Gui Font, s9
		Gui 1:Add, ListView, x-1 y-1 +LV0x4000 +Grid NoSortHdr +LV0x10000 vListView, |Адрес|Идентификатор(Указатель)|ID Монстра\НПС|ID Модели|ID Перевоплощения|HP|Гильдия|Ник|Степень видимости|Тип невидимости|Расстояние до объекта|Координата X|Координата Y|Координата Z|Оружее|Щит|Доспех|Питомец
		LV_ModifyCol(1, 30)
		LV_ModifyCol(2, 47)
		LV_ModifyCol(4, 110)
		LV_ModifyCol(5, 110)
		LV_ModifyCol(6, 110)
		LV_ModifyCol(7, 40)
		LV_ModifyCol(8, 130)
		LV_ModifyCol(9, 110)
		LV_ModifyCol(11, 150)
		LV_ModifyCol(16, 250)
		LV_ModifyCol(17, 250)
		LV_ModifyCol(18, 300)
		LV_ModifyCol(19, 300)
		Gui Show, Restore w1500 h620, Все объекты

		if (List_AlwaysOnTop){
			WinSet, AlwaysOnTop,, Все объекты
		}
		List_Vis := 55+200*(List_Vis/100)
		WinSet, Transparent, %List_Vis%, Все объекты
		
		o_offset := 0x0
		n := 1
		n_old := -1
		clear_old := -1
		entity := r2.read(b_offset_1, "UInt", 0xc, 0x0, 0x0)
		loop 
		{
			if (n > n_old) {
				LV_Insert(n)
				n_old := n
			}
			SetFormat Integer, H
			identifier := r2.pointer(b_offset_1, "Uint", 0xC, o_offset, o_identifier)
			SetFormat Integer, D
			check_invis := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_typeinvis)
			SetFormat, Float, 0.2
			visibility := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_transparent_1)
			SetFormat, Float, 0.6
			hp := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_chp)
			name := r2.readString(b_offset_1, 0,"CP1251", 0xc, o_offset, o_nickname)
			range := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posrange)
			posx := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posx)
			posy := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posy)
			posz := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posz)
			id_1 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_id_1)
			id_2 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_id_2)
			id_3 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_id_3)
			guild := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_guild)
			item_1 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_weapon)
			item_2 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_shield)
			item_3 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_armor)
			item_4 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_pet)
			if (guild){
				IniRead, guildname, id\%Offset%.ini, Guild, %guild%, %A_Space%
				guild = [%guild%] %guildname%
			}
			loop, 4{
				id_m := id_%A_Index%
				id_i := item_%A_Index%
				if (id_m){
					IniRead, id, id\%Offset%.ini, ID, %id_m%, %A_Space%
					id_%A_Index% = [%id_m%] %id%
				}
				if (id_i){
					IniRead, id, id\%Offset%.ini, Item, %id_i%, %A_Space%
					item_%A_Index% = [%id_i%] %id%
				}
			}
			check_npc := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier, o_checknpc_2)				
			if (check_npc = 1 && check_invis = 16777217)
				type_invis := "Плащ невидимости"
			if (check_npc = 1 && check_invis = 16842752)
				type_invis := "Невидимость ассасина"
			LV_Modify(n, "", n, o_offset, identifier, id_1, id_2, id_3, hp, guild, name, visibility, type_invis, range, posx, posy, posz, item_1, item_2, item_3, item_4)
			n+=1
			SetFormat Integer, H
			o_offset += 4
			SetFormat Integer, D
			type_invis := ""
			if (r2.read(b_offset_1, "UInt", 0xc, o_offset, 0x0) != entity){
				clear := n
				while (clear <= clear_old){
					LV_Modify(clear, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
					clear+=1
				}
				o_offset := 0x0
				clear_old := n
				n := 1
				DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
				sleep 1
			}
			
		}
		
		GuiSize:
		if A_EventInfo = 1
			return
		GuiControl, Move, ListView, % "W" . (A_GuiWidth) . " H" . (A_GuiHeight)
		return

		GuiEscape:
		GuiClose:
		OnExit:
		    filedelete, % A_ScriptName
		    ExitApp
	)

; ---------------------------------------------------------------------------
; Показываем персонажей

	Text2 =
	(%
		#NoEnv
		#NoTrayIcon
		#Include classMemory.ahk
		#Include offset.ahk
		IniRead, GetWinR2, config.ini, Settings, GetWinR2
		IniRead, Offset, config.ini, Settings, Offset
		IniRead, List_AlwaysOnTop, config.ini, Settings, List_AlwaysOnTop
		IniRead, List_Vis, config.ini, Settings, List_Vis	
		offset_selection(Offset)
		OnExit, OnExit
		
		if (_ClassMemory.__Class != "_ClassMemory")
		{
			msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
			ExitApp
		}
		r2 := new _ClassMemory("ahk_id "GetWinR2, "", hProcessCopy)
		if (r2 = ""){
			Msgbox "ошибка ID процесса не считано"
			ExitApp
		}
		
		Gui +Resize
		Gui Font, s9, Segoe UI
		Gui 1:Add, ListView, x-1 y-1 +LV0x4000 +Grid NoSortHdr +LV0x10000 vListView, |Адрес|Идентификатор(Указатель)|ID Модели|ID Перевоплощени|Гильдия|Ник|Степень видимости|Тип невидимости|Расстояние до объекта|Координата X|Координата Y|Координата Z|Оружее|Щит|Доспех|Питомец
		LV_ModifyCol(1, 30)
		LV_ModifyCol(2, 47)
		LV_ModifyCol(4, 110)
		LV_ModifyCol(5, 110)
		LV_ModifyCol(6, 130)
		LV_ModifyCol(7, 110)
		LV_ModifyCol(9, 150)
		LV_ModifyCol(14, 200)
		LV_ModifyCol(15, 200)
		LV_ModifyCol(16, 200)
		LV_ModifyCol(17, 200)
		Gui Show, Restore w1360 h620, Персонажи в радиусе обзора 

		WinGet, IDWin, PID, Персонажи в радиусе обзора	
		if (List_AlwaysOnTop){
			WinSet, AlwaysOnTop,, Персонажи в радиусе обзора
		}
		List_Vis := 55+200*(List_Vis/100)
		WinSet, Transparent, %List_Vis%, Персонажи в радиусе обзора
		
		o_offset := 0x0
		n := 1
		n_old := -1
		clear_old := -1
		entity := r2.read(b_offset_1, "UInt", 0xc, 0x0, 0x0)
		loop 
		{
			SetFormat Integer, H
			identifier := r2.pointer(b_offset_1, "Uint", 0xC, o_offset, o_identifier)
			SetFormat Integer, D
			if (n > n_old) {
				LV_Insert(n)
				n_old := n
			}
			if (identifier != 0 && r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier, o_checknpc_2) = 1) {
				nickname := r2.readString(b_offset_1, 0,"CP1251", 0xc, o_offset, o_nickname)
				SetFormat, Float, 0.2
				visibility := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_transparent_1)
				SetFormat, Float, 0.6
				check_invis := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_typeinvis)
				posx := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posx)
				posy := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posy)
				posz := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posz)
				range := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posrange)
				id_2 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_id_2)
				id_3 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_id_3)
				guild := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_guild)				
				item_1 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_weapon)
				item_2 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_shield)
				item_3 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_armor)
				item_4 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_pet)
				if (guild){
					IniRead, guildname, id\%Offset%.ini, Guild, %guild%, %A_Space%
					guild = [%guild%] %guildname%
				}
				loop, 4{
					id_m := id_%A_Index%
					id_i := item_%A_Index%
					if (id_m){
						IniRead, id, id\%Offset%.ini, ID, %id_m%, %A_Space%
						id_%A_Index% = [%id_m%] %id%
					}
					if (id_i){
						IniRead, id, id\%Offset%.ini, Item, %id_i%, %A_Space%
						item_%A_Index% = [%id_i%] %id%
					}
				}
				
				if (check_invis = 16777217)
					type_invis := "Плащ невидимости"
				if (check_invis = 16842752)
					type_invis := "Невидимость ассасина"
				LV_Modify(n, "", n, o_offset, identifier, id_2, id_3, guild, nickname, visibility, type_invis, range, posx, posy, posz, item_1, item_2, item_3, item_4)
				n+=1
			}
			SetFormat Integer, H
			o_offset += 4
			SetFormat Integer, D
			type_invis := ""
			if (r2.read(b_offset_1, "UInt", 0xc, o_offset, 0x0) != entity){
				WinSetTitle, ahk_pid %IDWin%,, % "Персонажей в радиусе обзора " n-1
				clear := n
				while (clear <= clear_old){
					LV_Modify(clear, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
					clear+=1
				}
				o_offset := 0x0
				clear_old := n
				n := 1
				DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
				sleep 1
			}
			
		}
		
		GuiSize:
		if A_EventInfo = 1
			return
		GuiControl, Move, ListView, % "W" . (A_GuiWidth) . " H" . (A_GuiHeight)
		return

		GuiEscape:
		GuiClose:
		OnExit:
		    filedelete, % A_ScriptName
		    ExitApp
	)

; ---------------------------------------------------------------------------
; Показываем невидимых персонажей

	Text3 =
	(%
		#NoEnv
		#NoTrayIcon
		#Include classMemory.ahk
		#Include offset.ahk
		IniRead, GetWinR2, config.ini, Settings, GetWinR2
		IniRead, Offset, config.ini, Settings, Offset
		IniRead, List_AlwaysOnTop, config.ini, Settings, List_AlwaysOnTop
		IniRead, List_Vis, config.ini, Settings, List_Vis	
		offset_selection(Offset)
		OnExit, OnExit
		
		if (_ClassMemory.__Class != "_ClassMemory")
		{
			msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
			ExitApp
		}
		r2 := new _ClassMemory("ahk_id "GetWinR2, "", hProcessCopy)
		if (r2 = ""){
			Msgbox "ошибка ID процесса не считано"
			ExitApp
		}
		
		Gui +Resize
		Gui Font, s9
		Gui 1:Add, ListView, x-1 y-1 +LV0x4000 +Grid NoSortHdr +LV0x10000 -LV0x20 vListView, |Адрес|Идентификатор(Указатель)|ID Модели|ID Перевоплощения|Гильдия|Ник|Степень видимости|Тип невидимости|Расстояние до объекта|Координата X|Координата Y|Координата Z
		LV_ModifyCol(4, 110)
		LV_ModifyCol(5, 110)
		LV_ModifyCol(6, 130)
		LV_ModifyCol(7, 110)
		LV_ModifyCol(9, 130)
		LV_ModifyCol(10, 150)
		Gui Show, Restore w1350 h620, Невидимость
		
		if (List_AlwaysOnTop){
			WinSet, AlwaysOnTop,, Невидимость
		}
		List_Vis := 55+200*(List_Vis/100)
		WinSet, Transparent, %List_Vis%, Невидимость
		
		o_offset := 0x0
		n := 1
		n_old := -1
		clear_old := -1
		entity := r2.read(b_offset_1, "UInt", 0xc, 0x0, 0x0)
		loop 
		{
			SetFormat Integer, H
			identifier := r2.pointer(b_offset_1, "Uint", 0xC, o_offset, o_identifier)
			SetFormat Integer, D
			check_invis := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_typeinvis)
			if (n > n_old) {
				LV_Insert(n)
				n_old := n
			}
			if ((check_invis = 16777217 || check_invis = 16842752) && identifier != 0 && r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier, o_checknpc_2) = 1) {
				id_2 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_id_2)
				id_3 := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_id_3)
				guild := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_guild)
				nickname := r2.readString(b_offset_1, 0,"CP1251", 0xc, o_offset, o_nickname)
				SetFormat, Float, 0.2
				visibility := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_transparent_1)
				SetFormat, Float, 0.6
				posx := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posx)
				posy := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posy)
				posz := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posz)
				range := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posrange)
				loop, 2{
					i := A_Index + 1
					id_m := id_%i%
					if (id_m){
						IniRead, id, id\%Offset%.ini, ID, %id_m%, %A_Space%
						id_%i% = [%id_m%] %id%
					}
				}
				if (check_invis = 16777217)
					type_invis := "Плащ невидимости"
				if (check_invis = 16842752)
					type_invis := "Невидимость ассасина"
				LV_Modify(n, "", n, o_offset, identifier, id_2, id_3, guild, nickname, visibility, type_invis, range, posx, posy, posz)
				n+=1
			}
			SetFormat Integer, H
			o_offset += 4
			SetFormat Integer, D
			if (r2.read(b_offset_1, "UInt", 0xc, o_offset, 0x0) != entity){
				clear := n
				while (clear <= clear_old){
					LV_Modify(clear, "", "", "", "", "", "", "", "", "", "", "", "", "", "")
					clear+=1
				}
				o_offset := 0x0
				clear_old := n
				n := 1
				DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
				sleep 1
			}
			
		}
		
		GuiSize:
		if A_EventInfo = 1
			return
		GuiControl, Move, ListView, % "W" . (A_GuiWidth) . " H" . (A_GuiHeight)
		return

		GuiEscape:
		GuiClose:
		OnExit:
		    filedelete, % A_ScriptName
		    ExitApp
	)

; ---------------------------------------------------------------------------
; Показываем НПС и монстров

	Text4 =
	(%
		#NoEnv
		#NoTrayIcon
		#Include classMemory.ahk
		#Include offset.ahk
		IniRead, GetWinR2, config.ini, Settings, GetWinR2
		IniRead, Offset, config.ini, Settings, Offset
		IniRead, List_AlwaysOnTop, config.ini, Settings, List_AlwaysOnTop
		IniRead, List_Vis, config.ini, Settings, List_Vis	
		offset_selection(Offset)
		OnExit, OnExit
		
		if (_ClassMemory.__Class != "_ClassMemory")
		{
			msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
			ExitApp
		}
		r2 := new _ClassMemory("ahk_id "GetWinR2, "", hProcessCopy)
		if (r2 = ""){
			Msgbox "ошибка ID процесса не считано"
			ExitApp
		}
		
		Gui +Resize
		Gui Font, s9
		Gui 1:Add, ListView, x-1 y-1 +LV0x4000 +Grid NoSortHdr +LV0x10000 vListView, |Адрес|Идентификатор(Указатель)|ID Монстра\НПС|HP|Расстояние до объекта|Координата X|Координата Y|Координата Z
		LV_ModifyCol(4, 270)
		LV_ModifyCol(5, 60)
		Gui Show, Restore w970 h620, NPC и мобы
		
		if (List_AlwaysOnTop){
			WinSet, AlwaysOnTop,, NPC и мобы
		}
		List_Vis := 55+200*(List_Vis/100)
		WinSet, Transparent, %List_Vis%, NPC и мобы
		o_offset := 0x0
		n := 1
		n_old := -1
		clear_old := 1
		entity := r2.read(b_offset_1, "UInt", 0xc, 0x0, 0x0)
		loop 
		{
			SetFormat Integer, H
			identifier := r2.pointer(b_offset_1, "Uint", 0xC, o_offset, o_identifier)
			SetFormat Integer, D
			if (n > n_old) {
				LV_Insert(n)
				n_old := n
			}
			if (identifier != 0 && r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier, o_checknpc_2) = 2) {
				id := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_id_1)
				hp := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_chp)
				posx := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posx)
				posy := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posy)
				posz := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posz)
				range := r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posrange)
				IniRead, idnpc, id\%Offset%.ini, ID, %id%, %A_Space%
				id = [%id%] %idnpc%
				LV_Modify(n, "", n, o_offset, identifier, id, hp, range, posx, posy, posz)
				n+=1
			}
			SetFormat Integer, H
			o_offset += 4
			SetFormat Integer, D
			if (r2.read(b_offset_1, "UInt", 0xc, o_offset, 0x0) != entity){
				clear := n
				while (clear <= clear_old){
					LV_Modify(clear, "", "", "", "", "", "", "", "", "", "")
					clear+=1
				}
				o_offset := 0x0
				clear_old := n
				n := 1
				DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
				sleep 1
			}
			
		}
		
		GuiSize:
		if A_EventInfo = 1
			return
		GuiControl, Move, ListView, % "W" . (A_GuiWidth) . " H" . (A_GuiHeight)
		return

		GuiEscape:
		GuiClose:
		OnExit:
		    filedelete, % A_ScriptName
		    ExitApp
	)

; ---------------------------------------------------------------------------
; Показываем дроп

	Text5 =
	(%
		#NoEnv
		#NoTrayIcon
		#Include classMemory.ahk
		#Include offset.ahk
		IniRead, GetWinR2, config.ini, Settings, GetWinR2
		IniRead, Offset, config.ini, Settings, Offset
		IniRead, List_AlwaysOnTop, config.ini, Settings, List_AlwaysOnTop
		IniRead, List_Vis, config.ini, Settings, List_Vis	
		offset_selection(Offset)
		OnExit, OnExit
		
		if (_ClassMemory.__Class != "_ClassMemory")
		{
			msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
			ExitApp
		}
		r2 := new _ClassMemory("ahk_id "GetWinR2, "", hProcessCopy)
		if (r2 = ""){
			Msgbox "ошибка ID процесса не считано"
			ExitApp
		}
		
		Gui +Resize
		Gui Font, s9
		Gui 1:Add, ListView, x-1 y-1 +LV0x4000 +Grid NoSortHdr +LV0x10000 vListView, |Адрес|Идентификатор(Указатель)|ID|Расстояние до объекта|Координата X|Координата Y|Координата Z
		LV_ModifyCol(1, 30)
		LV_ModifyCol(4, 200)
		Gui Show, Restore w850 h400, Предметы
		
		if (List_AlwaysOnTop){
			WinSet, AlwaysOnTop,, Предметы
		}
		List_Vis := 55+200*(List_Vis/100)
		WinSet, Transparent, %List_Vis%, Предметы
		o_offset := 0x0	
		n := 1
		clear_old := -1
		n_old := -1
		Loop	
		{
			entity_check := r2.read(b_offset_1, "UInt", 0x34)
			SetFormat Integer, H
			identifier := r2.pointer(b_offset_1, "Uint", 0x3C, o_offset, 0x0)
			SetFormat Integer, D
			posx := r2.read(b_offset_1, "UFloat", 0x3c, o_offset, 0x0, o_posx)
			posy := r2.read(b_offset_1, "UFloat", 0x3c, o_offset, 0x0, o_posy)
			posz := r2.read(b_offset_1, "UFloat", 0x3c, o_offset, 0x0, o_posz)
			range := r2.read(b_offset_1, "UFloat", 0x3c, o_offset, 0x0, o_posrange)
			id := r2.read(b_offset_1, "UInt", 0x3c, o_offset, o_drop_id)
			if (n > n_old) {
				LV_Insert(n)
				n_old := n
			}			
			if (entity_check != 0) {
				IniRead, dropname, id\%Offset%.ini, Item, %id%, %A_Space%
				id = [%id%] %dropname%
				LV_Modify(n, "", n, o_offset, identifier, id, range, posx, posy, posz)
				n+=1
			}	
			SetFormat Integer, H
			o_offset += 4
			SetFormat Integer, D
			if (entity_check < n){
				clear := n
				while (clear <= clear_old){
					LV_Modify(clear, "", "", "", "", "", "", "", "", "")
					clear+=1
				}
				o_offset := 0x0
				clear_old := n
				n := 1
				DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
				sleep 1
			}
		}
		
		GuiSize:
		if A_EventInfo = 1
			return
		GuiControl, Move, ListView, % "W" . (A_GuiWidth) . " H" . (A_GuiHeight)
		return

		GuiEscape:
		GuiClose:
		OnExit:
		    filedelete, % A_ScriptName
		    ExitApp
	)
	
; ---------------------------------------------------------------------------
; Вижн на невидимых
	Text6 =
	(%
		#NoEnv
		#NoTrayIcon
		#Include classMemory.ahk
		#Include offset.ahk
		IniRead, GetWinR2, config.ini, Settings, GetWinR2
		IniRead, Offset, config.ini, Settings, Offset
		IniRead, Invis_alpha, config.ini, SettingsStatic, Invis_alpha
		IniRead, Invis_range, config.ini, SettingsStatic, Invis_range
		IniRead, Invis_outline, config.ini, SettingsStatic, Invis_outline
		offset_selection(Offset)
		OnExit, OnExit
		if (_ClassMemory.__Class != "_ClassMemory")
		{
			msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
			ExitApp
		}
		r2 := new _ClassMemory("ahk_id "GetWinR2, "", hProcessCopy)
		if (r2 = ""){
			Msgbox "ошибка ID процесса не считано"
			ExitApp
		}
		o_offset := 0x0
		entity := r2.read(b_offset_1, "UInt", 0xc, 0x0, 0x0)
		if (Invis_outline){
			IniRead, Invis_outline_color, config.ini, SettingsStatic, Invis_outline_color
			Invis_outline_color := HexToDec("FF"Invis_outline_color)
			Loop
			{
				if (r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier) != 0) {
					type_invis := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_typeinvis)
					if ((type_invis = 16777217 || type_invis = 16842752) && r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_transparent_1) <= Invis_alpha && r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_moveposx) != -1 && r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posrange) < Invis_range) {
						r2.write(b_offset_1, Invis_alpha, "UFloat", 0xc, o_offset, o_transparent_1)
						r2.write(b_offset_1, Invis_alpha, "UFloat", 0xc, o_offset, o_identifier, o_transparent_2)
						r2.write(b_offset_1, 1, "UInt", 0xc, o_offset, o_infoinvis)
						r2.write(b_offset_1, 1, "UInt", 0xc, o_offset, o_identifier, o_targetinvis)
						r2.write(b_offset_1, 1, "UChar", 0xc, o_offset, o_identifier, o_outline)
						r2.write(b_offset_1, Invis_outline_color, "UInt", 0xc, o_offset, o_identifier, o_outline_color)	
					}
					if (r2.read(b_offset_1, "UChar", 0xc, o_offset, o_identifier, o_outline) = 1 && r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier, o_outline_color) = Invis_outline_color && r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_transparent_1) > Invis_alpha){
						r2.write(b_offset_1, 0, "UChar", 0xc, o_offset, o_identifier, o_outline)
					}
				}
				SetFormat Integer, H
				o_offset += 4
				SetFormat Integer, D
				if (r2.read(b_offset_1, "UInt", 0xc, o_offset, 0x0) != entity){
					o_offset := 0x0
					DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
					sleep 1
				}
			}
		} else {
			Loop
			{
				if (r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier) != 0) {
					type_invis := r2.read(b_offset_1, "UInt", 0xc, o_offset, o_typeinvis)
					if ((type_invis = 16777217 || type_invis = 16842752) && r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_transparent_1) <= Invis_alpha && r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_moveposx) != -1 && r2.read(b_offset_1, "UFloat", 0xc, o_offset, o_identifier, o_posrange) < Invis_range) {
						r2.write(b_offset_1, Invis_alpha, "UFloat", 0xc, o_offset, o_transparent_1)
						r2.write(b_offset_1, Invis_alpha, "UFloat", 0xc, o_offset, o_identifier, o_transparent_2)
						r2.write(b_offset_1, 1, "UInt", 0xc, o_offset, o_infoinvis)
						r2.write(b_offset_1, 1, "UInt", 0xc, o_offset, o_identifier, o_targetinvis)
					}
				}
				SetFormat Integer, H
				o_offset += 4
				SetFormat Integer, D
				if (r2.read(b_offset_1, "UInt", 0xc, o_offset, 0x0) != entity){
					o_offset := 0x0
					DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
					sleep 1
				}
			}		
		}

		HexToDec(Hex)
		{
			if (InStr(Hex, "0x") != 1)
				Hex := "0x" Hex
			return, Hex + 0
		}
		
		GuiEscape:
		GuiClose:
		OnExit:
		    filedelete, % A_ScriptName
		    ExitApp
	)
	
; ---------------------------------------------------------------------------
; Скрипт подсветки агрящихся

	Text7 =
	(%
		#NoEnv
		#NoTrayIcon
		#Include classMemory.ahk
		#Include offset.ahk
		IniRead, GetWinR2, config.ini, Settings, GetWinR2
		IniRead, Offset, config.ini, Settings, Offset
		IniRead, Agro_outline_color, config.ini, SettingsStatic, Agro_outline_color
		IniRead, Agro_alpha, config.ini, SettingsStatic, Agro_alpha
		offset_selection(Offset)
		OnExit, OnExit
		if (_ClassMemory.__Class != "_ClassMemory")
		{
			msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
			ExitApp
		}
		r2 := new _ClassMemory("ahk_id "GetWinR2, "", hProcessCopy)
		if (r2 = ""){
			Msgbox "ошибка ID процесса не считано"
			ExitApp
		}
		Agro_outline_color := HexToDec("FF"Agro_outline_color)
		o_offset := 0x0
		entity := r2.read(b_offset_1, "UInt", 0xc, 0x0, 0x0)
		identifier_my := r2.read(b_offset_1, "UInt", 0x60, o_identifier)
		Loop
		{
			if (r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier) != 0 && r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier, o_checknpc_2) = 1) {
				if (r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier_target) = identifier_my && r2.read(b_offset_1, "Uint", 0xc, o_offset, o_pastat) = 5){
					r2.write(b_offset_1, Agro_alpha, "UFloat", 0xc, o_offset, o_transparent_1)
					r2.write(b_offset_1, Agro_alpha, "UFloat", 0xc, o_offset, o_identifier, o_transparent_2)
					r2.write(b_offset_1, 1, "UChar", 0xc, o_offset, o_identifier, o_outline)
					r2.write(b_offset_1, Agro_outline_color, "UInt", 0xc, o_offset, o_identifier, o_outline_color)
				}
				if (r2.read(b_offset_1, "UChar", 0xc, o_offset, o_identifier, o_outline) = 1 && r2.read(b_offset_1, "UInt", 0xc, o_offset, o_identifier, o_outline_color) = Agro_outline_color && r2.read(b_offset_1, "Uint", 0xc, o_offset, o_pastat) != 5){
					r2.write(b_offset_1, 1, "UFloat", 0xc, o_offset, o_transparent_1)
					r2.write(b_offset_1, 1, "UFloat", 0xc, o_offset, o_identifier, o_transparent_2)
					r2.write(b_offset_1, 0, "UChar", 0xc, o_offset, o_identifier, o_outline)
				}
			}		
			SetFormat Integer, H
			o_offset += 4
			SetFormat Integer, D
			if (r2.read(b_offset_1, "UInt", 0xc, o_offset, 0x0) != entity){
				o_offset := 0x0
				DllCall("SetProcessWorkingSetSize", Int,-1, Int,-1, Int,-1 )
				sleep 1
			}
		}

		HexToDec(Hex)
		{
			if (InStr(Hex, "0x") != 1)
				Hex := "0x" Hex
			return, Hex + 0
		}
		
		GuiEscape:
		GuiClose:
		OnExit:
		    filedelete, % A_ScriptName
		    ExitApp
   	)

;-----------------------------------------------------------------------------------------------------------------
;Гравитация
Text8 =
	(%
		#NoEnv
		#NoTrayIcon
		#Include classMemory.ahk
		#Include offset.ahk
		IniRead, GetWinR2, config.ini, Settings, GetWinR2
		IniRead, Offset, config.ini, Settings, Offset
		offset_selection(Offset)
		OnExit, OnExit

		if (_ClassMemory.__Class != "_ClassMemory")
		{
			msgbox class memory not correctly installed. Or the (global class) variable "_ClassMemory" has been overwritten
			ExitApp
		}
		r2 := new _ClassMemory("ahk_id "GetWinR2, "", hProcessCopy)
		if (r2 = ""){
			Msgbox "ошибка ID процесса не считано"
			ExitApp
		}
		Loop
		{
			r2.write(b_offset_1, 9.61, "UFloat", 0x60, o_identifier, o_gravity)
			r2.write(b_offset_1, 1, "Uint", 0x60, o_pastat)
			sleep 1
		}
		GuiEscape:
		GuiClose:
		OnExit:
		    filedelete, % A_ScriptName
		    ExitApp
	)
	
; ---------------------------------------------------------------------------
; Бот

	Text9 =
	(%
	)
;-----------------------------------------------------------	
; Отслеживание персонажа

	Text10 = 
	(%
	)

	FilePath := A_ScriptDir "\_MyScript_" A_TickCount ".ahk"
	FileAppend, % Text%n%, % FilePath
		Run, % FilePath,,, PID
	this[n] := {Path: FilePath, PID: PID}
}

GuiEscape:
GuiClose:
OnExit:
{
	IniWrite,% "", config.ini, Settings, GetWinR2
	for k, v in ScriptManage
		if k is integer
	   		ScriptManage.Terminate(k)
   	ExitApp
}