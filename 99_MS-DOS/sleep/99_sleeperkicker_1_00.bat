@echo off
color 1E
rem **** **** **** **** **** **** **** **** **** **** **** 
rem **** **** **** **** **** **** **** **** **** **** **** 
echo.
echo ################################################################
echo.
echo sleep sort �o�b�`�ł��B���s���܂����H
echo ���~����ꍇ��Ctl+C
echo ���s����ꍇ��
pause

echo.
echo ���s���܂�
echo.
echo ################################################################
echo.
color 3F
echo.
echo ************ �����J�n ************
echo.

rem **** **** **** **** **** **** **** **** **** **** **** 
rem **** **** **** **** **** **** **** **** **** **** **** 
rem ���Ԏ擾
set CDATE=%date:~-10,4%-%date:~-5,2%-%date:~-2,2%
set CTIME=%time: =0%
set CTIME=%CTIME:~0,2%-%CTIME:~3,2%-%CTIME:~6,2%

rem ���O�t�@�C���ݒ�
set CDIR=%~dp0
set LFILE=%CDIR%sleepsort_%CDATE%_%CTIME%.txt

echo. >> %LFILE%
echo start  : %DATE% %TIME% >> %LFILE%
echo ******************************************** >> %LFILE%

rem **** **** **** **** **** **** **** **** **** **** **** 
rem **** **** **** **** **** **** **** **** **** **** **** 

SETLOCAL enabledelayedexpansion
set /a RN1=%RANDOM%*11/32768
set /a RN2=%RANDOM%*11/32768
set /a RN3=%RANDOM%*11/32768
set /a RN4=%RANDOM%*11/32768
set /a RN5=%RANDOM%*11/32768
set /a RN6=%RANDOM%*11/32768
set /a RN7=%RANDOM%*11/32768
set /a RN8=%RANDOM%*11/32768
set RNALL=%RN1%,%RN2%,%RN3%,%RN4%,%RN5%,%RN6%,%RN7%,%RN8%
echo randnum : %RNALL%
echo randnum : %RNALL% >> %LFILE%
echo.

start /MIN %CDIR%99_sleeper_1_00.bat %RN1% %LFILE%
start /MIN %CDIR%99_sleeper_1_00.bat %RN2% %LFILE%
start /MIN %CDIR%99_sleeper_1_00.bat %RN3% %LFILE%
start /MIN %CDIR%99_sleeper_1_00.bat %RN4% %LFILE%
start /MIN %CDIR%99_sleeper_1_00.bat %RN5% %LFILE%
start /MIN %CDIR%99_sleeper_1_00.bat %RN6% %LFILE%
start /MIN %CDIR%99_sleeper_1_00.bat %RN7% %LFILE%
start /MIN %CDIR%99_sleeper_1_00.bat %RN8% %LFILE%

echo. >> %LFILE%
echo ******************************************** >> %LFILE%
echo end    : %DATE% %TIME% >> %LFILE%
echo by %0 >> %LFILE%
echo ******************************************** >> %LFILE%
echo. >> %LFILE%
echo ** �� sorted �� ** >> %LFILE%
echo. >> %LFILE%

rem **** **** **** **** **** **** **** **** **** **** **** 
rem **** **** **** **** **** **** **** **** **** **** **** 
echo.
echo ************ �����I�� ************
echo.

echo 10�b��ɕ��܂��B�\�[�g���ʂ͐��b��Ɋm�F���ĉ������B
ping 127.0.0.1 -n 10 2> nul 1>&2
exit
