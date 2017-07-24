@echo off

rem ==============================================================================
rem   �@�\
rem     ��1�����Ɏw�肳�ꂽ�f�B���N�g�����󂩔ۂ����`�F�b�N����
rem   �\��
rem     call is_dir_empty_function.bat DIR
rem
rem   Copyright (c) 2004-2017 Yukio Shiiya
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
rem * ���C�����[�`��
rem **********************************************************************

rem ��1�����̃`�F�b�N
if "%~1"=="" (
	exit /b 1
)
set dir=%~1

rem �w�肳�ꂽ�f�B���N�g���̃`�F�b�N
if not exist %dir%\nul (
	exit /b 1
)

rem �w�肳�ꂽ�f�B���N�g�����󂩔ۂ��̃`�F�b�N
set contents=
for /f "tokens=1" %%i in ('dir /a /b "%dir%"') do set contents=!contents! %%i
if "%contents%"=="" (
	exit /b 0
) else (
	exit /b 1
)

