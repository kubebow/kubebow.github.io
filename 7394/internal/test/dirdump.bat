dir /S> dirdump.txt
for /F %%G IN (dirdump.txt) DO (
	Set result=%%G
	if /i "%result:~0,2%"=="cd" goto Cd
	Set new=%result:~0,2%
	echo %new%
)
pause