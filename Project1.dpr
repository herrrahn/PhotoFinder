program Project1;

uses
  Forms,
  FotoFinder in 'FotoFinder.pas' {Form1},
  FotoDisplat in 'FotoDisplat.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.