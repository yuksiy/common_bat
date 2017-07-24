@echo off

rem ==============================================================================
rem   機能
rem     第1引数に指定されたディレクトリが空か否かをチェックする
rem   構文
rem     call is_dir_empty_function.bat DIR
rem
rem   Copyright (c) 2004-2017 Yukio Shiiya
rem
rem   This software is released under the MIT License.
rem   https://opensource.org/licenses/MIT
rem ==============================================================================

rem **********************************************************************
rem * 基本設定
rem **********************************************************************
rem 環境変数のローカライズ開始
setlocal

rem 遅延環境変数展開の有効化
verify other 2>nul
setlocal enabledelayedexpansion
if errorlevel 1 (
	echo -E Unable to enable delayedexpansion 1>&2
	exit /b 1
)

rem **********************************************************************
rem * メインルーチン
rem **********************************************************************

rem 第1引数のチェック
if "%~1"=="" (
	exit /b 1
)
set dir=%~1

rem 指定されたディレクトリのチェック
if not exist %dir%\nul (
	exit /b 1
)

rem 指定されたディレクトリが空か否かのチェック
set contents=
for /f "tokens=1" %%i in ('dir /a /b "%dir%"') do set contents=!contents! %%i
if "%contents%"=="" (
	exit /b 0
) else (
	exit /b 1
)

