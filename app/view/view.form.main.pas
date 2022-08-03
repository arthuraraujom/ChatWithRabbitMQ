unit view.form.main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, controller.chat;

type
  TviewFormMain = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    layConnect: TLayout;
    layChat: TLayout;
    edtConnectId: TEdit;
    btnConnect: TRectangle;
    Text1: TText;
    Layout3: TLayout;
    Text2: TText;
    Layout1: TLayout;
    edtTextSend: TRectangle;
    btnSend: TImage;
    listContacts: TVertScrollBox;
    listMessages: TVertScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
  private
    { Private declarations }
    fStrConnectId: string;

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
  TabControl1.TabIndex := 0;

  loadContacts;
end;

procedure TviewFormMain.clickContact(sender: tobject);
begin
  showmessage('ok');
end;

procedure TviewFormMain.FormCreate(Sender: TObject);
begin
  fStrConnectId  := '';

  layConnect.Visible  := true;
  layChat.visible := false;

  TabControl1.TabIndex := 0;
end;

procedure TviewFormMain.loadContacts;
begin

  var iChat :=  TControllerChat.new
                  .loadConversations('', listContacts, clickContact);

end;

end.
