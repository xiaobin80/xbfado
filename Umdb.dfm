object frm_mdb: Tfrm_mdb
  Left = 252
  Top = 173
  BorderStyle = bsSingle
  Caption = 'ACCESS'#25968#25454#24211
  ClientHeight = 254
  ClientWidth = 544
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 544
    Height = 40
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #29983#25104'XBF'#25991#20214
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 213
    Width = 544
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btn_generate: TButton
      Left = 336
      Top = 8
      Width = 89
      Height = 25
      Caption = #29983#25104#25991#20214'(&G)'
      TabOrder = 0
      OnClick = btn_generateClick
    end
    object btn_close: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = #20851#38381'(&C)'
      TabOrder = 1
      OnClick = btn_closeClick
    end
  end
  object pnl_main: TPanel
    Left = 0
    Top = 40
    Width = 544
    Height = 173
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 265
      Height = 173
      Align = alLeft
      Caption = #25968#25454#24211#35774#32622
      TabOrder = 0
      object Label4: TLabel
        Left = 16
        Top = 24
        Width = 39
        Height = 13
        Caption = #20301#32622#65306
      end
      object edt_server: TEdit
        Left = 64
        Top = 24
        Width = 185
        Height = 21
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 265
      Top = 0
      Width = 279
      Height = 173
      Align = alClient
      Caption = #29983#25104#25991#20214#20449#24687
      TabOrder = 1
      object Label5: TLabel
        Left = 16
        Top = 24
        Width = 52
        Height = 13
        Caption = #25991#20214#21517#65306
      end
      object edt_filename: TEdit
        Left = 80
        Top = 24
        Width = 177
        Height = 21
        TabOrder = 0
      end
    end
  end
end
