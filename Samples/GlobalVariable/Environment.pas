unit Environment;

interface

uses
  System.IniFiles, System.Types, uIniConfig, Vcl.Forms,
  System.Rtti;

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
    FNum: Integer;
    FDtm: TDatetime;
    FWindowBounds: TRect;
  public
    constructor Create(const AName: string = ''); override;

//    [IniString('User', 'TempId')]
    property UserId: string read FUserId write FUserId;
//    [IniInteger('User', 8000)]
    property Num: Integer read FNum write FNum;
//    [IniDateTime('User', '2021-01-16 19:25:00')]
    property Dtm: TDatetime read FDtm write FDtm;
    [IniEnum('User', Ord(wsNormal))] // Ord()�� ���ټ� ������?
    property WindowState: TWindowState read FWindowState write FWindowState;

//    [IniInteger('User', 10)]
    property WindowBounds: TRect read FWindowBounds write FWindowBounds;

    property UserName: string read FUserName write FUserName;
  end;

// �������� ��� �� �׷�
var
  Env: TEnv;

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

{ TEnvObj }

constructor TEnvObj.Create(const AName: string = '');
begin
  inherited;

  FWindowBounds.Top := 100;
end;

initialization
finalization
  if Assigned(_EnvObj) then
    _EnvObj.Free;

end.
