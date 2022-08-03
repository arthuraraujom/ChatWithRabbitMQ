unit view.main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TForm1 = class(TForm)
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
    ListView1: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
