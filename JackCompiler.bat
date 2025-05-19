@echo off
:: JackCompiler.bat - компилирует .jack файлы из src/ в build/

setlocal

:: Проверка папок
if not exist "src\" (
    echo Ошибка: Папка "src" не найдена!
    exit /b 1
)
if not exist "build\" mkdir build

:: Компиляция .jack файлов (результат будет в src/)
echo Компиляция .jack файлов из src/...
java -classpath "%CLASSPATH%;bin/classes;bin/lib/Hack.jar;bin/lib/Compilers.jar" ^
    Hack.Compiler.JackCompiler "src"

if %errorlevel% neq 0 (
    echo Ошибка компиляции!
    exit /b %errorlevel%
)

:: Перемещение всех .vm файлов из src/ в build/
echo Перемещение .vm файлов в build/...
for /R src %%f in (*.vm) do (
    move "%%f" "build\"
)

echo Готово!
endlocal
