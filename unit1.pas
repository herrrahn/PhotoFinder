unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, sqlite3conn, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ComCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ListView1: TListView;
    ListView2: TListView;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    SQLConnector1: TSQLConnector;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
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

procedure TForm1.Button2Click(Sender: TObject);
var
  SR: TSearchRec;
  i, x: integer;
  count: integer;
begin
  SQLConnector1.Connected:= True;
  SQLTransaction1.StartTransaction;
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('delete from fotos');
  SQLQuery1.ExecSQL;
  SQLTransaction1.CommitRetaining;
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('insert into fotos (arquivo, caminho, tamanho, time) values (:arquivo, :caminho, :tamanho, :time)');
  for x:= 0 to ListView2.Items.Count -1 do
  begin
    I := FindFirst(ListView2.Items[x].SubItems[0] + '\*.jpg', faAnyFile, SR);
    count := 0;
    while I = 0 do
    begin
      inc(count);
      SQLQuery1.ParamByName('arquivo').AsString:= sr.Name;
      SQLQuery1.ParamByName('caminho').AsString:= ListView2.Items[x].SubItems[0];
      SQLQuery1.ParamByName('tamanho').AsInteger:= sr.Size;
      SQLQuery1.ParamByName('time').AsInteger:= sr.Time;
      SQLQuery1.ExecSQL;
      I := FindNext(SR);
    end;
  end;
  SQLTransaction1.CommitRetaining;
  SQLQuery1.Close;
  SQLQuery1.SQL.Clear;
  SQLQuery1.SQL.Add('select * from fotos f1 where (select count(*) from fotos f2 where f1.arquivo = f2.arquivo) > 1');
  SQLQuery1.Open;
  while not SQLQuery1.EOF do
  begin
    with ListView1.Items.add do
    begin
      Caption := SQLQuery1.FieldByName('id').AsString;
      subitems.add(SQLQuery1.FieldByName('arquivo').AsString);
      subitems.add(SQLQuery1.FieldByName('caminho').AsString);
      subitems.add(SQLQuery1.FieldByName('tamanho').AsString);
      subitems.add(SQLQuery1.FieldByName('time').AsString);
    end;
    SQLQuery1.Next;
  end;
  ShowMessage('Done');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  with ListView2.Items.Add do
  begin
    Caption:= IntToStr(ListView2.Items.Count + 1);
    SubItems.add(Edit1.Text);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if SelectDirectoryDialog1.Execute then
  begin
    Edit1.Text:= SelectDirectoryDialog1.FileName;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin

end;

procedure TForm1.ListView1DblClick(Sender: TObject);
begin
  if ListView1.Selected = nil then
    exit;
   Form2.Image1.Picture.LoadFromFile(ListView1.Selected.SubItems[1] + '\' + ListView1.Selected.SubItems[0]);
   Form2.Show;
end;

end.

