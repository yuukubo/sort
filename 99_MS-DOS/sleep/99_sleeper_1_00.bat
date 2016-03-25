@echo off

ping 127.0.0.1 -n %1 2> nul 1>&2
echo %1 >> %2

exit
