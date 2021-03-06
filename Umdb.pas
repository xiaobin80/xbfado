unit Umdb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Udefine, StdCtrls;

type
  Tfrm_mdb = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btn_generate: TButton;
    btn_close: TButton;
    pnl_main: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edt_server: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    edt_filename: TEdit;
    procedure btn_closeClick(Sender: TObject);
    procedure btn_generateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_mdb: Tfrm_mdb;

procedure showform_mdb(H:THandle);stdcall;
procedure CreateFile(TFileName: String);

implementation
uses
  Ugenerate;
{$R *.dfm}

procedure Tfrm_mdb.btn_closeClick(Sender: TObject);
begin
  Close;
end;


procedure CreateFile(TFileName: string);
Begin
  If Not FileExists(TFileName) Then
  Begin
    genCRCtable;
    FileStream := TFileStream.Create(TFileName, fmCreate);
    FileHead.Version := '1.0.0.3';
    FileHead.author:='xiaobin';
    FileHead.CRC32:=calCRCvalue;
    Filehead.UpdateDate := Now;
    FileStream.Write(FileHead, SizeOf(FileHead));
  End
  Else
  Begin
    FileStream := TFileStream.Create(TFileName, fmOpenReadWrite);
  End;
End;

procedure Tfrm_mdb.btn_generateClick(Sender: TObject);
begin
  //
  if edt_filename.Text<>'' then
  begin
    FileName:=edt_filename.Text+'.xbf';
  end
  else
  begin
    Exit;
  end;
  
  CreateFile(FileName);
  //
  FileData.connectstr1:='Provider';
  FileData.connectstr5:=';Data Source';
  FileData.connectstr3:=';Persist Security Info';
  FileData.section3:=1;

  //
  FileData.DBuser :='Admin';
  FileData.DBname:=edt_server.Text;
  FileData.dbprovider:='Microsoft.Jet.OLEDB.4.0';
  //FileData.dbInfo:='False';


  FileStream.Seek(0, soFromEnd);
  FileStream.Write(FileData, SizeOf(FileData));
  FileStream.Free;
end;

procedure showform_mdb(H:THandle);
begin
  Application.Handle:=H;
  try
    frm_mdb:=Tfrm_mdb.Create(Application);
    frm_mdb.Update;
    frm_mdb.ShowModal;
  finally
    frm_mdb.Free;
  end;
end;

end.
