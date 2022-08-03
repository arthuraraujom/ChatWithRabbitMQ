unit controller.chat;

interface

uses
  System.Classes, sysutils, controller.interfaces, commons.types, view.frame.contact, view.frame.message,
  model.chat, system.threading;

type
  TControllerChat = class(TInterfacedObject, iControllerChat)
  private
    { private declarations }

    procedure addMessage(aMessage: string; aType: tcommonTypeMessage; aList: tcommonTypeList);
  public
    { public declarations }

    class function new: iControllerChat;

    function loadConversations(aStrId: string; aList: tcommonTypeList; aEventClick: tcommonTypeEventClick): iControllerChat;
    function loadMessage(aStrId, aStrIdConversation: string; aList: tcommonTypeList): iControllerChat;
    function sendMessage(aStrIdConversation, aStrMessage: string; aList: tcommonTypeList): iControllerChat;
  end;

implementation

{ TControllerChat }

procedure TControllerChat.addMessage(aMessage: string; aType: tcommonTypeMessage; aList: tcommonTypeList);
begin
  var iViewMessage := TviewFrameMessage.create(aList);
  iViewMessage.name := 'frame'+Random(9).ToString+formatdatetime('yyyyMMddHHnnss', now);
  iViewMessage.messageText  := aMessage;
  iViewMessage.messageType  := aType;
  aList.AddObject(iViewMessage);
end;

function TControllerChat.loadConversations(aStrId: string; aList: tcommonTypeList; aEventClick: tcommonTypeEventClick): iControllerChat;
begin

  for var iIntCount := 0 to 3 do
  begin
    if aStrId = iIntCount.tostring  then
      continue;

    var iContact := TviewFrameContact.Create(aList);
    iContact.name := 'frame' + iIntCount.tostring + formatdatetime('HHmmss', now);
    iContact.TagString:= iIntCount.tostring;
    iContact.label1.text  := 'Contato ' + formatfloat('00', iIntCount);
    iContact.OnClick:= aEventClick;
    aList.AddObject(iContact);
  end;
end;

function TControllerChat.loadMessage(aStrId, aStrIdConversation: string; aList: tcommonTypeList): iControllerChat;
begin
  var iStrResult  := '';

  TModelChat.new
    .loadMessage(aStrId, aList, iStrResult);

  if iStrResult.trim <> '' then
  begin
    TThread.Synchronize(nil, procedure
                             begin
                               addMessage(iStrResult, ttpRecipient, aList);
                             end);
  end;
end;

class function TControllerChat.new: iControllerChat;
begin
  result  := self.Create;
end;

function TControllerChat.sendMessage(aStrIdConversation, aStrMessage: string; aList: tcommonTypeList): iControllerChat;
begin
  addMessage(aStrMessage, tcommonTypeMessage.ttpSender, aList);

  TModelChat.new
    .sendMessage(aStrIdConversation, aStrMessage, aList);
end;

end.
