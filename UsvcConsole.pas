unit UsvcConsole;

interface

uses
   Windows,winsvc;



  function ServiceStart(sMachine, sService: String) : Boolean;stdcall;
  function ServiceStop(sMachine, sService: String) : Boolean;stdcall;
  function GetStatus(ServiceName:pchar):DWORD;stdcall;//监测服务状态

implementation

//命令行(start):net start data_abstract
//命令行(stop):net stop data_abstract 
function ServiceStart(sMachine, sService: String) : Boolean;
var 
  schm,   schs: SC_Handle;
  ss: TServiceStatus; 
  psTemp: PChar; 
  dwChkP: DWord; 
begin
  ss.dwCurrentState := 0;
 schm := OpenSCManager(PChar(sMachine), nil, SC_MANAGER_CONNECT); 
  if (schm>0) then 
  begin 
   schs := OpenService(schm, PChar(sService), SERVICE_START or SERVICE_QUERY_STATUS); 
    if (schs>0) then 
   begin 
     psTemp := nil; 
      if (StartService(schs, 0, psTemp)) then 
        if (QueryServiceStatus(schs, ss)) then 
         while (SERVICE_RUNNING<>ss.dwCurrentState) do 
          begin 
           dwChkP := ss.dwCheckPoint; 
            Sleep(ss.dwWaitHint); 
           if (not QueryServiceStatus(schs, ss)) then     
            Break;
            if ss.dwCheckPoint <> 0 then  
              Break; 
          end; 
      CloseServiceHandle(schs); 
    end; 
   CloseServiceHandle(schm); 
  end; 
 Result := SERVICE_RUNNING=ss.dwCurrentState; 
end;

//
function ServiceStop(sMachine, sService: String) : Boolean; 
var   schm,   schs: SC_Handle; 
  ss: TServiceStatus; 
 dwChkP: DWord; 
begin   
schm := OpenSCManager(PChar(sMachine), nil, SC_MANAGER_CONNECT); 
 if (schm>0) then   begin 
    schs := OpenService(schm, PChar(sService), SERVICE_STOP or SERVICE_QUERY_STATUS); 
    if (schs>0) then 
    begin 
     if (ControlService(schs, SERVICE_CONTROL_STOP, ss)) then 
        if (QueryServiceStatus(schs, ss)) then 
         while (SERVICE_STOPPED<>ss.dwCurrentState) do 
         begin   
          dwChkP := ss.dwCheckPoint; 
            Sleep(ss.dwWaitHint); 
            if (not QueryServiceStatus(schs, ss)) then 
              Break; 
            if ss.dwCheckPoint <> 0 then
              Break; 
          end; 
      CloseServiceHandle(schs); 
    end; 
   CloseServiceHandle(schm); 
  end; 
  Result := SERVICE_STOPPED=ss.dwCurrentState; 
end; 

//监测服务状态
function GetStatus(ServiceName:pchar):DWORD;
var
  stateINT:integer;
  sm, sh: THandle;
  ss: TServiceStatus;
begin
  //ret := 0;
  sm := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
  if sm <> 0 then
  begin
    sh := OpenService(sm, ServiceName, SERVICE_ALL_ACCESS);
    if sh <> 0 then
    begin
      QueryServiceStatus(sh, ss);
      {
      ss.dwCurrentState 的取值有下列几种
      SERVICE_STOPPED	The service is not running.
      SERVICE_START_PENDING	The service is starting.
      SERVICE_STOP_PENDING	The service is stopping.
      SERVICE_RUNNING	The service is running.
      SERVICE_CONTINUE_PENDING	The service continue is pending.
      SERVICE_PAUSE_PENDING	The service pause is pending.
      SERVICE_PAUSED	The service is paused.
      }
      stateINT:=ss.dwCurrentState;
      //ret := 1;
      CloseServiceHandle(sh);
    end;
    CloseServiceHandle(sm);

    end;
  Result:=stateINT;
end;

end.
 