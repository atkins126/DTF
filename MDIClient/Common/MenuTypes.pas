unit MenuTypes;

interface
uses
  DTF.Builder.Factory, DTF.Form.MDIChild, Vcl.ComCtrls;

type
  TMenuNode = class(TTreeNode)
  private
    FCode: string;
    FParentCode: string;
    FSortIndex: Integer;
    FTest: string;
    procedure SetCode(const Value: string);
    procedure SetTest(const Value: string);
  public
    property Code: string read FCode write SetCode;
    property Test: string read FTest write SetTest;
    property SortIndex: Integer read FSortIndex write FSortIndex;
    property ParentCode: string read FParentCode write FParentCode;
  end;

  TDTFForm = TDTFMDIChildForm;
  TDTFFormClass = class of TDTFForm;

  TMenuFactory = TAbstractFactory<string, TDTFFormClass>;

implementation

{ TMenuNode }

procedure TMenuNode.SetCode(const Value: string);
begin
  FCode := Value;
end;

procedure TMenuNode.SetTest(const Value: string);
begin
  FTest := Value;
end;

initialization
finalization
  TMenuFactory.Instance.Release;

end.
