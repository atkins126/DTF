object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 477
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 56
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Public\Documents\Embarcadero\Studio\21.0\Sampl' +
        'es\Data\EMPLOYEE.GDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 248
    Top = 32
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 360
    Top = 32
    object FDQuery1EMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Origin = 'EMP_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1FIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Origin = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object FDQuery1LAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Origin = 'LAST_NAME'
      Required = True
    end
    object FDQuery1PHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Origin = 'PHONE_EXT'
      Size = 4
    end
    object FDQuery1HIRE_DATE: TSQLTimeStampField
      FieldName = 'HIRE_DATE'
      Origin = 'HIRE_DATE'
      Required = True
    end
    object FDQuery1DEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Origin = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object FDQuery1JOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Origin = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object FDQuery1JOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Origin = 'JOB_GRADE'
      Required = True
    end
    object FDQuery1JOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Origin = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object FDQuery1SALARY: TFMTBCDField
      FieldName = 'SALARY'
      Origin = 'SALARY'
      Required = True
      Precision = 18
      Size = 2
    end
    object FDQuery1FULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Origin = 'FULL_NAME'
      Size = 37
    end
  end
end
