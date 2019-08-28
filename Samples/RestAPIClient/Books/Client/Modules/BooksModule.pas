{
  M-V-VM�� ViewModel ����(MVCP�� Conroller�� ���)
   - �����͸� �޾� View���� �ʿ��� ���·� ����

  ����������Ŭ�� View���� ����

  ** �����غ�(����) ����
  VM�� DAO ���� Repository(�Ǵ� ��) �ʿ�? Ȯ�强 Ȯ��(ĳ�� ���� ��)
  �ٷ� DAO ����? ���丮�� ���� �� �����׽�Ʈ �� Mock ������ ����(TBooksMockDAO)�� �׽�Ʈ ����


  �޸����̺� �ʵ� ���� �ڵ����� �ʿ�(�׷��� UI���� �׸� �� ���ε� ����)
}

unit BooksModule;

interface

uses
  BooksRepository,
  System.SysUtils, System.Classes, IPPeerClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, REST.Response.Adapter, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Types;

type
  TImageLoadedEvent = procedure(AStream: TStream) of object;

  TdmDataAccess = class(TDataModule)
    memBookList: TFDMemTable;
    memBookDetail: TFDMemTable;
    memBookDetailBOOK_SEQ: TWideStringField;
    memBookDetailBOOK_TITLE: TWideStringField;
    memBookDetailBOOK_ISBN: TWideStringField;
    memBookDetailBOOK_AUTHOR: TWideStringField;
    memBookDetailBOOK_PRICE: TIntegerField;
    memBookDetailBOOK_LINK: TWideStringField;
    memBookDetailBOOK_DESCRIPTION: TWideStringField;
    dsBookList: TDataSource;
    procedure dsBookListDataChange(Sender: TObject; Field: TField);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
//    FBooksDAO: TBooksDAO;
    FBooksRep: IBooksRepository;

    FSelectedSeq: Integer;
    FOnImageLoaded: TImageLoadedEvent;
    procedure LoadPhoto(ASeq: Integer);

    procedure DoImageLoaded(AStream: TStream);
//    function GetBookFromDataSet: TBook;
  public
    { Public declarations }
    procedure NewData;
    procedure LoadData;
    procedure LoadDetail(ASeq: Integer);
    procedure SaveData;
    procedure DeleteData;

    property OnImageLoaded: TImageLoadedEvent read FOnImageLoaded write FOnImageLoaded;
  end;

var
  dmDataAccess: TdmDataAccess;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TdmDataAccess }

procedure TdmDataAccess.DataModuleCreate(Sender: TObject);
begin
  FBooksRep := TBooksRestRepository.Create;

  memBookDetail.Open;
end;

procedure TdmDataAccess.DeleteData;
begin
  FBooksRep.DeleteItem(FSelectedSeq);
end;

procedure TdmDataAccess.DoImageLoaded(AStream: TStream);
begin
  if Assigned(AStream) and Assigned(FOnImageLoaded) then
    FOnImageLoaded(AStream);
end;

procedure TdmDataAccess.dsBookListDataChange(Sender: TObject; Field: TField);
var
  Seq: Integer;
begin
  if memBookList.RecordCount = 0 then
    Exit;

  Seq := memBookList.FieldByName('BOOK_SEQ').AsInteger;
  LoadDetail(Seq);
end;

procedure TdmDataAccess.LoadData;
var
  DataSet: TFDDataSet;
begin
  DataSet := FBooksRep.List;
  memBookList.MergeDataSet(DataSet, dmDataSet, mmAdd);
end;

procedure TdmDataAccess.LoadPhoto(ASeq: Integer);
var
  Stream: TStream;
begin
  Stream := FBooksRep.Image(ASeq);
  DoImageLoaded(Stream);
end;

procedure TdmDataAccess.NewData;
begin
  FSelectedSeq := -1;
  memBookDetail.EmptyDataSet;
end;

procedure TdmDataAccess.LoadDetail(ASeq: Integer);
var
  DataSet: TFDDataSet;
begin
  if FSelectedSeq = ASeq then
    Exit;

  FSelectedSeq := ASeq;

  DataSet := FBooksRep.Item(ASeq);
  memBookDetail.EmptyDataSet;
  memBookDetail.MergeDataSet(DataSet, dmDataSet, mmAdd);

  LoadPhoto(ASeq);
end;

procedure TdmDataAccess.SaveData;
begin
  if FSelectedSeq = -1 then
    FBooksRep.Insert(memBookDetail)
  else
    FBooksRep.UpdateItem(FSelectedSeq, memBookDetail);
end;

end.
