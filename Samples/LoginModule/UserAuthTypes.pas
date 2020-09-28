unit UserAuthTypes;

interface

uses DTF.Core.Auth;

type
  TSignInResultCode = (
    rcLoggined,           // �α��� ��
    rcNotfoundId,         // ����ڸ� ã�� �� ����
    rcInccrectPwd,        // �ùٸ��� ���� ��й�ȣ
    rcExpiredPassword     // ��ȿ�Ⱓ�� ���� ��й�ȣ
  );

  TUserSignInData = class(TInterfacedObject, ISignInData)
  private
    FId: string;
    FPassword: string;
  public
    property Id: string read FId write FId;
    property Password: string read FPassword write FPassword;
  end;

  TUserSignInResult = class(TInterfacedObject, ISignInResult)
  public
//    property Code: Integer read
  end;

function Auth: IAuth;

implementation

uses UserAuthModule;

var
  __Auth: IAuth;

function Auth: IAuth;
begin
  if not Assigned(__Auth) then
  begin
    __Auth := TDTFAuth.Create;
    __Auth.AuthService := dmUserAuth;
  end;
  Result := __Auth;
end;

initialization
finalization

end.
