@echo off
del nodeproject.zip >nul 2>&1

cd src
copy ..\README.md .
zip -r ..\nodeproject.zip .
del README.md
cd ..

haxelib submit nodeproject.zip
del nodeproject.zip
