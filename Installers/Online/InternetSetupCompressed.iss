; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Just Data"
; #define MyAppVersion "1.5.1.0"
#define MyAppPublisher "Krzysztof Du�ko"
#define MyAppURL "https://github.com/KrzysztofDusko/Just-Data"
#define MyAppExeName "JustData.exe"

#define MyAppAssocName "sql files"
#define MyAppAssocExt ".sql"
#define MyAppAssocKey StringChange(MyAppAssocName, " ", "") + MyAppAssocExt

#define MyAppAssocName2 "manysql files"
#define MyAppAssocExt2 ".manysql"
#define MyAppAssocKey2 StringChange(MyAppAssocName2, " ", "") + MyAppAssocExt2

#define MyAppAssocName3 "nwqs files"
#define MyAppAssocExt3 ".nwqs"
#define MyAppAssocKey3 StringChange(MyAppAssocName3, " ", "") + MyAppAssocExt3

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppName={#MyAppName}
; AppVersion={#MyAppVersion}
AppVersion={code:GetAppVersion}
WizardStyle=modern
AppId={{6742BA9A-5384-4711-878B-00B1E0893640}
CloseApplications=force   
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=auto
DisableProgramGroupPage=auto
DefaultGroupName=Just Data
ChangesAssociations=yes
;UserInfoPage=yes
PrivilegesRequiredOverridesAllowed=dialog
; Remove the following line to run in administrative install mode (install for all users.)
PrivilegesRequired=lowest
OutputBaseFilename=JustData
SetupIconFile=..\iconNew.ico
UninstallDisplayIcon={app}\{#MyAppExeName}
Compression=lzma
SolidCompression=yes
DisableWelcomePage=no
LicenseFile=..\..\LICENSE.txt

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\7za.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall
Source: "..\..\LICENSE.txt"; DestDir: "{app}"; Flags: isreadme
Source: "..\InnoSetupLicense.txt"; DestDir: "{app}";

[Registry]
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt2}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey2}"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocExt3}\OpenWithProgids"; ValueType: string; ValueName: "{#MyAppAssocKey3}"; ValueData: ""; Flags: uninsdeletevalue

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey2}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName2}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey3}"; ValueType: string; ValueName: ""; ValueData: "{#MyAppAssocName3}"; Flags: uninsdeletekey

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey2}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey3}\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"

Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey2}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\{#MyAppAssocKey3}\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: "{#MyAppAssocKey}"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: "{#MyAppAssocKey2}"; ValueData: ""
Root: HKA; Subkey: "Software\Classes\Applications\{#MyAppExeName}\SupportedTypes"; ValueType: string; ValueName: "{#MyAppAssocKey3}"; ValueData: ""

//Root: HKA; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; ValueType: string; ValueName: "{app}\{#MyAppExeName}"; ValueData: "~ PERPROCESSSYSTEMDPIFORCEOFF HIGHDPIAWARE"


[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{tmp}\7za.exe"; Parameters: "x ""{tmp}\SetupFiles.7z"" -o""{app}"" * -r -aoa";Flags: runhidden runascurrentuser;
Filename: {app}\{#MyAppExeName}; Flags: postinstall nowait skipifsilent unchecked;

[Types]
Name: "compact"; Description: "Just Data"
Name: "full"; Description: "Just Data + NET"

[Components]
Name: "compact"; Description: "Just Data"
Name: "full"; Description: "Just Data + NET"

[UninstallDelete]
Type: filesandordirs; Name: "{app}\*.*" 

[Code]
var
  DownloadPage: TDownloadWizardPage;
  Version: string;

function OnDownloadProgress(const Url, FileName: String; const Progress, ProgressMax: Int64): Boolean;
begin
  if Progress = ProgressMax then
    Log(Format('Successfully downloaded file to {tmp}: %s', [FileName]));
  Result := True;
end;

procedure InitializeWizard;
begin
  DownloadPage := CreateDownloadPage(SetupMessage(msgWizardPreparing), SetupMessage(msgPreparingDesc), @OnDownloadProgress);
end;

function NextButtonClick(CurPageID: Integer): Boolean;
begin
  if CurPageID = wpReady then begin
    DownloadPage.Clear;
    //;If IsComponentSelected('NET')  then
    //  DownloadPage.Add('https://raw.githubusercontent.com/KrzysztofDusko/Just-Data/main/SetupFiles/SetupFiles.7z', 'SetupFiles.7z', '')
    //;else
    //  DownloadPage.Add('https://raw.githubusercontent.com/KrzysztofDusko/Just-Data/main/SetupFiles/SetupFilesWithNet.7z', 'SetupFiles.7z', '');
    if WizardSetupType(false) = 'compact' then
      DownloadPage.Add('https://raw.githubusercontent.com/KrzysztofDusko/Just-Data/main/SetupFiles/SetupFiles.7z', 'SetupFiles.7z', '')
    else
      DownloadPage.Add('https://raw.githubusercontent.com/KrzysztofDusko/Just-Data/main/SetupFiles/SetupFilesWithNet.7z', 'SetupFiles.7z', '');

    DownloadPage.Show;
    try
      try
        DownloadPage.Download;
        Result := True;
      except
        SuppressibleMsgBox(AddPeriod(GetExceptionMessage), mbCriticalError, MB_OK, IDOK);
        Result := False;
      end;
    finally
      DownloadPage.Hide;
    end;
  end else
    Result := True;
end;

function GetAppVersion(Param: string): string;
var
  WinHttpReq: Variant;
begin
  if Version = '' then
  begin
    WinHttpReq := CreateOleObject('WinHttp.WinHttpRequest.5.1');
    WinHttpReq.Open('GET', 'https://raw.githubusercontent.com/KrzysztofDusko/Just-Data/main/VERSION.txt', False);
    WinHttpReq.Send('');
    if WinHttpReq.Status <> 200 then
    begin
      Log('HTTP Error: ' + IntToStr(WinHttpReq.Status) + ' ' + WinHttpReq.StatusText);
      MsgBox('Cannot obtain version', mbError, MB_OK);
      Abort();
    end
      else
    begin
      Version := Trim(WinHttpReq.ResponseText);
      Log('Version: ' + Version);
      // you may want to validate that the value is meaningful here
    end;
  end;
  Result := Version;
end;
