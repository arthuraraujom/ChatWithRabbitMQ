program ChatWithRabbitMQ;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.main in 'view\view.main.pas' {Form1},
  view.frame.message in 'view\view.frame.message.pas' {Frame1: TFrame},
  commons.types in 'commons\commons.types.pas',
  commons.consts in 'commons\commons.consts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
