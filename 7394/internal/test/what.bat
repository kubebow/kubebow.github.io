@echo off
set word=table
set str=jump over the chair
call set str=%%str:chair=%word%%%
echo %str%
echo %word%

set testdir=C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394\internal\htmltop
set SOFbs=%testdir:~57%
call set SOFfs=%%SOFbs:\=/%%
echo %SOFbs%
echo %SOFbs%
echo %word%
echo.
echo.

setlocal enabledelayedexpansion
echo wow
set giveme=!CD!
set SOFbs=%giveme:~57%
set SOFfs=%SOFbs:\=/%
echo %giveme%
echo %SOFbs%
echo %SOFfs%

pause