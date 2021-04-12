unit DTF.Types;

interface

uses
  System.Types,
  DMX.DesignPattern,    // using DevMax frameworks(https://github.com/hjfactory/DevMax)
  DTF.Form.MDIChild;

type
  TDTFForm = TDTFMDIChildForm;
  TDTFFormClass = class of TDTFForm;

  TMenuFactory = TClassFactory<string, TDTFFormClass>;

resourcestring
  // DataSet
  SDSDeleteConfirm = '������ �����͸� �����ұ��?';

implementation

//function IfThen<T>(ACond: Boolean; ATrue: T; AFalse: T): T;
//begin
//
//end;

end.
