unit LoginForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmLogin = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.Button1Click(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    ShowMessage('���̵� �Ǵ� ��й�ȣ�� �����ʽ��ϴ�.');
    Exit;
  end;

  ModalResult := mrOK;
end;

procedure TfrmLogin.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
