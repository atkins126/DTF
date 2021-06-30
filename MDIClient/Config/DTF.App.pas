unit DTF.App;

{
  How to use
    App.Config.UserId
    App.Logger.Log(ALog); // TLogger.Log

    App.Auth
    app.Perm

    App.Utils.Printer ??
    App.Utils.Export ??
}

interface

uses
  DTF.App.Base,
  DTF.Service.Types,
  DTF.Config, MenuService;

type
  TApp = class(TDTFApp<TApp>)
  private
    FConfigService: TConfigService;
    FMenuService: TMenuService;
    function GetConfigService: TConfigService;
    function GetConfigSvc<T: class>: T;
  protected
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  public
    property Config: TConfigService read FConfigService;
    property Menu: TMenuService read FMenuService;
//    property ConfigEx: TConfigService read GetConfigSvc<TConfigService>;
//    property Auth;
//    property View;
  end;

var
  App: TApp;

implementation

{ TApp }

procedure TApp.AfterConstruction;
begin
  inherited;

  FConfigService := TConfigService.Create;

  RegService(IDTFConfigService, TConfigService);

//  AddService()
end;

procedure TApp.BeforeDestruction;
begin
  inherited;

  FConfigService.Free;
end;

function TApp.GetConfigService: TConfigService;
begin
  Result := GetSevice<TConfigService>(IDTFConfigService);
end;

function TApp.GetConfigSvc<T>: T;
begin

end;

initialization
  App := TApp.Instance;
finalization

end.
