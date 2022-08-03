unit model.interfaces;

interface

uses
  Vcl.ComCtrls, commons.types;

type
  iModelChat = interface
    ['{08ADB159-B7E6-4B9A-ACE4-CE04C34B0085}']

    function loadMessage(aStrId: string; aList: tcommonTypeList; var aResult: string): iModelChat;
    function sendMessage(aStrIdConversation, aStrMessage: string; aList: tcommonTypeList): iModelChat;
  end;

implementation

end.
