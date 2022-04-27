@echo off

:: Taken from https://github.com/samehb/ResetPrinterJobs/blob/master/ResetPrinterJobs.bat
:: Must be run as administrator

echo Resetting your stuck printer jobs, please wait ...
sc stop Spooler > nul
ping -n 5 127.0.0.1 > nul
del %SystemRoot%\System32\spool\PRINTERS\*.* /f /q > nul
sc start Spooler > nul
ping -n 5 127.0.0.1 > nul
echo Finished, feel free to print now.

