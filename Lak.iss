; Lak Keyboard Layout — Installer
; Built with Inno Setup (https://jrsoftware.org/isinfo.php)
; To compile: open this file in Inno Setup Compiler, then Build -> Compile.
; Output: Output\Lak-installer.exe

#define LakName "Lak"
#define LakVersion "3.0"
#define LakPublisher "Pierce Lang"
#define LakURL "https://lakkeyboard.com"
#define LakKLID "A0000409"
#define LakDLL "Lak_V3.dll"
#define LakLayoutId "00d0"

[Setup]
AppId={{B5C6D7E8-9F0A-1B2C-3D4E-5F6A7B8C9D0E}}
AppName={#LakName}
AppVersion={#LakVersion}
AppPublisher={#LakPublisher}
AppPublisherURL={#LakURL}
AppSupportURL={#LakURL}
DefaultDirName={commonpf}\{#LakName}
CreateAppDir=no
DisableProgramGroupPage=yes
DisableDirPage=yes
DisableReadyPage=yes
UninstallDisplayName={#LakName} keyboard layout
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64compatible
OutputBaseFilename=Lak-installer
OutputDir=Output
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; 64-bit DLL -> 64-bit System32 (on 64-bit Windows)
Source: "downloads\amd64\Lak_V3.dll"; DestDir: "{sys}"; Flags: ignoreversion uninsrestartdelete; Check: Is64BitInstallMode
; 32-bit DLL -> SysWOW64 (for 32-bit apps running on 64-bit Windows)
Source: "downloads\wow64\Lak_V3.dll"; DestDir: "{syswow64}"; Flags: ignoreversion uninsrestartdelete; Check: Is64BitInstallMode
; 32-bit DLL -> System32 (on native 32-bit Windows)
Source: "downloads\i386\Lak_V3.dll"; DestDir: "{sys}"; Flags: ignoreversion uninsrestartdelete; Check: not Is64BitInstallMode

[Registry]
; Register Lak as an available keyboard layout
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\{#LakKLID}"; \
    ValueType: string; ValueName: "Layout File"; ValueData: "{#LakDLL}"; \
    Flags: uninsdeletekey
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\{#LakKLID}"; \
    ValueType: string; ValueName: "Layout Text"; ValueData: "{#LakName}"
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\{#LakKLID}"; \
    ValueType: string; ValueName: "Layout Id"; ValueData: "{#LakLayoutId}"
; Layout Display Name — required by Windows 11's Settings app to show the layout.
; Using a literal string here (instead of an @<dll>,-<resourceId> reference)
; so Windows doesn't need to load the DLL's string table to render the name.
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Keyboard Layouts\{#LakKLID}"; \
    ValueType: string; ValueName: "Layout Display Name"; \
    ValueData: "{#LakName}"

[Messages]
WelcomeLabel1=Welcome to the Lak Keyboard Layout Setup
WelcomeLabel2=This installer will register Lak as a Windows keyboard layout on this computer.%n%nAfter installation, add Lak in Settings -> Time & Language -> Language -> Keyboards.
FinishedLabel=Lak has been installed.%n%nTo start typing with it, open Settings -> Time & Language -> Language -> Keyboards, click your language -> Options -> Add a keyboard, and pick Lak from the list. Switch between layouts anytime with Win+Space.
