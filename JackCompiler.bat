@echo off
:: JackCompiler.bat - компилирует .jack файлы из src/ в build/
:: Убедитесь, что папки src/ и build/ существуют

setlocal

:: Проверяем наличие папки src
if not exist "src\" (
    echo Ошибка: Папка "src" не найдена!
    exit /b 1
)

:: Создаем папку build, если ее нет
if not exist "build\" mkdir build

:: Компилируем все .jack файлы из src
echo Компиляция .jack файлов из src/ в build/...
java -classpath "%CLASSPATH%;bin/classes;bin/lib/Hack.jar;bin/lib/Compilers.jar" ^
    Hack.Compiler.JackCompiler "src"

:: Проверяем результат компиляции
if %errorlevel% equ 0 (
    echo Компиляция успешно завершена!
) else (
    echo Ошибка компиляции!
    exit /b %errorlevel%
)

endlocal