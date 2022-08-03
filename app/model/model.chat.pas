unit model.chat;

interface

uses
  SysUtils, model.interfaces, commons.types, StompClient, FMX.Dialogs;

type
  TModelChat = class(TInterfacedObject, iModelChat)
  private
    { private declarations }

    function getConnectionClient: tcommonTypeConnectionClient;

  public
    { public declarations }

    class function new: iModelChat;

    function loadMessage(aStrId: string; aList: tcommonTypeList; var aResult: string): iModelChat;
    function sendMessage(aStrIdConversation, aStrMessage: string; aList: tcommonTypeList): iModelChat;
  end;

implementation

{ TModelChat }

function TModelChat.getConnectionClient: tcommonTypeConnectionClient;
begin

  result := StompUtils.StompClient;

  try
    result.Connect;
  except
    on e: Exception do
    begin
      raise Exception.Create
        ('Não é possivel conectar ao servidor.');
    end;
  end;

  result  := StompUtils.StompClient
                    .SetHeartBeat(1000, 1000)
                    .SetAcceptVersion(TStompAcceptProtocol.Ver_1_1)
                    .Connect;
end;

function TModelChat.loadMessage(aStrId: string; aList: tcommonTypeList; var aResult: string): iModelChat;
begin
  aResult := '';

  var iStompClient := getConnectionClient;
  var iStompFrame := StompUtils.NewFrame();

  iStompClient.Subscribe(aStrId,
                         TAckMode.amClient
                         // ,StompUtils.Headers
                         // .Add('auto-delete', 'true')
                        );

  if iStompClient.Receive(iStompFrame, 1000) then
  begin
    aResult := iStompFrame.GetBody;
    iStompClient.Ack(iStompFrame.MessageID);
  end;

 // VerificaMensagens;

//  try
//    try
//      FStompClient := StompUtils.StompClient;
//      FStompClient.SetOnBeforeSendFrame(BeforeSendFrame);
//    except
//      on e: Exception do
//        mmoEnviada.Lines.Add('Erro ao Conectar: ' + e.Message);
//    end;
//  finally
//    mmoEnviada.Lines.Add('Conectou');
//  end;



end;

class function TModelChat.new: iModelChat;
begin
  result  := self.Create;
end;

function TModelChat.sendMessage(aStrIdConversation, aStrMessage: string; aList: tcommonTypeList): iModelChat;
begin
  var iStompClient := getConnectionClient;

  try
    try
      iStompClient.Send(aStrIdConversation, aStrMessage);
    except
      on e: Exception do
        showmessage('Erro ao enviar a mensagem: ' + e.Message);
    end;
  finally
    iStompClient.Disconnect;
  end;
end;

end.
