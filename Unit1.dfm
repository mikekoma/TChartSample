object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'tchart_sample ver001'
  ClientHeight = 411
  ClientWidth = 952
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 193
    Top = 0
    Height = 411
    ExplicitLeft = 336
    ExplicitTop = 176
    ExplicitHeight = 100
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 193
    Height = 411
    Align = alLeft
    TabOrder = 0
    object btnAddSerires: TButton
      Left = 16
      Top = 16
      Width = 153
      Height = 25
      Caption = 'btnAddSerires'
      TabOrder = 0
      OnClick = btnAddSeriresClick
    end
    object btnAddData: TButton
      Left = 16
      Top = 55
      Width = 153
      Height = 25
      Caption = 'btnAddData'
      TabOrder = 1
      OnClick = btnAddDataClick
    end
    object chkPointerVisible: TCheckBox
      Left = 16
      Top = 104
      Width = 153
      Height = 17
      Caption = 'chkPointerVisible'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = chkPointerVisibleClick
    end
    object cmbPointerStyle: TComboBox
      Left = 16
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 3
      Text = 'psCircle'
      OnSelect = chkPointerVisibleClick
      Items.Strings = (
        'psRectangle'
        'psCircle'
        'psTriangle'
        'psDownTriangle'
        'psCross'
        'psDiagCross'
        'psStar'
        'psNothing'
        'psDot'
        'psLeftTriangle'
        'psRightTriangle'
        'psHexagon')
    end
    object btnTimer: TButton
      Left = 16
      Top = 376
      Width = 153
      Height = 25
      Caption = 'btnTimer'
      TabOrder = 4
      OnClick = btnTimerClick
    end
  end
  object Chart1: TChart
    Left = 196
    Top = 0
    Width = 571
    Height = 411
    Legend.CheckBoxes = True
    Title.Text.Strings = (
      'TChart')
    View3D = False
    Align = alClient
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
  end
  object Memo1: TMemo
    Left = 767
    Top = 0
    Width = 185
    Height = 411
    Align = alRight
    Lines.Strings = (
      '3D'#12399'3D'#12503#12525#12497#12486#12451
      #12464#12521#12501#12398#20961#20363#12399'Legend'#12503#12525#12497#12486#12451)
    TabOrder = 2
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 832
    Top = 280
  end
end
