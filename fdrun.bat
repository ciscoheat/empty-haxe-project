@echo off
:: For windows php runtime, unzip this to project folder:
:: https://drive.google.com/file/d/0B1bnhRn9bFYoamdWNG90LVVZTDg/view

if exist .\php SET PATH=%PATH%;.\php

:: To run normally:
php bin\index.php

:: To use travis (initialize with "haxelib dev nodeproject .")
::haxelib run travix php

pause
