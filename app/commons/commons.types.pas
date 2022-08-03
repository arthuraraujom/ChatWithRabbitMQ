unit commons.types;

interface

uses
  FMX.Layouts, StompClient;

type
  tcommonTypeMessage = (ttpSender, ttpRecipient);

  tcommonTypeList = TVertScrollBox;
  tcommonTypeEventClick = procedure(sender: tobject) of object;
  tcommonTypeConnectionClient = IStompClient;

implementation

end.
