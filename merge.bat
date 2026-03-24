@echo off
cd /d "%~dp0"

:: Name of the output file
set output=frontend.css
del "%output%" 2>nul

:: === List your files here, in the order you want ===
set files=^
core\page.css ^
core\background.css ^
core\border.css ^
core\button.css ^
core\flex.css ^
core\form.css ^
core\input.css ^
core\layout.css ^
core\popover.css ^
core\template.css ^
core\typography.css ^
core\utility.css ^
components\blurb.css ^
components\card.css ^
components\code.css ^
components\list.css ^
components\panel.css ^
components\tab.css ^
components\table.css ^
components\toolbar.css
:: ===================================================

for %%f in (%files%) do (
    echo Checking path: "%cd%\%%f"
    if exist "%%f" (
        echo /* ==== START %%f ==== */ >> "%output%"
        echo. >> "%output%"
        type "%%f" >> "%output%"
        echo. >> "%output%"
        echo /* ==== END %%f ==== */ >> "%output%"
        echo. >> "%output%"
    ) else (
        echo File not found: %%f
    )
)

css-minify -f frontend.css -o /

echo.
echo Combined files into "%output%"

