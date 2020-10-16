unit TestForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DTF.Form.MDIChild, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Data.DB, Vcl.DBActns, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.WinXCalendars;

type
  TfrmTest = class(TDTFMDIChildForm)
    CalendarPicker1: TCalendarPicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTest: TfrmTest;

implementation

{$R *.dfm}

uses MenuTypes;

initialization
  TMenuFactory.Instance.Regist('test', TfrmTest);
finalization

end.
