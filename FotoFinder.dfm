object Form1: TForm1
  Left = 337
  Top = 204
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 65
    Width = 424
    Height = 384
    Align = alLeft
    Caption = 'GroupBox1'
    TabOrder = 0
    object ListView2: TListView
      Left = 2
      Top = 15
      Width = 420
      Height = 367
      Align = alClient
      Columns = <
        item
          Caption = 'No'
        end
        item
          Caption = 'Pasta'
          Width = 350
        end>
      Ctl3D = False
      GridLines = True
      Items.Data = {
        AC0000000200000000000000FFFFFFFFFFFFFFFF010000000000000001313143
        3A5C55736572735C52616661656C5C4465736B746F705C436173616D656E746F
        2052616661656C206520456C69616E6500000000FFFFFFFFFFFFFFFF01000000
        00000000013241433A5C55736572735C52616661656C5C4465736B746F705C43
        6173616D656E746F2052616661656C206520456C69616E655C666F746F732063
        6173616D656E746FFFFFFFFF}
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object GroupBox2: TGroupBox
    Left = 424
    Top = 65
    Width = 496
    Height = 384
    Align = alClient
    Caption = 'GroupBox2'
    TabOrder = 1
    object ListView1: TListView
      Left = 2
      Top = 15
      Width = 492
      Height = 367
      Align = alClient
      Columns = <
        item
          Caption = 'No'
        end
        item
          Caption = 'Arquivo'
          Width = 150
        end
        item
          Caption = 'Pasta'
          Width = 150
        end
        item
          Caption = 'Tamanho'
          Width = 80
        end
        item
          Caption = 'Data hora'
          Width = 80
        end>
      Ctl3D = False
      GridLines = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = ListView1DblClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 920
    Height = 65
    Align = alTop
    Caption = 'GroupBox3'
    TabOrder = 2
    object Edit1: TEdit
      Left = 8
      Top = 24
      Width = 289
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 304
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 824
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 648
    Top = 40
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    DesignConnection = True
    Port = 0
    Database = 'C:\Projekte\delphi\db.s3db'
    Protocol = 'sqlite'
    LibraryLocation = 'C:\Projekte\delphi\sqlite3.dll'
    Left = 64
    Top = 201
  end
end
