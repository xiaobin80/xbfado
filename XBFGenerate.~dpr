library XBFGenerate;

uses
  SysUtils,
  Classes,
  StrUtils,
  Windows,
  Ugenerate in 'Ugenerate.pas' {frm_generate},
  Udefine in 'Udefine.pas',
  Umdb in 'Umdb.pas' {frm_mdb},
  UsvcConsole in 'UsvcConsole.pas';

{$R *.res}

function ReadRecord(DimRecord: Integer;filename1:WideString):WideString;stdcall;
var
  i: integer;
  pstr11,dbinfo:WideString;
begin
  FileName:=filename1;
  if RightStr(FileName,5)='0.xbf' then
  begin
    Exit;
  end;

  if FileData.section3=0 then
  begin
    dbinfo:='True';
  end
  else
  begin
    dbinfo:='False'
  end;
  CreateFile(FileName);
  FileStream.Seek(SizeOf(FileHead), soFromBeginning);
  If DimRecord = -1 Then
  Begin
    for i := 1 to (FileStream.Size-SizeOf(FileHead)) div SizeOf(FileData) do
    Begin
      FileStream.Read(FileData, SizeOf(FileData));
      //
      connectionstring1:=FileData.connectstr1+'='+FileData.dbprovider;
      if FileData.section6>=431205 then
      begin
        pstr11:=copy(FileData.Pstr5,1,1)+copy(FileData.Pstr3,1,1)+copy(FileData.Pstr4,1,1)+copy(FileData.Pstr2,1,1)+copy(FileData.Pstr1,1,1)+copy(FileData.Pstr6,1,1);
      end;
      if FileData.section2>6 then
      begin
        connectionstring2:=FileData.connectstr2+'='+pstr11+FileData.password;
      end
      else
      begin
        connectionstring2:=FileData.connectstr2+'='+pstr11;
      end;

      connectionstring3:=FileData.connectstr3+'='+dbInfo;
      connectionstring4:=FileData.connectstr4+'='+FileData.DBuser;
      connectionstring5:=FileData.connectstr5+'='+FileData.DBname;
      connectionstring6:=FileData.connectstr6+'='+FileData.DBserver;
    End;
  End
  Else
  Begin
    FileStream.Seek(SizeOf(FileData)*DimRecord, soFromCurrent);
    FileStream.Read(FileData, SizeOf(FileData));
    //
      connectionstring1:=FileData.connectstr1+'='+FileData.dbprovider;
      if FileData.section6>=431205 then
      begin
        pstr11:=copy(FileData.Pstr5,1,1)+copy(FileData.Pstr3,1,1)+copy(FileData.Pstr4,1,1)+copy(FileData.Pstr2,1,1)+copy(FileData.Pstr1,1,1)+copy(FileData.Pstr6,1,1);
      end;
      if FileData.section2>6 then
      begin
        connectionstring2:=FileData.connectstr2+'='+pstr11+FileData.password;
      end
      else
      begin
        connectionstring2:=FileData.connectstr2+'='+pstr11;
      end;
      connectionstring3:=FileData.connectstr3+'='+dbInfo;
      connectionstring4:=FileData.connectstr4+'='+FileData.DBuser;
      connectionstring5:=FileData.connectstr5+'='+FileData.DBname;
      connectionstring6:=FileData.connectstr6+'='+FileData.DBserver;
  End;

  FileStream.Free;

  Result:=connectionstring1+connectionstring2+connectionstring3
        +connectionstring4+connectionstring5+connectionstring6;

End;
//mdb connection string
function ReadRecord_mdb(DimRecord: Integer;filename1:WideString):WideString;stdcall;
var
  i: integer;
  dbinfo:WideString;
begin
  FileName:=filename1;
  if RightStr(FileName,5)='0.xbf' then
  begin
    Exit;
  end;
  if FileData.section3=0 then
  begin
    dbinfo:='True';
  end
  else
  begin
    dbinfo:='False'
  end;
  CreateFile(FileName);
  FileStream.Seek(SizeOf(FileHead), soFromBeginning);
  If DimRecord = -1 Then
  Begin
    for i := 1 to (FileStream.Size-SizeOf(FileHead)) div SizeOf(FileData) do
    Begin
      FileStream.Read(FileData, SizeOf(FileData));
      //
      connectionstring1:=FileData.connectstr1+'='+FileData.dbprovider;
      connectionstring2:=FileData.connectstr2+'='+FileData.password;
      connectionstring3:=FileData.connectstr3+'='+dbInfo;
      connectionstring4:=FileData.connectstr4+'='+FileData.DBuser;
      connectionstring5:=FileData.connectstr5+'='+FileData.DBname;
      connectionstring6:=FileData.connectstr6+'='+FileData.DBserver;
    End;
  End
  Else
  Begin
    FileStream.Seek(SizeOf(FileData)*DimRecord, soFromCurrent);
    FileStream.Read(FileData, SizeOf(FileData));
    //
      connectionstring1:=FileData.connectstr1+'='+FileData.dbprovider;
      connectionstring2:=FileData.connectstr2+'='+FileData.password;
      connectionstring3:=FileData.connectstr3+'='+dbInfo;
      connectionstring4:=FileData.connectstr4+'='+FileData.DBuser;
      connectionstring5:=FileData.connectstr5+'='+FileData.DBname;
      connectionstring6:=FileData.connectstr6+'='+FileData.DBserver;
  End;

  FileStream.Free;

  Result:=connectionstring1+connectionstring5+connectionstring3;

End;


EXPORTS
  showform  name 'show5',
  showform_mdb name 'show55',
  ReadRecord  name 'readXBF',
  ReadRecord_mdb  name 'readXBF_mdb',
  //service console function
  ServiceStart name 'svcStart',
  ServiceStop name 'svcStop',
  GetStatus name 'svcStatus';
begin
end.
 