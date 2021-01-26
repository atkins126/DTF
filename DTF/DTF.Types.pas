unit DTF.Types;

interface

uses
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

end.
