unit Test1Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DTF.Form.MDIChild, MenuTypes,
  Vcl.StdCtrls, Vcl.ExtCtrls, DTF.Frame.Title, DTF.Frame.Base,
  DTF.Frame.DataSet, DTF.Frame.DBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.WinXCtrls;

type
  TfrmTest1 = class(TDTFMDIChildForm)
    DTFDBGridFrame1: TDTFDBGridFrame;
    DTFTitleFrame1: TDTFTitleFrame;
    pnlSearchPanel: TPanel;
    qryMenuItems: TFDQuery;
    qryMenuItemsMENU_CODE: TWideStringField;
    qryMenuItemsMENU_NAME: TWideStringField;
    qryMenuItemsGROUP_CODE: TWideStringField;
    qryMenuItemsSORT_INDEX: TIntegerField;
    edtSchMenuName: TSearchBox;
    procedure FormCreate(Sender: TObject);
    procedure DTFDBGridFrame1actDSSearchExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  DTF.Types;

procedure TfrmTest1.FormCreate(Sender: TObject);
begin
  DTFDBGridFrame1.SetSearchPanel(pnlSearchPanel);
end;

procedure TfrmTest1.DTFDBGridFrame1actDSSearchExecute(Sender: TObject);
begin
  qryMenuItems.Close;
  qryMenuItems.ParamByName('menu_name').AsString := edtSchMenuName.Text + '%';
  qryMenuItems.Open;
end;

initialization
  TMenuFactory.Instance.Regist('TST1010', TfrmTest1);
finalization

end.
