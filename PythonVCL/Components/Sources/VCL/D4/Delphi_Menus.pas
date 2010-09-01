////
//  This file was generated by VCL Generator
//  Copyright 1998 - Morgan Martinet
//  06/07/1999 07:59:00
//  it subclasses all classes of the unit Menus
////

unit Delphi_Menus;

interface

uses
  Windows,
  SysUtils,
  Classes,
  Messages,
  Graphics,
  ImgList,
  ActnList,
  Menus,
  PythonEngine,
  PyVarArg,
  PyRecords,
  PyDelphiAssoc;

type
  TPyMenuActionLink = class( TMenuActionLink )
  protected
    FAssoc : Integer;
  public
    destructor Destroy; override;
  published
    property __assoc__ : Integer read FAssoc write FAssoc;
  end;

  TPyMenuItem = class( TMenuItem )
  protected
    FAssoc : Integer;
  public
    destructor Destroy; override;
    procedure EventOnClick( Sender : TObject );
    procedure EventOnDrawItem( Sender : TObject; ACanvas : TCanvas; ARect : TRect; Selected : Boolean );
    procedure EventOnMeasureItem( Sender : TObject; ACanvas : TCanvas; var Width, Height : Integer );
  published
    property __assoc__ : Integer read FAssoc write FAssoc;
  end;

  TPyMenu = class( TMenu )
  protected
    FAssoc : Integer;
  public
    destructor Destroy; override;
  published
    property __assoc__ : Integer read FAssoc write FAssoc;
  end;

  TPyMainMenu = class( TMainMenu )
  protected
    FAssoc : Integer;
  public
    destructor Destroy; override;
    procedure EventOnChange( Sender : TObject; Source : TMenuItem; Rebuild : Boolean );
  published
    property __assoc__ : Integer read FAssoc write FAssoc;
  end;

  TPyPopupMenu = class( TPopupMenu )
  protected
    FAssoc : Integer;
  public
    destructor Destroy; override;
    procedure EventOnChange( Sender : TObject; Source : TMenuItem; Rebuild : Boolean );
    procedure EventOnPopup( Sender : TObject );
  published
    property __assoc__ : Integer read FAssoc write FAssoc;
  end;


implementation

Uses Py_Misc;

/////////// class TPyMenuActionLink /////////////////////

destructor TPyMenuActionLink.Destroy;
begin
  ClearInterface( TDelphiAssoc(FAssoc) );
  FAssoc := 0;
  inherited;
end;

/////////// class TPyMenuItem /////////////////////

destructor TPyMenuItem.Destroy;
begin
  ClearInterface( TDelphiAssoc(FAssoc) );
  FAssoc := 0;
  inherited;
end;

procedure TPyMenuItem.EventOnClick( Sender : TObject );
var
  args, rslt : PPyObject;
  L : TList;
begin
  L := TList.Create;
  try
    L.Add( GetPythonObject( Sender, 'Menus', 'TMenuItem' ) ); 
    rslt := ExecuteEvent( 'OnClick', TDelphiAssoc(__assoc__), L, args );
    GetPythonEngine.Py_XDecRef( rslt );
    GetPythonEngine.Py_XDecRef( args );
  finally
    L.Free;
  end;
end;

procedure TPyMenuItem.EventOnDrawItem( Sender : TObject; ACanvas : TCanvas; ARect : TRect; Selected : Boolean );
var
  args, rslt : PPyObject;
  L : TList;
begin
  L := TList.Create;
  try
    L.Add( GetPythonObject( Sender, 'Menus', 'TMenuItem' ) ); 
    L.Add( GetPythonObject( ACanvas, 'Menus', 'TMenuItem' ) ); 
    L.Add( CreateRect( ARect ).GetSelf ); 
    L.Add( GetPythonEngine.VariantAsPyObject( Selected ) ); 
    rslt := ExecuteEvent( 'OnDrawItem', TDelphiAssoc(__assoc__), L, args );
    GetPythonEngine.Py_XDecRef( rslt );
    GetPythonEngine.Py_XDecRef( args );
  finally
    L.Free;
  end;
end;

procedure TPyMenuItem.EventOnMeasureItem( Sender : TObject; ACanvas : TCanvas; var Width, Height : Integer );
var
  args, rslt : PPyObject;
  L : TList;
begin
  L := TList.Create;
  try
    L.Add( GetPythonObject( Sender, 'Menus', 'TMenuItem' ) ); 
    L.Add( GetPythonObject( ACanvas, 'Menus', 'TMenuItem' ) ); 
    L.Add( CreateVarArg( GetPythonEngine.VariantAsPyObject( Width ) ).GetSelf ); 
    L.Add( CreateVarArg( GetPythonEngine.VariantAsPyObject( Height ) ).GetSelf ); 
    rslt := ExecuteEvent( 'OnMeasureItem', TDelphiAssoc(__assoc__), L, args );
    Width := GetPythonEngine.PyObjectAsVariant( ExtractValueOfVarArg( PPyObject(L.Items[2]) ) );
    Height := GetPythonEngine.PyObjectAsVariant( ExtractValueOfVarArg( PPyObject(L.Items[3]) ) );
    GetPythonEngine.Py_XDecRef( rslt );
    GetPythonEngine.Py_XDecRef( args );
  finally
    L.Free;
  end;
end;

/////////// class TPyMenu /////////////////////

destructor TPyMenu.Destroy;
begin
  ClearInterface( TDelphiAssoc(FAssoc) );
  FAssoc := 0;
  inherited;
end;

/////////// class TPyMainMenu /////////////////////

destructor TPyMainMenu.Destroy;
begin
  ClearInterface( TDelphiAssoc(FAssoc) );
  FAssoc := 0;
  inherited;
end;

procedure TPyMainMenu.EventOnChange( Sender : TObject; Source : TMenuItem; Rebuild : Boolean );
var
  args, rslt : PPyObject;
  L : TList;
begin
  L := TList.Create;
  try
    L.Add( GetPythonObject( Sender, 'Menus', 'TMainMenu' ) ); 
    L.Add( GetPythonObject( Source, 'Menus', 'TMainMenu' ) ); 
    L.Add( GetPythonEngine.VariantAsPyObject( Rebuild ) ); 
    rslt := ExecuteEvent( 'OnChange', TDelphiAssoc(__assoc__), L, args );
    GetPythonEngine.Py_XDecRef( rslt );
    GetPythonEngine.Py_XDecRef( args );
  finally
    L.Free;
  end;
end;

/////////// class TPyPopupMenu /////////////////////

destructor TPyPopupMenu.Destroy;
begin
  ClearInterface( TDelphiAssoc(FAssoc) );
  FAssoc := 0;
  inherited;
end;

procedure TPyPopupMenu.EventOnChange( Sender : TObject; Source : TMenuItem; Rebuild : Boolean );
var
  args, rslt : PPyObject;
  L : TList;
begin
  L := TList.Create;
  try
    L.Add( GetPythonObject( Sender, 'Menus', 'TPopupMenu' ) ); 
    L.Add( GetPythonObject( Source, 'Menus', 'TPopupMenu' ) ); 
    L.Add( GetPythonEngine.VariantAsPyObject( Rebuild ) ); 
    rslt := ExecuteEvent( 'OnChange', TDelphiAssoc(__assoc__), L, args );
    GetPythonEngine.Py_XDecRef( rslt );
    GetPythonEngine.Py_XDecRef( args );
  finally
    L.Free;
  end;
end;

procedure TPyPopupMenu.EventOnPopup( Sender : TObject );
var
  args, rslt : PPyObject;
  L : TList;
begin
  L := TList.Create;
  try
    L.Add( GetPythonObject( Sender, 'Menus', 'TPopupMenu' ) ); 
    rslt := ExecuteEvent( 'OnPopup', TDelphiAssoc(__assoc__), L, args );
    GetPythonEngine.Py_XDecRef( rslt );
    GetPythonEngine.Py_XDecRef( args );
  finally
    L.Free;
  end;
end;


end.