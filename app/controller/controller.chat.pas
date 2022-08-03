unit controller.chat;

interface

uses
  sysutils, controller.interfaces, commons.types, view.frame.contact;

type
  TControllerChat = class(TInterfacedObject, iControllerChat)
  private
    { private declarations }

  public
    { public declarations }

    class function new: iControllerChat;

    function loadConversations(aStrId: string; aList: tcommonTypeList; aEventClick: tcommonTypeEventClick): iControllerChat;
  end;

implementation

{ TControllerChat }

function TControllerChat.loadConversations(aStrId: string; aList: tcommonTypeList; aEventClick: tcommonTypeEventClick): iControllerChat;
begin

  for var iIntCount := 0 to 2 do
  begin
    var iContact := TviewFrameContact.Create(aList);
    iContact.name := 'frame' + iIntCount.tostring + formatdatetime('HHmmss', now);
    iContact.TagString:= '/queue/11321';
    iContact.label1.text  := 'Contato ' + formatfloat('00', iIntCount);
    iContact.OnClick:= aEventClick;

    aList.AddObject(iContact);
  end;
end;

class function TControllerChat.new: iControllerChat;
begin
  result  := self.Create;
end;

end.
