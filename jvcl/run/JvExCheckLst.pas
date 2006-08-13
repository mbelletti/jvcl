{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvExCheckLst.pas, released on 2004-01-04

The Initial Developer of the Original Code is Andreas Hausladen [Andreas dott Hausladen att gmx dott de]
Portions created by Andreas Hausladen are Copyright (C) 2004 Andreas Hausladen.
All Rights Reserved.

Contributor(s): -

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
// $Id$

unit JvExCheckLst;

{$I jvcl.inc}
{MACROINCLUDE JvExControls.macros}

{*****************************************************************************
 * WARNING: Do not edit this file.
 * This file is autogenerated from the source in devtools/JvExVCL/src.
 * If you do it despite this warning your changes will be discarded by the next
 * update of this file. Do your changes in the template files.
 ****************************************************************************}
{$D-} // do not step into this unit

interface

uses
  Windows, Messages,
  {$IFDEF HAS_UNIT_TYPES}
  Types,
  {$ENDIF HAS_UNIT_TYPES}
  SysUtils, Classes, Graphics, Controls, Forms, CheckLst,
  {$IFDEF UNITVERSIONING}
  JclUnitVersioning,
  {$ENDIF UNITVERSIONING}
  JvTypes, JvThemes, JVCLVer, JvExControls;

type
  TJvExCheckListBox = class(TCheckListBox, IJvExControl)
  private
    FAboutJVCL: TJVCLAboutInfo;
    FHintColor: TColor;
    FMouseOver: Boolean;
    FHintWindowClass: THintWindowClass;
    {$IFDEF VCL}
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    {$ENDIF VCL}
    FOnParentColorChanged: TNotifyEvent;
    function BaseWndProc(Msg: Integer; WParam: Integer = 0; LParam: Longint = 0): Integer; overload;
    function BaseWndProc(Msg: Integer; WParam: Integer; LParam: TControl): Integer; overload;
    function BaseWndProcEx(Msg: Integer; WParam: Integer; var LParam): Integer;
  protected
    procedure WndProc(var Msg: TMessage); override;
    {$IFNDEF CLR}
    procedure FocusChanged(AControl: TWinControl); dynamic;
    {$ENDIF !CLR}
    procedure VisibleChanged; reintroduce; dynamic;
    procedure EnabledChanged; reintroduce; dynamic;
    procedure TextChanged; reintroduce; virtual;
    procedure ColorChanged; reintroduce; dynamic;
    procedure FontChanged; reintroduce; dynamic;
    procedure ParentFontChanged; reintroduce; dynamic;
    procedure ParentColorChanged; reintroduce; dynamic;
    procedure ParentShowHintChanged; reintroduce; dynamic;
    function WantKey(Key: Integer; Shift: TShiftState; const KeyText: WideString): Boolean; reintroduce; virtual;
    function HintShow(var HintInfo: THintInfo): Boolean; reintroduce; dynamic;
    function HitTest(X, Y: Integer): Boolean; reintroduce; virtual;
    procedure MouseEnter(AControl: TControl); reintroduce; dynamic;
    procedure MouseLeave(AControl: TControl); reintroduce; dynamic;
    {$IFDEF COMPILER5}
    {$IFNDEF HASAUTOSIZE}
    procedure CMSetAutoSize(var Msg: TMessage); message CM_SETAUTOSIZE;
    procedure SetAutoSize(Value: Boolean); virtual;
    {$ENDIF !HASAUTOSIZE}
    {$ENDIF COMPILER5}
    property MouseOver: Boolean read FMouseOver write FMouseOver;
    property HintColor: TColor read FHintColor write FHintColor default clDefault;
    {$IFDEF VCL}
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    {$ENDIF VCL}
    property OnParentColorChange: TNotifyEvent read FOnParentColorChanged write FOnParentColorChanged;
  public
    constructor Create(AOwner: TComponent); override;
    property HintWindowClass: THintWindowClass read FHintWindowClass write FHintWindowClass;
  published
    property AboutJVCL: TJVCLAboutInfo read FAboutJVCL write FAboutJVCL stored False;
  private
    FDotNetHighlighting: Boolean;
  protected
    procedure BoundsChanged; reintroduce; virtual;
    procedure CursorChanged; reintroduce; dynamic;
    procedure ShowingChanged; reintroduce; dynamic;
    procedure ShowHintChanged; reintroduce; dynamic;
    {$IFNDEF CLR}
    procedure ControlsListChanging(Control: TControl; Inserting: Boolean); reintroduce; dynamic;
    procedure ControlsListChanged(Control: TControl; Inserting: Boolean); reintroduce; dynamic;
    {$ENDIF !CLR}
    procedure GetDlgCode(var Code: TDlgCodes); virtual;
    procedure FocusSet(PrevWnd: THandle); virtual;
    procedure FocusKilled(NextWnd: THandle); virtual;
    function DoEraseBackground(Canvas: TCanvas; Param: Integer): Boolean; virtual;
  {$IFDEF JVCLThemesEnabledD56}
  private
    function GetParentBackground: Boolean;
  protected
    procedure SetParentBackground(Value: Boolean); virtual;
    property ParentBackground: Boolean read GetParentBackground write SetParentBackground;
  {$ENDIF JVCLThemesEnabledD56}
  published
    property DotNetHighlighting: Boolean read FDotNetHighlighting write FDotNetHighlighting default False;
  end;

{$IFDEF UNITVERSIONING}
const
  UnitVersioning: TUnitVersionInfo = (
    RCSfile: '$URL$';
    Revision: '$Revision$';
    Date: '$Date$';
    LogPath: 'JVCL\run'
  );
{$ENDIF UNITVERSIONING}

implementation

constructor TJvExCheckListBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHintColor := clDefault;
end;

function TJvExCheckListBox.BaseWndProc(Msg: Integer; WParam: Integer = 0; LParam: Longint = 0): Integer;
var
  Mesg: TMessage;
begin
  Mesg := CreateWMMessage(Msg, WParam, LParam);
  inherited WndProc(Mesg);
  Result := Mesg.Result;
end;

function TJvExCheckListBox.BaseWndProc(Msg: Integer; WParam: Integer; LParam: TControl): Integer;
var
  Mesg: TMessage;
begin
  Mesg := CreateWMMessage(Msg, WParam, LParam);
  inherited WndProc(Mesg);
  Result := Mesg.Result;
end;

function TJvExCheckListBox.BaseWndProcEx(Msg: Integer; WParam: Integer; var LParam): Integer;
var
  Mesg: TStructPtrMessage;
begin
  Mesg := TStructPtrMessage.Create(Msg, WParam, LParam);
  try
    inherited WndProc(Mesg.Msg);
  finally
    Result := Mesg.Msg.Result;
    Mesg.Free;
  end;
end;

procedure TJvExCheckListBox.VisibleChanged;
begin
  BaseWndProc(CM_VISIBLECHANGED);
end;

procedure TJvExCheckListBox.EnabledChanged;
begin
  BaseWndProc(CM_ENABLEDCHANGED);
end;

procedure TJvExCheckListBox.TextChanged;
begin
  BaseWndProc(CM_TEXTCHANGED);
end;

procedure TJvExCheckListBox.FontChanged;
begin
  BaseWndProc(CM_FONTCHANGED);
end;

procedure TJvExCheckListBox.ColorChanged;
begin
  BaseWndProc(CM_COLORCHANGED);
end;

procedure TJvExCheckListBox.ParentFontChanged;
begin
  BaseWndProc(CM_PARENTFONTCHANGED);
end;

procedure TJvExCheckListBox.ParentColorChanged;
begin
  BaseWndProc(CM_PARENTCOLORCHANGED);
  if Assigned(OnParentColorChange) then
    OnParentColorChange(Self);
end;

procedure TJvExCheckListBox.ParentShowHintChanged;
begin
  BaseWndProc(CM_PARENTSHOWHINTCHANGED);
end;

function TJvExCheckListBox.WantKey(Key: Integer; Shift: TShiftState; const KeyText: WideString): Boolean;
begin
  Result := BaseWndProc(CM_DIALOGCHAR, Word(Key), ShiftStateToKeyData(Shift)) <> 0;
end;

function TJvExCheckListBox.HitTest(X, Y: Integer): Boolean;
begin
  Result := BaseWndProc(CM_HITTEST, 0, SmallPointToLong(PointToSmallPoint(Point(X, Y)))) <> 0;
end;

function TJvExCheckListBox.HintShow(var HintInfo: THintInfo): Boolean;
begin
  GetHintColor(HintInfo, Self, FHintColor);
  if FHintWindowClass <> nil then
    HintInfo.HintWindowClass := FHintWindowClass;
  Result := BaseWndProcEx(CM_HINTSHOW, 0, HintInfo) <> 0;
end;

procedure TJvExCheckListBox.MouseEnter(AControl: TControl);
begin
  FMouseOver := True;
  {$IFDEF VCL}
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
  {$ENDIF VCL}
  BaseWndProc(CM_MOUSEENTER, 0, AControl);
end;

procedure TJvExCheckListBox.MouseLeave(AControl: TControl);
begin
  FMouseOver := False;
  BaseWndProc(CM_MOUSELEAVE, 0, AControl);
  {$IFDEF VCL}
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  {$ENDIF VCL}
end;

{$IFNDEF CLR}
procedure TJvExCheckListBox.FocusChanged(AControl: TWinControl);
begin
  BaseWndProc(CM_FOCUSCHANGED, 0, AControl);
end;
{$ENDIF !CLR}

{$IFDEF COMPILER5}
{$IFNDEF HASAUTOSIZE}

procedure TJvExCheckListBox.CMSetAutoSize(var Msg: TMessage);
begin
  SetAutoSize(Msg.WParam <> 0);
end;

procedure TJvExCheckListBox.SetAutoSize(Value: Boolean);
begin
  TOpenControl_SetAutoSize(Self, Value);
end;

{$ENDIF !HASAUTOSIZE}
{$ENDIF COMPILER5}

procedure TJvExCheckListBox.BoundsChanged;
begin
end;

procedure TJvExCheckListBox.CursorChanged;
begin
  BaseWndProc(CM_CURSORCHANGED);
end;

procedure TJvExCheckListBox.ShowingChanged;
begin
  BaseWndProc(CM_SHOWINGCHANGED);
end;

procedure TJvExCheckListBox.ShowHintChanged;
begin
  BaseWndProc(CM_SHOWHINTCHANGED);
end;

{$IFNDEF CLR}
{ VCL sends CM_CONTROLLISTCHANGE and CM_CONTROLCHANGE in a different order than
  the CLX methods are used. So we must correct it by evaluating "Inserting". }
procedure TJvExCheckListBox.ControlsListChanging(Control: TControl; Inserting: Boolean);
begin
  if Inserting then
    BaseWndProc(CM_CONTROLLISTCHANGE, Integer(Control), Integer(Inserting))
  else
    BaseWndProc(CM_CONTROLCHANGE, Integer(Control), Integer(Inserting));
end;

procedure TJvExCheckListBox.ControlsListChanged(Control: TControl; Inserting: Boolean);
begin
  if not Inserting then
    BaseWndProc(CM_CONTROLLISTCHANGE, Integer(Control), Integer(Inserting))
  else
    BaseWndProc(CM_CONTROLCHANGE, Integer(Control), Integer(Inserting));
end;
{$ENDIF !CLR}

procedure TJvExCheckListBox.GetDlgCode(var Code: TDlgCodes);
begin
end;

procedure TJvExCheckListBox.FocusSet(PrevWnd: THandle);
begin
  BaseWndProc(WM_SETFOCUS, Integer(PrevWnd), 0);
end;

procedure TJvExCheckListBox.FocusKilled(NextWnd: THandle);
begin
  BaseWndProc(WM_KILLFOCUS, Integer(NextWnd), 0);
end;

function TJvExCheckListBox.DoEraseBackground(Canvas: TCanvas; Param: Integer): Boolean;
begin
  Result := BaseWndProc(WM_ERASEBKGND, Canvas.Handle, Param) <> 0;
end;

{$IFDEF JVCLThemesEnabledD56}
function TJvExCheckListBox.GetParentBackground: Boolean;
begin
  Result := JvThemes.GetParentBackground(Self);
end;

procedure TJvExCheckListBox.SetParentBackground(Value: Boolean);
begin
  JvThemes.SetParentBackground(Self, Value);
end;
{$ENDIF JVCLThemesEnabledD56}

procedure TJvExCheckListBox.WndProc(var Msg: TMessage);
var
  IdSaveDC: Integer;
  DlgCodes: TDlgCodes;
  Canvas: TCanvas;
  {$IFDEF CLR}
  AHintInfo: THintInfo;
  {$ENDIF CLR}
begin
  if not DispatchIsDesignMsg(Self, Msg) then
  begin
    case Msg.Msg of
      CM_DENYSUBCLASSING:
      {$IFNDEF CLR}
      Msg.Result := Ord(GetInterfaceEntry(IJvDenySubClassing) <> nil);
      {$ELSE}
      Msg.Result := Integer(Supports(Self, IJvDenySubClassing));
      {$ENDIF !CLR}
    CM_DIALOGCHAR:
      with TCMDialogChar{$IFDEF CLR}.Create{$ENDIF}(Msg) do
        Result := Ord(WantKey(CharCode, KeyDataToShiftState(KeyData), WideChar(CharCode)));
    CM_HINTSHOW:
      {$IFNDEF CLR}
      with TCMHintShow(Msg) do
        Result := Integer(HintShow(HintInfo^));
      {$ELSE}
      with TCMHintShow.Create(Msg) do
      begin
        AHintInfo := HintInfo;
        Result := Integer(HintShow(AHintInfo));
        HintInfo := AHintInfo;
      end;
      {$ENDIF !CLR}
    CM_HITTEST:
      with TCMHitTest{$IFDEF CLR}.Create{$ENDIF}(Msg) do
        Result := Integer(HitTest(XPos, YPos));
    CM_MOUSEENTER:
      MouseEnter({$IFDEF CLR}nil{$ELSE}TControl(Msg.LParam){$ENDIF});
    CM_MOUSELEAVE:
      MouseLeave({$IFDEF CLR}nil{$ELSE}TControl(Msg.LParam){$ENDIF});
    CM_VISIBLECHANGED:
      VisibleChanged;
    CM_ENABLEDCHANGED:
      EnabledChanged;
    CM_TEXTCHANGED:
      TextChanged;
    CM_FONTCHANGED:
      FontChanged;
    CM_COLORCHANGED:
      ColorChanged;
    {$IFNDEF CLR}
    CM_FOCUSCHANGED:
      FocusChanged(TWinControl(Msg.LParam));
    {$ENDIF !CLR}
    CM_PARENTFONTCHANGED:
      ParentFontChanged;
    CM_PARENTCOLORCHANGED:
      ParentColorChanged;
    CM_PARENTSHOWHINTCHANGED:
      ParentShowHintChanged;
    CM_CURSORCHANGED:
      CursorChanged;
    CM_SHOWINGCHANGED:
      ShowingChanged;
    CM_SHOWHINTCHANGED:
      ShowHintChanged;
    {$IFNDEF CLR}
    CM_CONTROLLISTCHANGE:
      if Msg.LParam <> 0 then
        ControlsListChanging(TControl(Msg.WParam), True)
      else
        ControlsListChanged(TControl(Msg.WParam), False);
    CM_CONTROLCHANGE:
      if Msg.LParam = 0 then
        ControlsListChanging(TControl(Msg.WParam), False)
      else
        ControlsListChanged(TControl(Msg.WParam), True);
    {$ENDIF !CLR}
    WM_SETFOCUS:
      FocusSet(THandle(Msg.WParam));
    WM_KILLFOCUS:
      FocusKilled(THandle(Msg.WParam));
    WM_SIZE:
      begin
        inherited WndProc(Msg);
        BoundsChanged;
      end;
    WM_ERASEBKGND:
      begin
        IdSaveDC := SaveDC(HDC(Msg.WParam)); // protect DC against Stock-Objects from Canvas
        Canvas := TCanvas.Create;
        try
          Canvas.Handle := HDC(Msg.WParam);
          Msg.Result := Ord(DoEraseBackground(Canvas, Msg.LParam));
        finally
          Canvas.Handle := 0;
          Canvas.Free;
          RestoreDC(HDC(Msg.WParam), IdSaveDC);
        end;
      end;
    WM_PRINTCLIENT, WM_PRINT: // VCL bug fix
      begin
        IdSaveDC := SaveDC(HDC(Msg.WParam)); // protect DC against changes
        try
          inherited WndProc(Msg);
        finally
          RestoreDC(HDC(Msg.WParam), IdSaveDC);
        end;
      end;
    WM_GETDLGCODE:
      begin
        inherited WndProc(Msg);
        DlgCodes := [dcNative] + DlgcToDlgCodes(Msg.Result);
        GetDlgCode(DlgCodes);
        if not (dcNative in DlgCodes) then
          Msg.Result := DlgCodesToDlgc(DlgCodes);
      end;
    else
      inherited WndProc(Msg);
    end;
    if DotNetHighlighting then
      HandleDotNetHighlighting(Self, Msg, MouseOver, Color);
  end;
end;

//============================================================================

{$IFDEF UNITVERSIONING}
initialization
  RegisterUnitVersion(HInstance, UnitVersioning);

finalization
  UnregisterUnitVersion(HInstance);
{$ENDIF UNITVERSIONING}

end.
