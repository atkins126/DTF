unit SignInForm;

interface

uses
  DTF.App,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DTF.Form.Base, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmSignIn = class(TDTFBaseForm)
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edtUserId: TEdit;
    edtPassword: TEdit;
    chkUserIdSave: TCheckBox;
    Panel1: TPanel;
    Panel2: TPanel;
    btnLogin: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ExecSignIn: Boolean;

implementation

{$R *.dfm}

uses DTF.Core.AuthTypes, UserModule;

function ExecSignIn: Boolean;
var
  Form: TfrmSignIn;
begin
  Form := TfrmSignIn.Create(nil);
  Form.ShowModal;
  Form.Free;

//  Result := User.Signed;
end;

procedure TfrmSignIn.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSignIn.btnLoginClick(Sender: TObject);
const
  PASSWORD_VALIDCHECK_MINLEN = 8;
var
  SigninResult: TSignInResult;
begin
  if edtUserId.Text = '' then
  begin
    ShowMessage('���̵� �Է��ϼ���.');
    edtUserId.SetFocus;
    Exit;
  end;

  if edtPassword.Text = '' then
  begin
    ShowMessage('��й�ȣ�� �Է��ϼ���.');
    edtPassword.SetFocus;
    Exit;
  end;

  SigninResult := dmUser.SignIn(edtUserId.Text, edtPassword.Text);

  if SigninResult = srShortPassword then
  begin
    ShowMessage(Format('��й�ȣ ��å�� ���� �ʽ��ϴ�.'#13#10 +
      '  ������������ �⺻��ħ ��76��(��й�ȣ����)�� �ٰ�'#13#10 +
      '  ��й�ȣ�� ����, ������, Ư������ ���� %d�ڸ��̻� �ǰ������', [PASSWORD_VALIDCHECK_MINLEN]));
//    ShowChangePasswordForm(edtSabun.Text);
    Exit;
  end;

  if SigninResult = srExpiredPassword then
  begin
    ShowMessage('��й�ȣ�� 180�� �̻� �������� �ʾҽ��ϴ�. ���ο� ��й�ȣ�� ������ �ּ���.');
//    ShowChangePasswordForm(edtSabun.Text);
    Exit;
  end;

  if SigninResult <> srOK then
  begin
    ShowMessage('���̵� �Ǵ� ��й�ȣ�� �߸��Ǿ����ϴ�');
    edtPassword.Clear;
    edtUserId.SetFocus;
    Exit;
  end;

//  User.Signed := True;
//  User.Name := '';
//  User.Id := edtUserId.Text;

  // [�α��� ���� ����] ȯ�����Ͽ� ����
  if chkUserIdSave.Checked then
    App.Config.SavedUserId := edtUserId.Text;
  App.Config.UserIdSave := chkUserIdSave.Checked;

  Close;
end;

procedure TfrmSignIn.FormShow(Sender: TObject);
begin
  if App.Config.UserIdSave then
  begin
    edtUserId.Text := App.Config.SavedUserId;
    chkUserIdSave.Checked := True;
    edtPassword.SetFocus;
  end
  else
  begin
    edtUserId.SetFocus;
  end;
end;

end.
