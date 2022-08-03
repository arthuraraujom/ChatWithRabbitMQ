unit controller.interfaces;

interface

uses
  Vcl.ComCtrls, commons.types;

type
  iControllerChat = interface
    ['{F1CBBA54-73C7-4341-B045-90C9B5156670}']

    function loadConversations(aStrId: string; aList: tcommonTypeList; aEventClick: tcommonTypeEventClick): iControllerChat;
  end;


implementation

end.
