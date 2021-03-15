unit Environment;

interface

uses
  System.IniFiles, uIniConfig, Vcl.Forms;

type
  // ���ڵ带 �̿�, �ܼ� ������ ���(�ֹ߼�)
  TUserInfo = record
    UserId,
    Name: string;
  end;
  TEnv = record
    UserId: string;
    ShopCode: string;
    User: TUserInfo;
  end;

  // ��ü �̿�, ȯ������ ���� ��(������ ���)
  TEnvObj = class(TIniConfig)
  private
    FUserId: string;
    FWindowState: TWindowState;
    FUserName: string;
  public
    [IniString('User', '')]
    property UserId: string read FUserId write FUserId;
    [IniString('User', '')]
    property UserName: string read FUserName write FUserName;
    [Ini('Windows', '')]
    property WindowState: TWindowState read FWindowState write FWindowState;
  end;

// �������� ��� �� �׷�
var
  Env: TEnv;
//  UserId: string;
//  UserName: string;

// Sigleton patterun
function EnvObj: TEnvObj;

implementation

var
  _EnvObj: TEnvObj;

function EnvObj: TEnvObj;
begin
  if not Assigned(_EnvObj) then
    _EnvObj := TEnvObj.Create('Env.ini');
  Result := _EnvObj;
end;

{ TEnvObj }

initialization
finalization
  if Assigned(_EnvObj) then
    _EnvObj.Free;

end.
