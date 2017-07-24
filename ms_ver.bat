@echo off

rem ==============================================================================
rem   �@�\
rem     Microsoft �̊e��\�t�g�E�F�A�̃o�[�W�������擾����
rem   �\��
rem     :USAGE �Q��
rem
rem   Copyright (c) 2011-2017 Yukio Shiiya
rem
rem   This software is released under the MIT License.
rem   https://opensource.org/licenses/MIT
rem ==============================================================================

rem **********************************************************************
rem * ��{�ݒ�
rem **********************************************************************
rem ���ϐ��̃��[�J���C�Y�J�n
setlocal

rem �x�����ϐ��W�J�̗L����
verify other 2>nul
setlocal enabledelayedexpansion
if errorlevel 1 (
	echo -E Unable to enable delayedexpansion 1>&2
	exit /b 1
)

rem **********************************************************************
rem * �ϐ���`
rem **********************************************************************

rem **********************************************************************
rem * �T�u���[�`����`
rem **********************************************************************
:def_subroutine
goto end_def_subroutine

:USAGE
	echo Usage:                1>&2
	echo   ms_ver.bat VER_TYPE 1>&2
	echo.                      1>&2
	echo   VER_TYPE : {win} 1>&2
	rem echo   VER_TYPE : {win^|win_sp^|win_win_sp} 1>&2
goto :EOF

rem �o�[�W�����̎擾 (Windows �֘A)
:VER_WIN
	set VER_WIN=unknown
	ver | findstr "Version 5.1." >nul
	if %errorlevel% equ 0 (
		set VER_WIN=winxp
	)
	ver | findstr "Version 6.1." >nul
	if %errorlevel% equ 0 (
		set VER_WIN=win7
	)
	ver | findstr "Version 10.0." >nul
	if %errorlevel% equ 0 (
		set VER_WIN=win10
	)
goto :EOF

:end_def_subroutine

rem **********************************************************************
rem * ���C�����[�`��
rem **********************************************************************

rem ��1�����̃`�F�b�N
if "%~1"=="" (
	echo -E Missing VER_TYPE argument 1>&2
	call :USAGE & exit /b 1
) else (
	set VER_TYPE=%~1
	if "!VER_TYPE!"=="win" (
		rem �������Ȃ�
	) else (
		echo -E Invalid VER_TYPE argument -- "!VER_TYPE!" 1>&2
		call :USAGE & exit /b 1
	)
)

rem Microsoft �̊e��\�t�g�E�F�A�̃o�[�W�����̎擾
if "%VER_TYPE%"=="win" (
	call :VER_WIN
	echo !VER_WIN!
)

