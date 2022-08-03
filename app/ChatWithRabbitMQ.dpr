program ChatWithRabbitMQ;

uses
  System.StartUpCopy,
  FMX.Forms,
  view.form.main in 'view\view.form.main.pas' {viewFormMain},
  view.frame.message in 'view\view.frame.message.pas' {Frame1: TFrame},
  commons.types in 'commons\commons.types.pas',
  commons.consts in 'commons\commons.consts.pas',
  StompClient in 'libs\StompClient.pas',
  controller.interfaces in 'controller\controller.interfaces.pas',
  controller.chat in 'controller\controller.chat.pas',
  view.frame.contact in 'view\view.frame.contact.pas' {viewFrameContact: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TviewFormMain, viewFormMain);
  Application.Run;
end.
