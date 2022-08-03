unit view.form.main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, controller.chat, system.threading;

type
  TviewFormMain = class(TForm)
    TabControl1: TTabControl;
    tabContacts: TTabItem;
    tabMessages: TTabItem;
    layConnect: TLayout;
    layChat: TLayout;
    edtConnectId: TEdit;
    btnConnect: TRectangle;
    Text1: TText;
    Layout3: TLayout;
    Text2: TText;
    Layout1: TLayout;
    rectTextSend: TRectangle;
    btnSend: TImage;
    listContacts: TVertScrollBox;
    listMessages: TVertScrollBox;
    edtTextSend: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
  private
    { Private declarations }
    fStrConnectId: string;
    fStrConversationId: string;

    fBooStop: boolean;

    procedure loadContacts;
    procedure clickContact(sender: tobject);
  public
    { Public declarations }
  end;

var
  viewFormMain: TviewFormMain;

implementation

{$R *.fmx}

procedure TviewFormMain.btnConnectClick(Sender: TObject);
begin
  if edtConnectId.Text.Trim = '' then
  begin
    showmessage('Informe o seu Id para conectar');
    exit;
  end;

  fStrConnectId  := edtConnectId.Text;


  layConnect.Visible:= false;
  layChat.visible   := true;
  TabControl1.ActiveTab := tabContacts;

  loadContacts;
end;

procedure TviewFormMain.btnSendClick(Sender: TObject);
begin
  TControllerChat.new
    .sendMessage(fStrConversationId, edtTextSend.text, listMessages);
end;

procedure TviewFormMain.clickContact(sender: tobject);
begin
  TabControl1.ActiveTab:= tabMessages;

  fBooStop  := false;

  fStrConversationId  := tframe(sender).TagString;

  TThread.CreateAnonymousThread(
  procedure
  var
    lstrMessage: string;
  begin
    while True do
    begin
      if fBooStop then
        break;
      try
        TControllerChat.new
          .loadMessage(fStrConnectId, '', listMessages);
      finally
        sleep(2000);
      end;
    end;
  end).Start;

end;

procedure TviewFormMain.FormCreate(Sender: TObject);
begin
  fStrConnectId  := '';
  fBooStop:= true;

  layConnect.Visible  := true;
  layChat.visible := false;

  TabControl1.ActiveTab := tabContacts;
end;

procedure TviewFormMain.FormDestroy(Sender: TObject);
begin
  fBooStop  := true;
end;

procedure TviewFormMain.loadContacts;
begin
  TControllerChat.new
    .loadConversations(fStrConnectId, listContacts, clickContact);
end;

end.
