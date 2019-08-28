unit BooksRepository;

interface

{
  Repository ����
   - �ʿ��� ������ ����

  BooksRepository
   - IBooksRepository���� �޼ҵ� ����
}

uses
  BooksRestApi,
  DTF.Repository, DTF.DAO, DTF.DAO.Rest,
  System.SysUtils, System.Classes,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  // �������̽� ����(�ʿ��� �޼ҵ� ����)
  IBooksRepository = interface
    // ������ �ʿ��� �޼ҵ带 �Ʒ��� ����
    function List: TFDDataSet;
    function Item(ASeq: Integer): TFDDataSet;
    function Image(ASeq: Integer): TStream;

    procedure Insert(ADataSet: TFDDataSet);
    procedure UpdateItem(ASeq: Integer; ADataSet: TFDDataSet);
    procedure DeleteItem(ASeq: Integer);
  end;

  // ������ ���� ����(������ ���񽺿� DAO �̿�)
  { TODO :
    ����¡ ������ �����͸� ���������� �޾� �����ϴ� ��� �߰� �ʿ�
    TRepository�� �޼ҵ� �߰� �� TRestRepository �� �Ѵܰ� �� �ʿ��� ������ ������ }
  TBooksRestRepository = class(TRepository, IBooksRepository)
  private
    FDao: TRestDataSetDAO; // ������ ������ DAO �̿�
  public
    { IBooksRepository }
    function List: TFDDataSet;
    function Item(ASeq: Integer): TFDDataSet;
    function Image(ASeq: Integer): TStream;

    procedure Insert(ADataSet: TFDDataSet);
    procedure UpdateItem(ASeq: Integer; ADataSet: TFDDataSet);
    procedure DeleteItem(ASeq: Integer);

    constructor Create(ADao: TRestDataSetDAO = nil);
    destructor Destroy; override;
  end;

implementation

{ TBooksRestRepository }

constructor TBooksRestRepository.Create(ADao: TRestDataSetDAO);
begin
  if Assigned(ADao) then
    FDao := ADao
  else
    FDao := TRestDataSetDAO.Create;
  FDao.BaseUrl := TBooksRestApi.BaseUrl;
end;

destructor TBooksRestRepository.Destroy;
begin
  FDao.Free;

  inherited;
end;

function TBooksRestRepository.List: TFDDataSet;
var
  Param: IDAOParam;
begin
  Param := TBooksRestApi.List;
  // API�� ���� ����(Param)�� �״�� �ѱ�� ���� �´°�? �ʹ� �Ϲ�ȭ�Ǿ� ��ƴٴ� ������ �ִ�.

  Result := FDao.Get(Param);
  //  Result := FDao.Get(FBooksApi.List.Resource, FBooksApi.List.RootElement);
end;

procedure TBooksRestRepository.UpdateItem(ASeq: Integer; ADataSet: TFDDataSet);
begin
  FDao.UpdateItem(ASeq.ToString, TBooksRestApi.Update, TBooksRestApi.DataSetToJSON(ADataSet));
end;

function TBooksRestRepository.Image(ASeq: Integer): TStream;
begin
  Result := FDao.GetStream(ASeq.ToString, TBooksRestApi.Photo);
end;

procedure TBooksRestRepository.Insert(ADataSet: TFDDataSet);
begin
  FDao.Insert(TBooksRestApi.Insert, TBooksRestApi.DataSetToJSON(ADataSet))
end;

function TBooksRestRepository.Item(ASeq: Integer): TFDDataSet;
begin
  Result := FDao.GetItem(ASeq.ToString, TBooksRestApi.Item)
end;

procedure TBooksRestRepository.DeleteItem(ASeq: Integer);
begin
  FDao.DeleteItem(ASeq.ToString, TBooksRestApi.Delete);
end;

end.
