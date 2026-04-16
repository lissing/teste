@echo off
chcp 65001 >nul
cls
setlocal enabledelayedexpansion

set "line1=                                    ______              ______            __
set "line2=                                   / ____/___  _____   /_  __/___  ____  / /
set "line3=                                  / /_  / __ \/ ___/    / / / __ \/ __ \/ / 
set "line4=                                 / __/ / /_/ (__  )    / / / /_/ / /_/ / /  
set "line5=                                /_/   / .___/____/    /_/  \____/\____/_/   
set "line6=                                     /_/                                    
set "line8=                                                                            .
set "line7=                                              inicializando...
echo.


for /L %%i in (1,1,7) do (
    call echo %%line%%i%%
    REM delay ~250ms (ajuste -w para mais/menos ms)
    ping 127.0.0.1 -n 1 -w 120 >nul
)

timeout /t 3 >nul
cls


set /a randomico=%random% %% 4

:: COR BASE (Amarelo)
set /a corBaseR=255
set /a corBaseG=255
set /a corBaseB=0

:: VARIAÇÃO (Amarelo → Laranja)
set /a variacaoR=0        :: mantém o vermelho no máximo
set /a variacaoG=-165     :: 255 → ~90 (fica laranja)
set /a variacaoB=0        :: mantém azul zerado


set g=[92m
set r=[91m
set red=[04m
set l=[1m
set w=[0m
set b=[94m
set m=[95m
set p=[35m
set c=[35m
set d=[96m
set u=[0m
set z=[91m
set n=[96m
set y=[40;33m
set g2=[102m
set r2=[101m
set t=[40m
set gg=[93m
set q=[90m
set gr=[32m
set o=[38;5;202m
set bb=[38;5;74m
set nn=[38;5;82m
set rr=[1;91m
set blb=[1;94m
set bn=[1;38;5;129m
set ha=[38;5;203m
set frr=[38;2;0;255;255m
set fw=[97m
set "redd=[04m" 
set ha=[38;5;203m
set "fk=[92m" 
set "xv=[91m" 
set "spar=[04m" 
set "sof=[1m" 
set "ww=[0m" 
set "bvv=[94m" 
set "op=[96m" 
set "tq=[0m" 
set "mnb=[91m"
set "zi=[96m" 
set "er=[40;33m" 
set "po=[40m" 
set "pu=[93m" 
set "cya=[96m" 
set "ggg=[90m" 
set "rp=[35m" 
set "drp=[95m" 
set "dr=[38;5;90m" 

cls


title iGust Performance Tool
cls
set "ESC="
cls

:menu

echo(
set "lines[0]=                                    .__  ________                __   
set "lines[1]=                                    |__|/  _____/ __ __  _______/  |_ 
set "lines[2]=                                    |  /   \  ___|  |  \/  ___/\   __\
set "lines[3]=                           Tool     |  \    \_\  \  |  /\___ \  |  |     2026
set "lines[4]=                                    |__|\______  /____//____  > |__|  
set "lines[5]=                                               \/           \/        



for /L %%j in (0,1,82) do (
    set /a "corR=corBaseR + (variacaoR * %%j / 82)"
    set /a "corG=corBaseG + (variacaoG * %%j / 82)"
    set /a "corB=corBaseB + (variacaoB * %%j / 82)"
    set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
    set "texto=!lines[%%i]!"
    set "textoGradiente="
    for /L %%j in (0,1,82) do (
        set "char=!texto:~%%j,1!"
        if "!char!" == " " set "char= "
        set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
    )
    echo( !textoGradiente!!ESC![0m
)


echo 	 	 %q%
echo                              Selecione o número da opção que deseja executar:
echo(
echo.
echo               %o%[ %b%1 %o%]%w% Criar Ponto de Restauração                %o%[ %b%2 %o%]%w% Otimizar Windows
echo.
echo               %o%[ %b%3 %o%]%w% Otimização de Jogos                       %o%[ %b%4 %o%]%w% Otimização de Periféricos  
echo.
echo               %o%[ %b%5 %o%]%w% Config. inicialização do Windows          %o%[ %b%6 %o%]%w% Liberar Memória Ram 
echo.                                   
echo               %o%[ %b%7 %o%]%w% Melhorar Conexão/Ping                     %o%[ %b%8 %o%]%w% Otimizar AMD%w% 
echo.
echo               %o%[ %b%9 %o%]%w% Otimizar NVIDIA                           %o%[ %b%10 %o%]%w% Fix de Erros
echo.
echo               %o%[ %b%11 %o%]%w% Debloater                                %o%[ %o%12 %o%]%o% Sair%w%
echo.
echo.
set /p opcao="Escolha uma opção:%w% "%w%


if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto menuwindows
if %opcao% equ 3 goto prioridadegames
if %opcao% equ 4 goto perifericos
if %opcao% equ 5 goto autorun
if %opcao% equ 6 goto limparram
if %opcao% equ 7 goto ping
if %opcao% equ 8 goto amd
if %opcao% equ 9 goto nvidia
if %opcao% equ 10 goto fix
if %opcao% equ 11 goto debloater
if %opcao% equ 12 goto sair

echo Opção inválida. Tente novamente.
pause
cls
goto :menu

:opcao1
cls
echo Criando ponto de Restauração...
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency /t REG_DWORD /d 0 /f >nul
powershell -Command "Checkpoint-Computer -Description 'iGust Performance Tool' -RestorePointType 'MODIFY_SETTINGS'"
echo(
echo Ponto de restauração criado com sucesso!
pause
cls
goto :menu

:ping
cls
set "ESC="
cls
echo(
set "lines[0]=                               __________.__                
set "lines[1]=                               \______   \__| ____    ____  
set "lines[2]=                                |     ___/  |/    \  / ___\ 
set "lines[3]=                                |    |   |  |   |  \/ /_/  >
set "lines[4]=                                |____|   |__|___|  /\___  / 
set "lines[5]=                                                 \//_____/  

for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.
echo                        %q%Selecione o número da opção que deseja executar:
echo.
echo        %o%[ %b%1 %o%]%w% Desativar Economia de Energia da Rede     %o%[ %b%2 %o%]%w% Otimizar TCP (Latência)
echo.
echo        %o%[ %b%3 %o%]%w% Remover limitação de Rede                 %o%[ %b%4 %o%]%w% Limpar cache de DNS
echo.
echo        %o%[ %b%5 %o%]%w% Escolher o Melhor DNS                     %o%[ %b%6 %o%]%w% Voltar ao Menu Principal
echo.

echo.
set /p opcao="Digite o número: "
cls

if "%opcao%"=="0" goto confirmar_tudo
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6

:opcao1
cls
echo Desativando Economia de Energia de Rede...
powercfg -setactive SCHEME_MIN
echo Desativado com Sucesso!
pause
cls
goto :ping

:opcao2
cls
echo Otimizando TCP (Latência)...
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global chimney=enabled
pause
cls
goto :ping

:opcao3
cls
echo Aplicando otimizações de rede e responsividade do sistema...
echo.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
/v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f
pause
cls
goto :ping

:opcao4
cls
echo Limpando cache do DNS...
ipconfig /flushdns
ipconfig /release
ipconfig /renew
echo Limpeza feita com Sucesso!
pause
cls
goto :ping

:opcao5
Echo Abrindo DNSJumper!
start "" "%~dp0DnsJumper.exe"
echo Abrindo comando...
pause
cls
goto :ping

:opcao6
cls
goto :menu
cls

:sair
Echo Saindo do programa...
echo 1
echo 2
echo 3
exit


:limparram
Echo Limpando Memória ram...
set "emptyStandbyList=%~dp0EmptyStandbyList.exe"

if not exist "%emptyStandbyList%" (
    echo [ERRO] O arquivo EmptyStandbyList.exe nao foi encontrado.
    echo Certifique-se de que ele esta na mesma pasta deste script.
    pause
    exit /b
)

echo Limpando o cache de memoria RAM...
"%emptyStandbyList%" workingsets
"%emptyStandbyList%" modifiedpagelist
"%emptyStandbyList%" standbylist
echo Memoria RAM otimizada com sucesso!

pause
cls
goto :menu



:menuwindows
cls
set "ESC="
cls
echo(
set "lines[0]=                      __      __.__            .___                   
set "lines[1]=                     /  \    /  \__| ____    __| _/______  _  ________
set "lines[2]=                     \   \/\/   /  |/    \  / __ |/  _ \ \/ \/ /  ___/
set "lines[3]=                      \        /|  |   |  \/ /_/ (  <_> )     /\___ \ 
set "lines[4]=                       \__/\  / |__|___|  /\____ |\____/ \/\_//____  >
set "lines[5]=                            \/          \/      \/                 \/ 



for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                            %o%Escolha%w% a %o%opção%w% que você quer %o%otimizar:%w%
echo.
echo.
echo        %o%[ %b%1 %o%]%w% Otimizar Energia                        %o%[ %b%2 %o%]%w% Desat. Efeitos Visuais
echo.
echo        %o%[ %b%3 %o%]%w% Tweaks de Privacidade                   %o%[ %b%4 %o%]%w% Desat. tarefas e serviços de Telemetria
echo.
echo        %o%[ %b%5 %o%]%w% Desative TOTALMENTE a XBOX              %o%[ %b%6 %o%]%w% Desativar Relatórios de Erro
echo.
echo        %o%[ %b%7 %o%]%w% Otimizar ALT +TAB                       %o%[ %b%8 %o%]%w% Desative Serviços Inúteis
echo.
echo        %o%[ %b%9 %o%]%w% Desat. Hibernação                       %o%[ %b%10 %o%]%w% Otimizar Explorer
echo.
echo        %o%[ %b%11 %o%]%w% Desat. Indexação de pesquisa           %o%[ %b%12 %o%]%w% Ativar God Mode
echo.
echo        %o%[ %b%13 %o%]%w% Desativar Notificações                 %o%[ %b%14 %o%]%w% Desativar Cortana
echo.   
echo        %o%[ %b%15 %o%]%w% Bloquear Envio de feedback automático  %o%[ %b%16 %o%]%w% Desativar SmartScreen
echo.      
echo        %o%[ %b%17 %o%]%w% Desativar Overlays (Xbox)              %o%[ %b%18 %o%]%w% Resetar Cache de Miniaturas 
echo.
echo        %o%[ %b%19 %o%]%w% Desat. Prefetch e Superfetch           %o%[ %b%20 %o%]%w% Fechar Explorer
echo.
echo        %o%[ %b%21 %o%]%w% Iniciar Explorer                       %o%[ %b%22 %o%]%w% Desat. UAC
echo.
echo        %o%[ %b%23 %o%]%w% Desativar Hyper-V (Maquina Virtual)    %o%[ %b%24 %o%]%w% Verificar/Arrumar arquivos
echo.
echo        %o%[ %b%25 %o%]%w% Limpar Cache de Rede                   %o%[ %b%26 %o%]%w% Limpar Cache do Windows
echo.
echo        %o%[ %b%27 %o%]%w% Desat. Anti-Malware                    %o%[ %b%28 %o%]%w% Desat. Download Maps Manager
echo.
echo        %o%[ %b%29 %o%]%w% Desat. TimeStamp                       %o%[ %b%30 %o%]%w% Desativar Bing Search%w%             
echo.
echo        %o%[ %b%31 %o%]%w% Desat. Serviço de Relógio do Win.      %o%[ %b%32 %o%]%w% Desat. Sugestões de pesquisa%w%
echo.
echo        %o%[ %b%33 %o%]%w% Desat. Animações no Sistema            %o%[ %b%34 %o%]%w% Forçar Windows a priorizar Jogos%w%             
echo.
echo        %o%[ %b%35 %o%]%w% Desat. Memory Compression              %o%[ %b%36 %o%]%w% Desat. Atualizações Auto. da Microsfot Store
echo.
echo        %o%[ %b%37 %o%]%w% REINICIAR PC%w%                           %o%[ %b%38 %o%]%w% Menu Principal%w%           
echo.
 
echo.
set /p opcao="Digite o número: "
cls

if "%opcao%"=="0" goto confirmar_tudo
if %opcao% equ 38 goto menu
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto opcao7
if %opcao% equ 8 goto desatservicos
if %opcao% equ 9 goto opcao9
if %opcao% equ 10 goto opcao10
if %opcao% equ 11 goto opcao11
if %opcao% equ 12 goto opcao12
if %opcao% equ 13 goto opcao13
if %opcao% equ 14 goto opcao14
if %opcao% equ 15 goto opcao15
if %opcao% equ 16 goto opcao16
if %opcao% equ 17 goto opcao17
if %opcao% equ 18 goto opcao18
if %opcao% equ 19 goto opcao19
if %opcao% equ 20 goto opcao20
if %opcao% equ 21 goto opcao21
if %opcao% equ 22 goto opcao22
if %opcao% equ 23 goto opcao23
if %opcao% equ 24 goto opcao24
if %opcao% equ 25 goto opcao25
if %opcao% equ 26 goto opcao26
if %opcao% equ 27 goto opcao27
if %opcao% equ 28 goto opcao28
if %opcao% equ 29 goto opcao29
if %opcao% equ 30 goto opcao30
if %opcao% equ 31 goto opcao31
if %opcao% equ 32 goto opcao32
if %opcao% equ 33 goto opcao33
if %opcao% equ 34 goto opcao34
if %opcao% equ 35 goto opcao35
if %opcao% equ 36 goto opcao36
if %opcao% equ 37 goto opcao37
if %opcao% equ 38 goto opcao38

goto :menuwindows

:opcao1
cls
echo Otimizando Energia...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg.exe /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IdleDisable 0
powercfg.exe /setactive SCHEME_CURRENT
powercfg.cpl
pause
cls
goto :menuwindows

:opcao2
cls
echo Desativar Efeitos Visuais...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f
reg add "HKCU\Control Panel\Desktop" /v VisualFXSetting /t REG_DWORD /d 2 /f
pause
cls
goto :menuwindows

:opcao3
cls
echo Aplicando Tweaks de Privacidade...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v PeriodInNanoSeconds /t REG_QWORD /d 0 /f
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable >nul 2>&1
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable >nul 2>&1
sc config DiagTrack start= disabled
sc stop DiagTrack
sc config dmwappushservice start= disabled
sc stop dmwappushservice
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338387Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353694Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353696Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_Recommendations /t REG_DWORD /d 0 /f

Echo Otimização de Tweaks de Privacidade feita com sucesso!
pause
cls
goto:menuwindows

:opcao4
cls
echo Otimizando privacidade de tarefas e serviços de Telemetria...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowAppDataCollection" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisableWindowsAdvertising" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableMicrosoftConsumerExperience" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d 1 /f
Echo Telemetria e configurações de privacidade desativadas com sucesso!
pause
cls
goto :menuwindows

:opcao5
cls
echo ===========================================
echo        MENU DE OTIMIZACAO DO PC
echo ===========================================
echo.
echo [1] Iniciar Otimizacao (Remover Xbox)
echo [2] Reverter Otimizacao (Restaurar Xbox)
echo %op%[3] Voltar ao Menu Principal%w%
echo.
set /p escolha=Digite a opcao desejada: 
cls
if "%escolha%"=="1" goto OTIMIZAR
if "%escolha%"=="2" goto REVERTER
if "%escolha%"=="3" goto :menuwindows
goto :opcao5

:OTIMIZAR
cls
echo Iniciando otimizacao...

sc stop "Xbox Game Monitoring"
sc config "Xbox Game Monitoring" start= disabled
sc stop "GamingServices"
sc config "GamingServices" start= disabled
sc stop "GamingServicesNet"
sc config "GamingServicesNet" start= disabled
powershell -command "Get-AppxPackage *xboxapp* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *xboxgamemode* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage"
powershell -command "Get-AppxPackage *Microsoft.GamingServices* | Remove-AppxPackage"
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowAppDataCollection" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisableWindowsAdvertising" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableMicrosoftConsumerExperience" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d 1 /f
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
sc stop wuauserv
sc config wuauserv start= disabled
sc stop dosvc
sc config dosvc start= disabled
echo.
echo Otimizacao concluida!
pause
goto REINICIAR

:REVERTER
cls
echo Revertendo otimizacoes...

sc config "Xbox Game Monitoring" start= demand
sc config "GamingServices" start= demand
sc config "GamingServicesNet" start= demand
sc config "XblAuthManager" start= demand
sc config "XboxNetApiSvc" start= demand
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameBar" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowAppDataCollection" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /f
sc config DiagTrack start= auto
sc start DiagTrack
sc config dmwappushservice start= demand
sc config wuauserv start= auto
sc start wuauserv
sc config dosvc start= demand
echo.
echo Reversao concluida!
pause
goto REINICIAR

:REINICIAR
cls
echo.
echo Deseja reiniciar o computador agora para aplicar as alteracoes? (S/N)
set /p resp=

if /i "%resp%"=="S" (
    echo Reiniciando...
    shutdown /r /t 5
) else (
    echo Nao reiniciado. Volte para o menu principal.
    pause
    goto :menuwindows
)

pause
cls
goto :menuwindows

:opcao6
cls
echo Desativando Relatórios de erro do windows...
sc stop "WerSvc"
sc config "WerSvc" start= disabled
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ErrorReporting" /v "DontSendAdditionalData" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ErrorReporting" /v "Disabled" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DisableWindowsErrorReporting" /t REG_DWORD /d 1 /f
Echo Relatórios de Erros do Windows desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao7
cls
echo ====================================
echo        OPCOES ALT + TAB
echo ====================================
echo.
echo 1 - Otimizar ALT + TAB
echo 2 - Reverter ALT + TAB
echo %op%3 - Voltar para o menu principal%w%
echo.
set /p escolhaAltTab=Digite a opcao desejada: 
cls
if "%escolhaAltTab%"=="1" goto :otimizarAltTab
if "%escolhaAltTab%"=="2" goto :reverterAltTab
if "%escolhaAltTab%"=="3" goto :menuwindows
goto :opcao7

:otimizarAltTab
cls
echo Otimizando ALT + TAB...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v AltTabSettings /t REG_DWORD /D 1 /f
echo Reiniciando Windows Explorer...
taskkill /f /im explorer.exe >nul
timeout /t 2 /nobreak >nul
start explorer.exe
echo ALT + TAB otimizado com sucesso!
pause
goto :opcao7

:reverterAltTab
cls
echo Revertendo ALT + TAB para o padrao...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v AltTabSettings /f
echo Reiniciando Windows Explorer...
taskkill /f /im explorer.exe >nul
timeout /t 2 /nobreak >nul
start explorer.exe
echo ALT + TAB revertido com sucesso!
pause
goto :opcao7


:desatservicos
cls
echo =============================================
echo        OTIMIZADOR DE SERVIÇOS WINDOWS
echo =============================================
echo.
echo  [1] Desativar Serviços
echo  [2] Reverter Otimização
echo  %o%[3] Voltar ao Menu Principal%w%
echo.
set /p opcao=Digite a opcao desejada: 
cls

if "%opcao%"=="1" goto OTIMIZAR
if "%opcao%"=="2" goto REVERTER
if "%opcao%"=="3" goto :menuwindows

goto :desatservicos

:OTIMIZAR
echo Iniciando Otimização...
sc stop Spooler
sc config Spooler start= disabled
sc stop wisvc
sc config wisvc start= disabled
sc stop WerSvc
sc config WerSvc start= disabled
sc stop WbioSrvc
sc config WbioSrvc start= disabled
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
sc stop wuauserv
sc config wuauserv start= disabled
sc stop dosvc
sc config dosvc start= disabled
sc stop "SysMain"
sc config "SysMain" start= disabled
sc stop "WSearch"
sc config "WSearch" start= disabled
echo.
echo Otimizacao concluida!
pause
goto :desatservicos

:REVERTER
echo Revertendo Otimizacao...
sc config Spooler start= auto
sc start Spooler
sc config wisvc start= demand
sc config WerSvc start= demand
sc start WerSvc
sc config WbioSrvc start= demand
sc start WbioSrvc
sc config DiagTrack start= demand
sc start DiagTrack
sc config dmwappushservice start= demand
sc start dmwappushservice
sc config wuauserv start= auto
sc start wuauserv
sc config dosvc start= demand
sc start dosvc
sc start SysMain
sc config SysMain start= auto
sc start "WSearch"
sc config WSearch start= auto
echo.
echo Reversao concluida!
pause
goto :desatservicos

:opcao9
cls
echo Desativando Hibernação...
powercfg -h off
pause
cls
goto :menuwindows

:opcao10
echo Otimizando o Windows Explorer...
echo Desativando o Acesso Rápido
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackDocs /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v JumpListItems_Maximum /t REG_DWORD /d 0 /f

echo Limpando o histórico do Explorer
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f

echo Desativando itens recentes no Acesso Rápido
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f

echo Reiniciando Explorer para aplicar as mudanças
taskkill /f /im explorer.exe
start explorer.exe

echo Otimizacao do Explorer concluida!
pause
goto :menuwindows

:opcao11
cls
echo Desativando Indxação de Arquivos...
net stop "Windows Search" >nul 2>&1
sc config "WSearch" start= disabled >nul 2>&1
pause
cls
goto :menuwindows


:opcao12
cls
echo Criando pasta God Mode...
mkdir "%USERPROFILE%\Desktop\GodMode.{ED7BA470-8E54-465E-825C-99712043E01C}"
echo God Mode criado na Area de Trabalho!
pause
cls
goto :menuwindows

:opcao13
cls
echo Desativando Notificações do Sistema...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f
pause
cls
goto :menuwindows

:opcao14
cls
echo Desativando Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
echo Cortana Desativada!
pause
cls
goto :menuwindows

:opcao15
cls
echo Bloqueando Envio de feedback Automático
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v PeriodInDays /t REG_DWORD /d 0 /f
echo Bloqueado com Sucesso!
pause
cls
goto :menuwindows

:opcao16
cls
echo Desativando SmartScreen
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Off /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v ScanWithAntiVirus /t REG_DWORD /d 1 /f
echo SmartScreen Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao17
cls
echo ============================================
echo         OTIMIZAR OU REVERTER OVERLAYS
echo ============================================
echo.
echo 1 - Desativar Overlays (Game Bar e Game Mode)
echo 2 - Reverter Overlays ao Padrão
echo %op%3 - Voltar ao Menu Principal%w%
echo.
set /p escolha_overlay="Escolha uma opcao: "
cls

if "%escolha_overlay%"=="1" goto desativar_overlay
if "%escolha_overlay%"=="2" goto reverter_overlay
if "%escolha_overlay%"=="3" goto :menuwindows

:desativar_overlay
cls
echo Desativando Overlays...
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d 0 /f
echo Overlays desativados com sucesso!
pause
cls
goto :menu

:reverter_overlay
cls
echo Reativando Overlays...
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d 1 /f
echo Overlays reativados com sucesso!
pause
cls
goto :menuwindows


:opcao18
cls
Echo Resetando Cache de miniaturas...
taskkill /f /im explorer.exe
echo Reiniciando Windows Explorer...
del /f /s /q %LocalAppData%\Microsoft\Windows\Explorer\iconcache*
del /f /s /q %LocalAppData%\Microsoft\Windows\Explorer\thumbcache*
start explorer.exe
echo Concluido!
pause
cls
goto :menuwindows

:opcao19
cls
echo Desativando Prefetch e Superfetch (Sysman)...
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
echo  Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao20
cls
Echo Fechando Windows Explorer...
taskkill /f /im explorer.exe
echo Concluido!
pause
cls
goto :menuwindows

:opcao21
cls
echo Iniciando Windows Explorer...
start explorer.exe
echo Concluido!
pause
cls
goto :menuwindows

:opcao22
cls
echo Desativando UAC...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao23
cls
echo Desativando Hyper-V...
dism /Online /Disable-Feature:Microsoft-Hyper-V-All /NoRestart
bcdedit /set hypervisorlaunchtype off
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao24
cls
echo Arrumando Windows/Verificando arquivos...
sfc /scannow
dism /online /cleanup-image /restorehealth
chkdsk C: /F /R
Echo Windows Arrumado com Sucesso!
pause
cls
goto :menuwindows

:opcao25
cls
echo Limpando Cache de rede...
ipconfig /release
ipconfig /renew
ipconfig /flushdns
nbtstat -R
nbtstat -RR
arp -d *
netsh winsock reset
netsh int ip reset
Echo Cache Limpo com Sucesso!
pause
cls
goto :menuwindows


:opcao26
cls
echo Limpando arquivos temporários do Windows...
set "windows=%windir%"
set "systemdrive=%systemdrive%"
set "userprofile=%userprofile%"
set "temp=%temp%"
set "history=%userprofile%\Local Settings\History"
set "cookies=%userprofile%\Cookies"
set "recent=%userprofile%\Recent"
set "printers=%systemroot%\system32\spool\printers"

if exist "%windows%\temp\" del /s /f /q "%windows%\temp\*.*" 2>nul
if exist "%windows%\Prefetch\" del /s /f /q "%windows%\Prefetch\*.exe" 2>nul
if exist "%windows%\Prefetch\" del /s /f /q "%windows%\Prefetch\*.dll" 2>nul
if exist "%windows%\Prefetch\" del /s /f /q "%windows%\Prefetch\*.pf" 2>nul
if exist "%windows%\system32\dllcache\" del /s /f /q "%windows%\system32\dllcache\*.*" 2>nul
if exist "%systemdrive%\Temp\" del /s /f /q "%systemdrive%\Temp\*.*" 2>nul
if exist "%temp%\" del /s /f /q "%temp%\*.*" 2>nul
if exist "%history%\" del /s /f /q "%history%\*.*" 2>nul
if exist "%userprofile%\Local Settings\Temporary Internet Files\" del /s /f /q "%userprofile%\Local Settings\Temporary Internet Files\*.*" 2>nul
if exist "%userprofile%\Local Settings\Temp\" del /s /f /q "%userprofile%\Local Settings\Temp\*.*" 2>nul
if exist "%recent%\" del /s /f /q "%recent%\*.*" 2>nul
if exist "%cookies%\" del /s /f /q "%cookies%\*.*" 2>nul

echo Limpando registros de eventos...
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin

for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")

goto afterClear

:do_clear
echo Limpando %1...
wevtutil.exe cl %1
goto :eof

:noAdmin
echo [ERRO]: Execute este script como administrador.
pause
exit /b

:afterClear
cleanmgr.exe
echo Bomba limpada com sucesso!
pause
cls
goto :menuwindows

:opcao27
cls
echo Desativando Windows Defender (Incluindo Anti-Malware Executables)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdboot" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdfilter" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wdnisdrv" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mssecflt" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting" /v DisableEnhancedNotifications /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoToastApplicationNotification /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoToastApplicationNotificationOnLockScreen /t REG_DWORD /d 1 /f
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao28
cls
echo Desativando Download Maps Manager...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MapsBroker" /v Start /t REG_DWORD /d 4 /f
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao29
cls
echo Desativando TimeStamp...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 1 /f
Echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao30
cls
echo Desativando Bing Search...
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaEnabled /t REG_DWORD /d 0 /f

echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao31
cls
echo Desativando Serviço de Relógio do Windows...
sc stop "W32Time"
sc config "W32Time" start= disabled

echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao32
cls
echo Desativando Sugestões de Pesquisa
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchHistoryEnabled /t REG_DWORD /d 0 /f

echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao33
cls
echo Desativando Animações no Sistema...
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 90 12 03 80 /f

echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao34
cls
echo Forçando o Windows a priorizar Tarefas de Jogos...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
/v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
/v SystemResponsiveness /t REG_DWORD /d 10 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
/v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
/v "Priority" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
/v "Scheduling Category" /t REG_SZ /d "High" /f


echo Otimização feita com Sucesso!
pause
cls
goto :menuwindows

:opcao35
cls
echo Desativando Compressão de Memória...
powershell -Command "Disable-MMAgent -MemoryCompression"

echo Desativado com Sucesso!
pause
cls
goto :menuwindows

:opcao36
cls
echo Desativando atualizações automáticas da Loja do Windows...
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v AutoDownload /t REG_DWORD /d 2 /f

echo Desativado com Sucesso!
pause
cls
goto :menuwindows


:opcao37
cls
echo Reiniciar pc...
echo Deseja reiniciar o PC agora?
echo.
echo [1] Sim
echo [2] Nao
echo.
set /p resposta=Digite o numero da opcao: 

if "%resposta%"=="1" (
    echo Reiniciando o PC...
    shutdown /r /t 5
) else (
    echo Reinicio cancelado.
)

pause
cls
goto :menuwindows

:opcao38
cls
goto :menu
cls


:prioridadegames
cls
set "ESC="
cls
echo(
set "lines[0]=                        ________                              
set "lines[1]=                       /  _____/_____    _____   ____   ______
set "lines[2]=                      /   \  ___\__  \  /     \_/ __ \ /  ___/
set "lines[3]=                      \    \_\  \/ __ \|  Y Y  \  ___/ \___ \ 
set "lines[4]=                       \______  (____  /__|_|  /\___  >____  >
set "lines[5]=                              \/     \/      \/     \/     \/ 

for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                         %q%Escolha o %o%jogo%q% que voce quer %o%priorizar%w%:
echo.
echo          %o%[ %b%1 %o%]%w% Fortnite                                  %o%[ %b%2 %o%]%w% Gta V
echo.
echo          %o%[ %b%3 %o%]%w% FiveM                                     %o%[ %b%4 %o%]%w% CS2
echo.
echo          %o%[ %b%5 %o%]%w% Minecraft                                 %o%[ %b%6 %o%]%w% Valorant
echo.
echo          %o%[ %b%7 %o%]%w% League of Legends                         %o%[ %b%8 %o%]%w% Warzone
echo.
echo          %o%[ %b%9 %o%]%w% Apex Legends                              %o%[ %b%10 %o%]%w% Roblox
echo.
echo          %o%[ %b%11 %o%]%w% God Of War (2018 e ragnarok)             %o%[ %b%12 %o%]%w% MTA 
echo.
echo          %o%[ %b%13 %o%]%w% Euro Truck Simulator (1 e 2)             %o%[ %b%14 %o%]%w% Tom Clancy's Rainbow Six Siege
echo.   
echo          %o%[ %b%15 %o%]%w% Cult of the Lamb                         %o%[ %b%16 %o%]%w% ULTRAKILL
echo.      
echo          %o%[ %b%17 %o%]%w% Blood Strike                             %o%[ %b%18 %o%]%w% Arena Breakout
echo.    
echo          %o%[ %b%19 %o%]%w% Resident Evil 4 Remake                   %o%[ %b%20 %o%]%w% Resident Evil 2 Remake
echo.    
echo          %o%[ %b%21 %o%]%w% Resident Evil Village                    %o%[ %b%22 %o%]%w% Free Fire + Bluestacks
echo.    
echo          %o%[ %b%23 %o%]%w% Battlefield 2042                         %o%[ %b%24 %o%]%w% Battlefield 4
echo.    
echo          %o%[ %b%25 %o%]%w% The last Of US 1 e 2                     %o%[ %b%26 %o%]%w% PUBG
echo.
echo          %o%[ %b%27 %o%]%w% Rocket League                            %o%[ %b%28 %o%]%w% Cyberpunk 2077
echo.
echo          %o%[ %b%29 %o%]%w% Terraria                                 %o%[ %b%30 %o%]%w% Red Dead Redemption 2
echo.
echo          %o%[ %b%31 %o%]%w% Battlefield 6                            %o%[ %b%32 %o%]%w% Choo Choo Charles
echo.
echo          %o%[ %b%33 %o%]%w% Hell Let Loose                           %o%[ %b%34 %o%]%w% Farming Simulator 22
echo.
echo          %o%[ %b%35 %o%]%w% Farming Simulator 25                     %o%[ %b%36 %o%]%w% Hollow Knight
echo.
echo          %o%[ %b%37 %o%]%w% Genshin Impact                           %o%[ %b%38 %o%]%w% Point Blank
echo.
echo          %o%[ %b%39 %o%]%w% My Summer Car                            %o%[ %b%40 %o%]%w% DayZ
echo.
echo          %o%[ %b%41 %o%]%w% Street Fighter 6                         %o%[ %b%42 %o%]%w% Rust
echo.
echo          %o%[ %b%43 %o%]%w% Throne And Liberty                       %o%[ %b%44 %o%]%w% Hitman World Of Assassination
echo.
echo          %o%[ %b%45 %o%]%w% Dead By Daylight                         %o%[ %b%46 %o%]%w% Path Of Exile 1 e 2
echo.
echo          %o%[ %b%47 %o%]%w% Star Citizen                             %o%[ %b%48 %o%]%w% Cuphead
echo.
echo          %o%[ %b%49 %o%]%w% The Isle                                 %o%[ %b%50 %o%]%w% Brawlhalla
echo.
echo          %o%[ %b%51 %o%]%w% Asseto Corsa                             %o%[ %b%52 %o%]%w% Marvel Rivals
echo.
echo          %o%[ %b%53 %o%]%w% Rust                                     %o%[ %b%54 %o%]%w% BeamNG.Drive
echo.
echo          %o%[ %b%55 %o%]%w% Overwatch 2                              %o%[ %b%56 %o%]%w% Project Zomboid
echo.
echo          %o%[ %b%57 %o%]%w% Identity V                               %o%[ %b%58 %o%]%w% Stumble Guys
echo.
echo          %o%[ %b%59 %o%]%w% PayDay 2                                 %o%[ %b%60 %o%]%w% Warthunder
echo.
echo          %o%[ %b%61 %o%]%w% EA FC 26                                 %o%[ %b%62 %o%]%w% Call Of Duty: Black Ops 2,3,4,5,6 e 7
echo.
echo          %o%[ %b%63 %o%]%w% Arma Reforger                            %o%[ %b%64 %o%]%w% Skate 4
echo.
echo          %o%[ %b%65 %o%]%w% Chivarly 2                               %o%[ %o%66 %o%]%o% Entre no Discord e sugira jogos!%w%
echo.
echo          %o%[ %o%67 %o%]%o% Voltar ao Menu Principal%w%                 %o%[ %o%68 %o%]%o% REVERTA AO PADRÃO DO WINDOWS%w% 
echo.
set /p jogo="Digite o numero: "
cls
if "%jogo%"=="1" goto priorizar_fortnite
if "%jogo%"=="2" goto priorizar_gtav
if "%jogo%"=="3" goto priorizar_fivem
if "%jogo%"=="4" goto priorizar_cs2
if "%jogo%"=="5" goto priorizar_minecraft
if "%jogo%"=="6" goto priorizar_valorant
if "%jogo%"=="7" goto priorizar_lol
if "%jogo%"=="8" goto priorizar_warzone
if "%jogo%"=="9" goto priorizar_apex
if "%jogo%"=="10" goto priorizar_roblox
if "%jogo%"=="11" goto priorizar_gow
if "%jogo%"=="12" goto priorizar_mta
if "%jogo%"=="13" goto priorizar_ets
if "%jogo%"=="14" goto priorizar_r6
if "%jogo%"=="15" goto priorizar_cult
if "%jogo%"=="16" goto priorizar_ultrakill
if "%jogo%"=="17" goto priorizar_bloodstrike
if "%jogo%"=="18" goto priorizar_arenabreakout
if "%jogo%"=="19" goto priorizar_residentevil4remake
if "%jogo%"=="20" goto priorizar_residentevil2remake
if "%jogo%"=="21" goto priorizar_residentevilvillage
if "%jogo%"=="22" goto priorizar_freefire
if "%jogo%"=="23" goto priorizar_battlefield2042
if "%jogo%"=="24" goto priorizar_battlefield4
if "%jogo%"=="25" goto priorizar_tlol
if "%jogo%"=="26" goto priorizar_pubg
if "%jogo%"=="27" goto priorizar_rocketleague
if "%jogo%"=="28" goto priorizar_cyberpunk
if "%jogo%"=="29" goto priorizar_terraria
if "%jogo%"=="30" goto priorizar_rdr2
if "%jogo%"=="31" goto priorizar_battlefield6
if "%jogo%"=="32" goto priorizar_choochoo
if "%jogo%"=="33" goto priorizar_hll
if "%jogo%"=="34" goto priorizar_fs22
if "%jogo%"=="35" goto priorizar_fs25
if "%jogo%"=="36" goto priorizar_hollowknight
if "%jogo%"=="37" goto priorizar_genshin
if "%jogo%"=="38" goto priorizar_pointblank
if "%jogo%"=="39" goto priorizar_mysummercar
if "%jogo%"=="40" goto priorizar_dayz
if "%jogo%"=="41" goto priorizar_sf6
if "%jogo%"=="42" goto priorizar_rust
if "%jogo%"=="43" goto priorizar_throne
if "%jogo%"=="44" goto priorizar_hitman
if "%jogo%"=="45" goto priorizar_deadbydaylight
if "%jogo%"=="46" goto priorizar_pathofexile
if "%jogo%"=="47" goto priorizar_starcitizen
if "%jogo%"=="48" goto priorizar_cuphead
if "%jogo%"=="49" goto priorizar_theisle
if "%jogo%"=="50" goto priorizar_brawlhalla
if "%jogo%"=="51" goto priorizar_assetocorsa
if "%jogo%"=="52" goto priorizar_marvelrivals
if "%jogo%"=="53" goto priorizar_rust
if "%jogo%"=="54" goto priorizar_beamng
if "%jogo%"=="55" goto priorizar_overwatch2
if "%jogo%"=="56" goto priorizar_projectzomboid
if "%jogo%"=="57" goto priorizar_identityv
if "%jogo%"=="58" goto priorizar_stumbleguys
if "%jogo%"=="59" goto priorizar_payday2
if "%jogo%"=="60" goto priorizar_warthunder
if "%jogo%"=="61" goto priorizar_eafc26
if "%jogo%"=="62" goto priorizar_callofduty
if "%jogo%"=="63" goto priorizar_armareforger
if "%jogo%"=="64" goto priorizar_skate4
if "%jogo%"=="65" goto priorizar_chivarly2
if "%jogo%"=="66" start https://discord.gg/UufDNqWQ8j & goto opcao3
if "%jogo%"=="67" goto menu
if "%jogo%"=="68" goto reverterjogos
cls
goto :prioridadegames


:priorizar_fortnite
echo Aumentando prioridade do Fortnite...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_gtav
echo Aumentando prioridade do GTA V...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_fivem
echo Aumentando prioridade do FiveM...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_cs2
echo Aumentando prioridade do CS2...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_minecraft
echo Aumentando prioridade do Minecraft...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_valorant
echo Aumentando prioridade do Valorant...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_lol
echo Aumentando prioridade do League of Legends...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LeagueClient.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LeagueClient.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LeagueClient.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_warzone
echo Aumentando prioridade do Warzone...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_apex
echo Aumentando prioridade do Apex Legends...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_roblox
echo Aumentando prioridade do Roblox...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_gow
echo Aumentando prioridade do God of War...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoW.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoW.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoW.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_gow_ragnarok
echo Aumentando prioridade do God of War Ragnarok...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoWRagnarok.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoWRagnarok.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoWRagnarok.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_mta
echo Aumentando prioridade do MTA: San Andreas...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Multi Theft Auto.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Multi Theft Auto.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Multi Theft Auto.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gta_sa.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gta_sa.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gta_sa.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_ets1
echo Aumentando prioridade do Euro Truck Simulator 1...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eurotrucks.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eurotrucks.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eurotrucks.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_ets2
echo Aumentando prioridade do Euro Truck Simulator 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ets2.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ets2.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ets2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_r6
echo Aumentando prioridade do Rainbow Six Siege...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_cult
echo Aumentando prioridade do Cult Of the Lamb...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CultOfTheLamb.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CultOfTheLamb.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CultOfTheLamb.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_ultrakill
echo Aumentando prioridade do Ultrakill...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_bloodstrike
echo Aumentando prioridade do BloodStrike...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_arenabreakout
echo Aumentando prioridade do Arena Breakout...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArenaBreakout.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArenaBreakout.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArenaBreakout.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_residentevil4remake
echo Aumentando prioridade do Resident Evil 4 Remake...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_residentevil2remake
echo Aumentando prioridade do Resident Evil 2 Remake...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_residentevilvillage
echo Aumentando prioridade do Resident Evil Village...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames


:priorizar_freefire
echo Aumentando prioridade do Free Fire...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_battlefield2042
echo Aumentando prioridade do Battlefield 2042...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_battlefield4
echo Aumentando prioridade do Battlefield 4...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
Echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_tlou1
echo Aumentando prioridade do The Last of Us Part I & II...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_pubg
echo Aumentando prioridade do PUBG...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tslgame.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tslgame.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tslgame.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_rocketleague
echo Aumentando prioridade do Rocket League...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_cyberpunk
echo Aumentando prioridade do Cyberpunk 2077...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_terraria
echo Aumentando prioridade do Terraria...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_rdr2
echo Aumentando prioridade do Red Dead Redemption 2...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
goto :prioridadegames

:priorizar_battlefield6
echo Aumentando prioridade do Battlefield 6...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF6.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF6.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF6.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_choochoo
echo Aumentando prioridade do Choo Choo Charles...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Charles.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Charles.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Charles.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_hll
echo Aumentando prioridade do Hell Let Loose...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HLL.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HLL.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HLL.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_fs22
echo Aumentando prioridade do Farming Simulator 22...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FarmingSimulator2022.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FarmingSimulator2022.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FarmingSimulator2022.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_fs25
echo Aumentando prioridade do Farming Simulator 25...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FarmingSimulator2025.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FarmingSimulator2025.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FarmingSimulator2025.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_hollowknight
echo Aumentando prioridade do Hollow Knight...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\hollow_knight.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\hollow_knight.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\hollow_knight.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_genshin
echo Aumentando prioridade do Genshin Impact...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GenshinImpact.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GenshinImpact.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GenshinImpact.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_pointblank
echo Aumentando prioridade do Point Blank...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PointBlank.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PointBlank.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PointBlank.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_mysummercar
echo Aumentando prioridade do My Summer Car...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mysummercar.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mysummercar.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mysummercar.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_dayz
echo Aumentando prioridade do DayZ...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DayZ.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DayZ.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DayZ.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_sf6
echo Aumentando prioridade do Street Fighter 6...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StreetFighter6.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StreetFighter6.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StreetFighter6.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_rust
echo Aumentando prioridade do Rust...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RustClient.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RustClient.exe\PerfOptions" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RustClient.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_throne
echo Aumentando prioridade do Throne And Liberty...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TL.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TL.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_hitman
echo Aumentando prioridade do Hitman World Of Assassination...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HITMAN3.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HITMAN3.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_deadbydaylight
echo Aumentando prioridade do Dead By Daylight...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeadByDaylight-Win64-Shipping.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeadByDaylight-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_pathofexile
echo Aumentando prioridade Path Of Exile 1 e 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PathOfExile_x64.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PathOfExile_x64.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PathOfExile2.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PathOfExile2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_starcitizen
echo Aumentando prioridade do Star Citizen...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StarCitizen.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StarCitizen.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_cuphead
echo Aumentando prioridade do Cuphead...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cuphead.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cuphead.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_theisle
echo Aumentando prioridade do The Isle...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TheIsleClient-Win64-Shipping.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TheIsleClient-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_brawlhalla
echo Aumentando prioridade do Brawlhalla...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Brawlhalla.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Brawlhalla.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_assetocorsa
echo Aumentando prioridade Asseto Corsa...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\acs.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\acs.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_marvelrivals
echo Aumentando prioridade do Marvel Rivals...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MarvelRivals.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MarvelRivals.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_rust
echo Aumentando prioridade do Rust...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RustClient.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RustClient.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_beamng
echo Aumentando prioridade do Beamng.DRIVE...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BeamNG.drive.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BeamNG.drive.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_overwatch2
echo Aumentando prioridade do Overwatch 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Overwatch.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Overwatch.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!pause
pause
cls
goto :prioridadegames

:priorizar_projectzomboid
echo Aumentando prioridade do Project Zomboid...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ProjectZomboid64.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ProjectZomboid64.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_identityv
echo Aumentando prioridade do Identity V...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwrg.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwrg.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_stumbleguys
echo Aumentando prioridade do Stumble Guys...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StumbleGuys.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StumbleGuys.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_payday2
echo Aumentando prioridade do PayDay 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\payday2_win32_release.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\payday2_win32_release.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_warthunder
echo Aumentando prioridade do War Thunder...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\aces.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\aces.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_eafc26
echo Aumentando prioridade do EA FC 26...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FC26.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FC26.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_callofduty
echo Aumentando prioridade do Call Of Duty: Black ops 2, 3, 4, 5, 6 e 7...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\t6mp.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\t6mp.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\t6mp.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\blackops3.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\blackops3.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\blackops3.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\blackops4.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\blackops4.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\blackops4.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BlackOpsColdWar.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BlackOpsColdWar.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BlackOpsColdWar.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\codbo6.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\codbo6.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\codbo6.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\codbo7.exe" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\codbo7.exe\PerfOptions" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\codbo7.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_armareforger
echo Aumentando prioridade do Arma Reforger...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArmaReforger.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArmaReforger.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_skate4
echo Aumentando prioridade do Skate4...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Skate.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Skate.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames

:priorizar_chivarly2
echo Aumentando prioridade do Chivarly2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Chivalry2-Win64-Shipping.exe" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Chivalry2-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
echo Feito com Sucesso!
pause
cls
goto :prioridadegames


:reverterjogos
echo Revertendo prioridade dos jogos ao padrão do windows...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b2372_GTAProcess.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LeagueClient.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoW.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoWRagnarok.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Multi Theft Auto.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gta_sa.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eurotrucks.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ets2.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CultOfTheLamb.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CultOfTheLamb.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArenaBreakout.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArenaBreakout.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tslgame.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tslgame.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe" /f

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe\PerfOptions" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe" /f
Echo Revertido com Sucesso!
pause
cls
goto :prioridadegames


:perifericos
cls
set "ESC="
cls
echo(
set "lines[0]=              ___ ___                  .___                              
set "lines[1]=             /   |   \_____ _______  __| _/_  _  _______ _______   ____  
set "lines[2]=            /    ~    \__  \\_  __ \/ __ |\ \/ \/ /\__  \\_  __ \_/ __ \
set "lines[3]=            \    Y    // __ \|  | \/ /_/ | \     /  / __ \|  | \/\  ___/
set "lines[4]=             \___|_  /(____  /__|  \____ |  \/\_/  (____  /__|    \___  >
set "lines[5]=                   \/      \/           \/              \/            \/

for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                          %o%Escolha%w% a %o%opção%w% que você quer %o%otimizar:%w%
echo.
echo            %o%[ %b%1 %o%]%w% Otimizar HDD                      %o%[ %b%2 %o%]%w% Otimizar SSD
echo.
echo            %o%[ %b%3 %o%]%w% Verificar Temperatura             %o%[ %b%4 %o%]%w% Otimizar Teclado
echo.
echo            %o%[ %b%5 %o%]%w% Otimizar Mouse                    %o%[ %o%6 %o%]%o% Reverter Otimização%w%
echo.
echo            %o%[ %o%7 %o%]%o% Voltar ao Menu Principal%w%
echo. 
echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto opcao7

goto :perifericos

:opcao7
cls
goto:menu

:opcao1
cls
echo Otimizando HDD...
fsutil behavior set disableLastAccess 2
fsutil behavior set disable8dot3 2
dfrgui.exe
echo HDD otimizado com sucesso!
pause
cls
goto :perifericos

:opcao2
cls
echo Otimizando SSD...

schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Enable
fsutil behavior set disableLastAccess 2
fsutil behavior set disable8dot3 2
cleanmgr.exe

echo SSD otimizado com sucesso!
pause
cls
goto :perifericos


:opcao3
cls
echo Iniciando programa...
start "" "%~dp0OpenHardwareMonitor.exe"
pause
cls
goto :perifericos

:opcao4
cls
echo Iniciando programa e otimizações...
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f
start "" "%~dp0FilterKeysSetter.exe"
pause
cls
goto :perifericos

:opcao5
cls
echo Otimizando Mouse...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v MouseTrails /t REG_SZ /d 0 /f
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True
echo Mouse otimizado com sucesso!
pause
cls
goto :perifericos

:opcao6
cls
echo ===============================================
echo REVERTER OTIMIZAÇÕES - iGust
echo ===============================================
echo.
echo %o%[0] Voltar%w%
echo [1] Reverter Otimização do Mouse
echo [2] Reverter Otimização do Teclado
echo [3] Reverter SSD
echo [4] Reverter HDD
echo [5] Reverter TODOS
echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto revert_mouse
if %opcao% equ 2 goto revert_teclado
if %opcao% equ 3 goto revert_ssd
if %opcao% equ 4 goto revert_hdd
if %opcao% equ 5 goto reverter_tudo
if %opcao% equ 0 goto perifericos
goto opcao6

:revert_mouse
cls
echo Revertendo mouse para configuracoes padrão...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 1 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 6 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 10 /f
echo Mouse restaurado.
pause
goto opcao6

:revert_teclado
cls
echo Revertendo teclado para configuracoes padrão...
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 1 /f
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 15 /f

echo Teclado restaurado.
pause
goto opcao6

:revert_ssd
cls
echo Reativando tarefas de otimizacao de SSD...
schtasks /Change /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /Enable
fsutil behavior set disableLastAccess 1
fsutil behavior set disable8dot3 2
echo  Configurações para SSD restauradas.
pause
goto opcao6

:revert_hdd
cls
echo Revertendo configuracoes para HDD...
fsutil behavior set disableLastAccess 0
fsutil behavior set disable8dot3 1
echo  Configurações para HDD restauradas.
pause
goto opcao6

:reverter_tudo
call :revert_mouse
call :revert_teclado
call :revert_inputlag
call :revert_ssd
call :revert_hdd
echo Todas as otimizacoes foram revertidas.
pause
goto opcao6

:revertertudo
start https://youtu.be/_Mc3urSaUL8?feature=shared
pause
cls
goto :menu

:autorun
start "" "%~dp0Autoruns.exe"
echo Configurando Inicialização do Windows...
pause
cls
goto menu

:tempera
cls
echo Iniciando programa...
start "" "%~dp0OpenHardwareMonitor.exe"
pause
cls
goto :menu

:amd
cls
set "ESC="
cls
echo(
set "lines[0]=                                  _____      _____  ________   
set "lines[1]=                                 /  _  \    /     \ \______ \  
set "lines[2]=                                /  /_\  \  /  \ /  \ |    |  \ 
set "lines[3]=                               /    |    \/    Y    \|    `   \
set "lines[4]=                               \____|__  /\____|__  /_______  /
set "lines[5]=                                       \/         \/        \/ 

for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                              %o%Escolha%q% a %o%opção%q% que você quer %o%otimizar:
echo.
echo            %o%[ %b%1 %o%]%w% Desativar MPO                     %o%[ %b%2 %o%]%w% Desativar AMD Crash Defender
echo.
echo            %o%[ %b%3 %o%]%w% Desat. GPU Scheduling             %o%[ %b%4 %o%]%w% Desativar AMD Overlay e Telemetria
echo.
echo            %o%[ %o%5 %o%]%w% Instalar o Driver AMD             %o%[ %o%6 %o%]%w% Voltar Ao Menu Principal
echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6

goto :perifericos

:opcao1
cls
echo Desativando MPO...
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" ^
/v OverlayTestMode /t REG_DWORD /d 5 /f

echo Otimização Feita com Sucesso!
pause
cls
goto :amd

:opcao2
cls
echo Desativando AMD Crash Defender...
sc stop AMD Crash Defender Service
sc config "AMD Crash Defender Service" start= disabled

echo Otimização Feita com Sucesso!
pause
cls
goto :amd

:opcao3
cls
echo Desativando Hardware Accelerated GPU Scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" ^
/v HwSchMode /t REG_DWORD /d 1 /f

echo Otimização Feita com Sucesso!
pause
cls
goto :amd

:opcao4
cls
echo Desativando AMD Overlay e Telemetria...
reg add "HKLM\SOFTWARE\AMD\CN" ^
/v AllowWebContent /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\AMD\CN" ^
/v AutoUpdate /t REG_DWORD /d 0 /f

echo Otimização Feita com Sucesso!
pause
cls
goto :amd

:opcao5
cls
echo Abrindo Site oficial da amd...
set "AMD_DIR=%TEMP%\AMD_Driver"
mkdir "%AMD_DIR%" >nul 2>&1

set "AMD_URL=https://drivers.amd.com/drivers/installer/23.40/whql/amd-software-adrenalin-edition-auto-detect-install.exe"

curl -L "%AMD_URL%" -o "%AMD_DIR%\AMD_AutoDetect.exe"

if exist "%AMD_DIR%\AMD_AutoDetect.exe" (
    echo Download concluido!
    echo Abrindo instalador...
    start "" "%AMD_DIR%\AMD_AutoDetect.exe"
) else (
    echo ERRO: Falha ao baixar o instalador da AMD.
)

echo Otimização Feita com Sucesso!
pause
cls
goto :amd

:opcao6
cls
goto :menu
cls

:nvidia
cls
set "ESC="
cls
echo(
set "lines[0]=                              _______       .__    .___.__        
set "lines[1]=                              \      \___  _|__| __| _/|__|____   
set "lines[2]=                              /   |   \  \/ /  |/ __ | |  \__  \  
set "lines[3]=                             /    |    \   /|  / /_/ | |  |/ __ \_
set "lines[4]=                             \____|__  /\_/ |__\____ | |__(____  /
set "lines[5]=                                     \/             \/         \/ 


for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                              %o%Escolha%q% a %o%opção%q% que você quer %o%otimizar:
echo.
echo            %o%[ %b%1 %o%]%w% Desativar MPO                     %o%[ %b%2 %o%]%w% Desativar HGS
echo.
echo            %o%[ %b%3 %o%]%w% Desativar NVIDIA ShadowPlay       %o%[ %b%4 %o%]%w% Desativar Telemetria NVIDIA
echo.
echo            %o%[ %o%5 %o%]%w% Instalar o Driver Nvidia          %o%[ %o%6 %o%]%w% Voltar Ao Menu Principal
echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6

goto :perifericos

:opcao1
cls
echo Desativando MPO...
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" ^
/v OverlayTestMode /t REG_DWORD /d 5 /f
echo Otimização Feita com Sucesso!
pause
cls
goto :nvidia

:opcao2
cls
echo Desativando HGS...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" ^
/v HwSchMode /t REG_DWORD /d 1 /f
echo Otimização Feita com Sucesso!
pause
cls
goto :nvidia

:opcao3
cls
echo Desativando NVIDIA ShadowPlay...
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\ShadowPlay" ^
/v Allow /t REG_DWORD /d 0 /f
echo Otimização Feita com Sucesso!
pause
cls
goto :nvidia

:opcao4
cls
echo Desativando Telemetria NVIDIA...
sc stop NvTelemetryContainer
sc config NvTelemetryContainer start= disabled
sc stop NVDisplay.ContainerLocalSystem
sc config NVDisplay.ContainerLocalSystem start= auto
echo Otimização Feita com Sucesso!
pause
cls
goto :nvidia

:opcao5
cls
echo Abrindo site Nvidia...
start https://www.nvidia.com/pt-br/drivers/
pause
cls
goto :nvidia

:opcao6
cls
goto :menu
cls

:fix
cls
set "ESC="
cls
echo(

 set "lines[0]=                                      ___________.__        
 set "lines[1]=                                      \_   _____/|__|__  ___
 set "lines[2]=                                       |    __)  |  \  \/  /
 set "lines[3]=                                       |     \   |  |>    < 
 set "lines[4]=                                       \___  /   |__/__/\_ \
 set "lines[5]=                                           \/             \/


for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                                 %o%Escolha%q% a %o%opção%q% que você quer %o%otimizar:
echo.
echo            %o%[ %b%1 %o%]%w% Fix Loja do windows não baixa nada         %o%[ %b%2 %o%]%w% Fix Anticheat Bloqueando Jogo
echo.
echo            %o%[ %b%3 %o%]%w% Fix Pc não desliga (Fica só encerrando)    %o%[ %b%4 %o%]%w% Fix Tela preta após boot
echo.
echo            %o%[ %b%5 %o%]%w% Fix Notebook não sai do modo avião         %o%[ %b%6 %o%]%w% Fix Bluetooth Parou
echo.
echo            %o%[ %b%7 %o%]%w% Fix ÁUDIO                                  %o%[ %b%8 %o%]%w% Fix Reativar WI-FI
echo.
echo            %o%[ %b%9 %o%]%w% Fix Áudio Bugado                           %o%[ %b%10 %o%]%w% Fix Serviços Xbox
echo.
echo            %o%[ %b%11 %o%]%w% Fix Xbox app e Game Pass                  %o%[ %b%12 %o%]%w% Fix Erros de Disco
echo.
echo            %o%[ %b%13 %o%]%w% Fix de Rede e Internet                    %o%[ %b%14 %o%]%w% Fix Menu iniciar e Barra de Tarefas
echo.
echo            %o%[ %b%15 %o%]%w% Fix Microsoft Store                       %o%[ %b%16 %o%]%w% Fix Windows Update
echo.
echo            %o%[ %b%17 %o%]%w% Fix de arquivos Corrompidos               %o%[ %o%18 %o%]%o% Voltar ao Menu Principal
echo.
echo.
echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% equ 7 goto opcao7
if %opcao% equ 8 goto opcao8
if %opcao% equ 9 goto opcao9
if %opcao% equ 10 goto opcao10
if %opcao% equ 11 goto opcao11
if %opcao% equ 12 goto opcao12
if %opcao% equ 13 goto opcao13
if %opcao% equ 14 goto opcao14
if %opcao% equ 15 goto opcao15
if %opcao% equ 16 goto opcao16
if %opcao% equ 17 goto opcao17
if %opcao% equ 18 goto opcao18

goto :perifericos

:opcao1
cls
echo Fix Loja do windows não baixa nada...
sc config BITS start= auto
sc start BITS
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao2
cls
echo Fix Anticheat Bloqueando Jogo...
bcdedit /deletevalue mitigations
sc config WinDefend start= auto
sc start WinDefend
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao3
cls
echo Fix Pc não desliga (Fica só encerrando)...
powercfg -h on
shutdown /f /t 0
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao4
cls
echo Fix Tela preta após boot
sc config Dwm start= auto
sc start Dwm
taskkill /f /im explorer.exe
start explorer.exe
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao5
cls
echo Fix Notebook não sai do modo avião
sc config RmSvc start= auto
sc start RmSvc
sc config WlanSvc start= auto
sc start WlanSvc
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao6
cls
echo Fix Bluetooth Parou...
bcdedit /deletevalue mitigations
sc config WinDefend start= auto
sc start WinDefend
echo Otimização Feita com Sucesso!
pause
cls
goto :fix


:opcao7
cls
echo Fix ÁUDIO...
sc config Audiosrv start= auto
sc start Audiosrv
sc config AudioEndpointBuilder start= auto
sc start AudioEndpointBuilder
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao8
cls
echo Fix Reativar WI-FI...
sc config WlanSvc start= auto
sc start WlanSvc
sc config Dhcp start= auto
sc start Dhcp
sc config NlaSvc start= auto
sc start NlaSvc
sc config Netman start= auto
sc start Netman
netsh winsock reset
netsh int ip reset
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao9
cls
echo Fix Áudio Bugado...
net stop audiosrv
net start audiosrv
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao10
cls
echo Fix Serviços Xbox...

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblAuthManager]
"Start"=dword:00000002
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblGameSave]
"Start"=dword:00000002
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc]
"Start"=dword:00000002

echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao11
cls
echo Fix Xbox app e Game Pass...
net stop XboxGipSvc
net stop XblAuthManager
net stop XblGameSave
net stop XboxNetApiSvc
powershell -command "Get-AppxPackage *Xbox* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register `$($_.InstallLocation)\AppxManifest.xml}"
net start XboxGipSvc
net start XblAuthManager
net start XblGameSave
net start XboxNetApiSvc
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao12
cls
echo Fix Erros de Disco...
chkdsk C: /f /r
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao13
cls
echo Fix de Rede e Internet...
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh int ip reset
netsh winsock reset
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao14
cls
echo Fix Menu iniciar e Barra de Tarefas...
taskkill /f /im explorer.exe
start explorer.exe
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao15
cls
echo Fix Microsoft Store...
powershell -command "Get-AppxPackage -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register `$($_.InstallLocation)\AppxManifest.xml}"
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao16
cls
echo Fix Windows Update...
net stop wuauserv
net stop bits
net stop cryptsvc
ren %systemroot%\SoftwareDistribution SoftwareDistribution.old
ren %systemroot%\System32\catroot2 catroot2.old
net start wuauserv
net start bits
net start cryptsvc
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao17
cls
echo Fix de arquivos Corrompidos...
sfc /scannow
echo Reparando imagem do Windows...
DISM /Online /Cleanup-Image /RestoreHealth
echo Otimização Feita com Sucesso!
pause
cls
goto :fix

:opcao18
cls
goto :menu
cls


:debloater
cls

echo(

set "lines[0]=                     ________        ___.   .__                __                
set "lines[1]=                     \______ \   ____\_ |__ |  |   _________ _/  |_  ___________ 
set "lines[2]=                      |    |  \_/ __ \| __ \|  |  /  _ \__  \\   __\/ __ \_  __ \
set "lines[3]=                      |    `   \  ___/| \_\ \  |_(  <_> ) __ \|  | \  ___/|  | \/
set "lines[4]=                     /_______  /\___  >___  /____/\____(____  /__|  \___  >__|   
set "lines[5]=                             \/     \/    \/                \/          \/       



for /L %%j in (0,1,82) do (
    set /a "corR=corBaseR + (variacaoR * %%j / 82)"
    set /a "corG=corBaseG + (variacaoG * %%j / 82)"
    set /a "corB=corBaseB + (variacaoB * %%j / 82)"
    set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
    set "texto=!lines[%%i]!"
    set "textoGradiente="
    for /L %%j in (0,1,82) do (
        set "char=!texto:~%%j,1!"
        if "!char!" == " " set "char= "
        set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
    )
    echo( !textoGradiente!!ESC![0m
)


echo 	 	 %q%

echo(
echo                                       Escolha qual Bloatware %o%Remover:%w%
echo.
echo               %o%[ %o%1 %o%]%o% Usar todos %r%(CUIDADO)%w%                       %o%[ %b%2 %o%]%w% Remover officehub
echo.
echo               %o%[ %b%3 %o%]%w% Remover Cortana                            %o%[ %b%4 %o%]%w% Remover Copilot
echo.
echo               %o%[ %b%5 %o%]%w% Remover Loja do Windows                    %o%[ %b%6 %o%]%w% Remover a Xbox
echo.  
echo               %o%[ %b%7 %o%]%w% Remover Windows Photos                     %o%[ %b%8 %o%]%w% Remover Windows People 
echo. 
echo               %o%[ %b%9 %o%]%w% Remover Windows Music                      %o%[ %b%10 %o%]%w% Remover Windows Messaging
echo. 
echo               %o%[ %b%11 %o%]%w% Remover Windows Maps                      %o%[ %b%12 %o%]%w% Remover Windows Groove
echo. 
echo               %o%[ %b%13 %o%]%w% Remover Windows GetStarted                %o%[ %b%14 %o%]%w% Remover Calendário 
echo. 
echo               %o%[ %b%15 %o%]%w% Remover Calculadora                       %o%[ %b%16 %o%]%w% Remover Windows Alarms 
echo. 
echo               %o%[ %b%17 %o%]%w% Remover 3DBuilder                         %o%[ %b%18 %o%]%w% Remover Windows Câmera 
echo. 
echo               %o%[ %b%19 %o%]%w% Remover Notícias                          %o%[ %b%20 %o%]%w% Remover OneDrive 
echo. 
echo               %o%[ %b%21 %o%]%w% Remover Anúncios e sugestões              %o%[ %b%22 %o%]%w% Remover Emails
echo.                                 
echo               %o%[ %b%23 %o%]%w% Remover Outlook                           %o%[ %b%24 %o%]%w% Remover Assistência Rápida 
echo.                                 
echo               %o%[ %b%25 %o%]%w% Remover Microsoft To do                   %o%[ %b%26 %o%]%w% Remover Solitaire e jogos Casuais
echo.                                 
echo               %o%[ %b%27 %o%]%w% Remover Clima                             %o%[ %b%28 %o%]%w%Remover Hub de Comentários%w%
echo.                                 
echo               %o%[ %b%29 %o%]%w% Reverter Debloaters%w%                       %o%[ %o%30 %o%]Voltar Ao Menu Principal%w%                                                             
echo.
echo.
set /p opcao="Escolha uma opção:%w% "%w%


if %opcao% equ 1 goto opcao2
if %opcao% equ 2 goto opcao3
if %opcao% equ 3 goto opcao4
if %opcao% equ 4 goto opcao5
if %opcao% equ 5 goto opcao6
if %opcao% equ 6 goto opcao7
if %opcao% equ 7 goto opcao8
if %opcao% equ 8 goto opcao9
if %opcao% equ 9 goto opcao10
if %opcao% equ 10 goto opcao11
if %opcao% equ 11 goto opcao12
if %opcao% equ 12 goto opcao13
if %opcao% equ 13 goto opcao14
if %opcao% equ 14 goto opcao15
if %opcao% equ 15 goto opcao16
if %opcao% equ 16 goto opcao17
if %opcao% equ 17 goto opcao18
if %opcao% equ 18 goto opcao19
if %opcao% equ 19 goto opcao20
if %opcao% equ 20 goto opcao21
if %opcao% equ 21 goto opcao22
if %opcao% equ 22 goto opcao23
if %opcao% equ 23 goto opcao24
if %opcao% equ 24 goto opcao25
if %opcao% equ 25 goto opcao26
if %opcao% equ 26 goto opcao27
if %opcao% equ 27 goto opcao28
if %opcao% equ 28 goto opcao29
if %opcao% equ 29 goto opcao30
if %opcao% equ 30 goto menuprincipal


echo Opção inválida. Tente novamente.
pause
cls
goto :debloater

:menuprincipal
cls
goto :menu

:opcao2
cls
echo Removendo todos programas inúteis do Windows...

powershell -Command "Get-AppxPackage *Microsoft.Windows.Cortana* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *officehub* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *store* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *photos* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *phone* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *music* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *messaging* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *maps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *groove* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *getstarted* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *calendar* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *calculator* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *alarms* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *camera* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *news* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *onedrive* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *FeedbackHub* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *QuickAssist* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *todos* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *xboxGamingOverlay* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *Weather* | Remove-AppxPackage"

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Copilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideCopilotButton /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao3
cls
echo Removendo Officehub...

powershell -Command "Get-AppxPackage *officehub* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao4
cls
echo Removendo Cortana...

powershell -Command "Get-AppxPackage *Microsoft.Windows.Cortana* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao5
cls
echo Removendo Copilot...

powershell -command "Get-AppxPackage *Copilot* | Remove-AppxPackage"
powershell -command "Get-AppxPackage -AllUsers *Copilot* | Remove-AppxPackage"
powershell -command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like '*Copilot*'} | Remove-AppxProvisionedPackage -Online"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao6
cls
echo Removendo Loja do Windows...

powershell -Command "Get-AppxPackage *store* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao7
cls
echo Removendo a Xbox do Windows...

powershell -Command "Get-AppxPackage *xbox* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao8
cls
echo Removendo Windows photo...

powershell -Command "Get-AppxPackage *photos* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao9
cls
echo Removendo Windows Phone...

powershell -Command "Get-AppxPackage *phone* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao10
cls
echo Removendo Windows Music...

powershell -Command "Get-AppxPackage *music* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao11
cls
echo Removendo Windows Messaging...

powershell -Command "Get-AppxPackage *messaging* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao12
cls
echo Removendo Windows Maps...

powershell -Command "Get-AppxPackage *maps* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao13
cls
echo Removendo Windows Groove...

powershell -Command "Get-AppxPackage *groove* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao14
cls
echo Removendo Windows Getstarted...

powershell -Command "Get-AppxPackage *getstarted* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao15
cls
echo Removendo Windows Calendário...

powershell -Command "Get-AppxPackage *calendar* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao16
cls
echo Removendo Calculadora Do Windows...

powershell -Command "Get-AppxPackage *calculator* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao17
cls
echo Removendo Windows Alarmes...

powershell -Command "Get-AppxPackage *alarms* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao18
cls
echo Removendo Windows 3DBuilder...

powershell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao19
cls
echo Removendo Windows Câmera...

powershell -Command "Get-AppxPackage *camera* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao20
cls
echo Removendo Notícias do Windows...

powershell -Command "Get-AppxPackage *news* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao21
cls
echo Removendo OneDrive...

powershell -Command "Get-AppxPackage *onedrive* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao22
cls
echo Removendo Anúncios e sugestões...

powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager SystemPaneSuggestionsEnabled 0"
powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager 'SubscribedContent-338393Enabled' 0"
powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager 'SubscribedContent-353694Enabled' 0"
powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager 'SubscribedContent-353696Enabled' 0"
powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager 'SubscribedContent-338389Enabled' 0"
powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager 'SubscribedContent-310093Enabled' 0"
powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager 'SubscribedContent-353698Enabled' 0"
powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager SoftLandingEnabled 0"

powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced Start_TrackProgs 0"
powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced Start_TrackDocs 0"

powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer ShowRecent 0"
powershell -command "Set-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer ShowRecommended 0"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao23
cls
echo Removendo Emails....
powershell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater


:opcao24
cls
echo Removendo Outlook...
powershell -Command "Get-AppxPackage *Outlook* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao25
cls
echo Removendo Assistência Rápida...
powershell -Command "Get-AppxPackage *QuickAssist* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao26
cls
echo Removendo Microsoft To Do...
powershell -Command "Get-AppxPackage *todos* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao27
cls
echo Removendo Solitaire e Jogos Casuais...
powershell -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage"
powershell -Command "Get-AppxPackage *xboxGamingOverlay* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao28
cls
Removendo Clima...
powershell -Command "Get-AppxPackage *Weather* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao29
cls
echo Removendo Hub de Comentários...
powershell -Command "Get-AppxPackage *FeedbackHub* | Remove-AppxPackage"

echo Debloater Feito com Sucesso! :)
pause
cls
goto :debloater

:opcao30
cls
echo Revertendo Debloater e configuracoes...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Copilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCopilotButton /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecommended /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackDocs /t REG_DWORD /d 1 /f

echo %r%Abrindo arquivo adicional, aperte ENTER para abrir! %w%
set /p "= " 
echo abrindo arquivo .txt
start "" "%~dp0Reverter Debloat.txt"

echo Debloater Revertido com Sucesso!
pause
cls
goto :debloater
