unit view.frame.message;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, commons.types, commons.consts;

type
  TFrame1 = class(TFrame)
    rectMessage: TCalloutRectangle;
    Text1: TText;

    procedure Text1Resize(Sender: TObject);
  private
    { Private declarations }

    procedure SetMessageText(const Value: string);
    procedure SetMessageType(const Value: tcommonTypeMessage);
  public
    { Public declarations }

    property messageText: string write SetMessageText;
    property messageType: tcommonTypeMessage write SetMessageType;
  end;

implementation

{$R *.fmx}

{ TFrame1 }

procedure TFrame1.SetMessageText(const Value: string);
begin
  text1.Text  := Value;
end;

procedure TFrame1.SetMessageType(const Value: tcommonTypeMessage);
begin

  text1.TextSettings.FontColor  := CONST_COLOR_MESSAGE_TEXT;

  case Value of
    ttpSender   : rectMessage.fill.Color :=  CONST_COLOR_MESSAGE_SENDER;
    ttpRecipient: rectMessage.fill.Color :=  CONST_COLOR_MESSAGE_RECIPIENT;
  end;
end;

procedure TFrame1.Text1Resize(Sender: TObject);
begin
  self.Height := text1.Height + 10;
end;

end.
