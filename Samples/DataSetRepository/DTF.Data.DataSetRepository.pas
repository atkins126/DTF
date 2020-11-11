unit DTF.Data.DataSetRepository;

interface

uses
  System.Classes, Data.DB;

{
  DataSetRepository ����
   ������ ���� �������̽���, �������� �پ��� ������(����, DB, REST ��) ���񽺿� ����
   ������ ���񽺴� �����ͼ��� �޼ҵ�(Open,, Post, Delete, ApplyUpdate ��)�� �°� ����
   ��) RestDSRepSvc�� DataSet Open �� Get ȣ��

   TDataSetRepository ������Ʈ
    1, ������ Ÿ�ӿ��� �ʵ� ������ ������ �� �־�� �Ѵ�.(VirtualDataSet)
    2, ���� �����͸� ���� ������ �� ȭ���� Ȯ���� �� �־�� �Ѵ�.
    3, ��Ÿ�ӿ����� ������ ������ �����͸� �����ؾ� �Ѵ�.
   IDataSetRepService
    1, ������ ��� ��� �������̽��� ����
    2, �پ��� �������̽��� ���
    3, �������� ������ ���� ����
    4, �� ������ ���񽺿����� DataSet �⺻ �޼ҵ�(Open,, Post, Delete, ApplyUpdate ��)�� �°� ����


  < Extension feature >
  DAORepository�� Object Oriented ����
   - LoginDaoRep
}

type
  IDataSetRepService = interface
    ['{A1C517FA-72AD-41D0-A4B6-4195D23ABB41}']
    function GetDataSet(ADataName: string): TDataSet;
    property DataSet[ADataName: string]: TDataSet read GetDataSet;
  end;

  TDataSetRepositoryManager = class(TComponent)
  end;

  TDataSetRepositoryService = class(TComponent)
  end;

  TCustomDataSetRepository = class(TComponent)
  { TODO : ������Ʈ�� ������ ������ Ÿ�ӿ��� ������ �� �־�� �� }
  { TODO : �ʵ� ������ ������ �� �־�� �Ѵ�. }
  private
    FVirtualDataSet: TDataSet;  // design-time���� �ʵ� ������ �����ϰ�, DummyData ����
    FDataName: string;
    function GetDataSet: TDataSet;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property DataName: string read FDataName write FDataName;
    property DataSet: TDataSet read GetDataSet;
  end;

implementation

{ TDataSetRepository }

constructor TCustomDataSetRepository.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TCustomDataSetRepository.Destroy;
begin

  inherited;
end;

function TCustomDataSetRepository.GetDataSet: TDataSet;
begin

end;

end.
