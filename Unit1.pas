unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Generics.Collections,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdUDPServer, IdBaseComponent,
  IdComponent, IdUDPBase, IdUDPClient, Vcl.StdCtrls, IdGlobal, IdSocketHandle,
  Vcl.ExtCtrls, VclTee.TeeGDIPlus, VclTee.TeEngine,
  VclTee.TeeProcs, VclTee.Chart, VclTee.Series;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Chart1: TChart;
    btnAddSerires: TButton;
    btnAddData: TButton;
    chkPointerVisible: TCheckBox;
    cmbPointerStyle: TComboBox;
    Timer1: TTimer;
    btnTimer: TButton;
    Memo1: TMemo;
    procedure btnAddSeriresClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddDataClick(Sender: TObject);
    procedure chkPointerVisibleClick(Sender: TObject);
    procedure btnTimerClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private êÈåæ }
    SeriesList: TObjectList<TChartSeries>; // VCLTee.Series
    chart_x: integer;
    chart_width: integer;
    procedure init_chart;
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// ------------------------------------------------------------------------
//
// ------------------------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
  SeriesList := TObjectList<TChartSeries>.Create;
  init_chart;
end;

// ------------------------------------------------------------------------
//
// ------------------------------------------------------------------------
procedure TForm1.FormDestroy(Sender: TObject);
begin
  Chart1.RemoveAllSeries;
  SeriesList.Clear;
end;

// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
procedure TForm1.init_chart;
begin
  chart_x := 0;
  chart_width := 120;
  for var ser: TChartSeries in SeriesList do
  begin
    ser.Clear;
  end;
end;

// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
procedure TForm1.Timer1Timer(Sender: TObject);
var
  val: double;
  ser: TChartSeries;
begin
  for var i := 0 to SeriesList.Count - 1 do
  begin
    ser := SeriesList[i];
    if i = 1 then
      val := Sin((double(chart_x mod 60) / 60) * (2 * pi)) * 50
    else
      val := Random * 100;

    ser.AddXY(i + chart_x, val);
    if ser.Count > chart_width then
      ser.Delete(0);
  end;
  inc(chart_x, 1);
end;

// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
procedure TForm1.btnTimerClick(Sender: TObject);
begin
  if Chart1.SeriesList.Count = 0 then
    btnAddSeriresClick(Sender);

  Timer1.Enabled := not Timer1.Enabled;

  btnAddSerires.Enabled := not Timer1.Enabled;
  btnAddData.Enabled := not Timer1.Enabled;
end;

// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
procedure TForm1.btnAddSeriresClick(Sender: TObject);
var
  ser: TChartSeries;
begin
  for var num := 1 to 3 do
  begin
    ser := TLineSeries.Create(nil);
    (ser as TCustomSeries).Pointer.Style := TSeriesPointerStyle(cmbPointerStyle.ItemIndex);
    (ser as TCustomSeries).Pointer.Visible := chkPointerVisible.Checked;
    Chart1.AddSeries(ser);
    {
      for var i:integer := 0 to 9 do
      begin
      ser.AddXY(i, Random * 100)
      end;
    }
    SeriesList.Add(ser)
  end;
end;

// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
procedure TForm1.btnAddDataClick(Sender: TObject);
begin
  for var ser: TChartSeries in SeriesList do
  begin
    ser.AddXY(chart_x, Random * 100);
    if ser.Count > chart_width then
    begin
      ser.Delete(0); // êÊì™ÇçÌèú
    end;
  end;
  inc(chart_x);
end;

// ------------------------------------------------------------------------
// ------------------------------------------------------------------------
procedure TForm1.chkPointerVisibleClick(Sender: TObject);
var
  ser: TChartSeries;
begin
  for ser in SeriesList do
  begin
    (ser as TCustomSeries).Pointer.Style := TSeriesPointerStyle(cmbPointerStyle.ItemIndex);
    (ser as TCustomSeries).Pointer.Visible := chkPointerVisible.Checked;
  end;
  {
    TSeriesPointerStyle
    http://www.teechart.net/docs/teechart/vclfmx/tutorials/Library/TSeriesPointerStyle.html
    psRectangle
    psCircle
    psTriangle
    psDownTriangle
    psCross
    psDiagCross
    psStar
    psNothing
    psDot
    psLeftTriangle
    psRightTriangle
    psHexagon
    ÇøÇÂÇ¡Ç∆à·Ç§ÅH
  }
end;

end.
