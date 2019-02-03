unit FotoFinder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ZAbstractConnection, ZConnection;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    ListView1: TListView;
    ListView2: TListView;
    ZConnection1: TZConnection;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses FotoDisplat;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    Edit1.Text := ExtractFilePath(OpenDialog1.FileName);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  SR: TSearchRec;
  i, x: integer;
  count: integer;
begin
  for x:= 0 to ListView2.Items.Count -1 do
  begin
    I := FindFirst(ListView2.Items[x].SubItems[0] + '\*.jpg', faAnyFile, SR);
    count := 0;
    while I = 0 do
    begin
      inc(count);
      with ListView1.Items.add do
      begin
        Caption := IntToStr(count);
        subitems.add(sr.Name);
        subitems.add(ListView2.Items[x].SubItems[0]);
        subitems.add(FloatToStr(sr.Size));
        subitems.add(IntToStr(sr.Time));
      end;
      I := FindNext(SR);
    end;
  end;

end;

procedure TForm1.ListView1DblClick(Sender: TObject);
begin
  if ListView1.Selected = nil then
    exit;
   Form2.Image1.Picture.LoadFromFile(ListView1.Selected.SubItems[1] + '\' + ListView1.Selected.SubItems[0]);
   Form2.Show;   
end;

end.

