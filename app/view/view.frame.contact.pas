unit view.frame.contact;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Effects, FMX.Filter.Effects, FMX.Controls.Presentation,
  FMX.Layouts;

type
  TviewFrameContact = class(TFrame)
    Layout1: TLayout;
    Label1: TLabel;
    Circle1: TCircle;
    FillRGBEffect1: TFillRGBEffect;
    Line1: TLine;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
