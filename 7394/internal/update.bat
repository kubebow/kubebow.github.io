:: the part to make sure i dont get sued
@echo off
setlocal enabledelayedexpansion
title Index updater
echo This file is not meant to be used by anyone other than myself, KubeBow.
echo This file doesn't connect to my website or something like that it just generates index.html files for all the subdirs in "Index of 7394/"
echo Using this file without any idea what it does is really stupid and could technically fuck up your files
echo If, in the very rare chance, you ARE KubeBow then hello me! Put in the password.
set /p pass=
if %pass% == iamastupidnerd goto nooroadmoment
exit
:nooroadmoment

cd "C:/Users/Kaden/Desktop/Folder/git/kubebow.github.io/7394"

:: Save all directories that need an index.html in a file
cd> C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394\internal\array-dirs.txt
echo [Looking for directories...]
FOR /D %%f IN (*) DO (
	:: ignore internal directory
	IF /I NOT %%f==internal (
		cd %%f
		cd %%g
		cd
		cd>> C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394\internal\array-dirs.txt
		FOR /D /R %%g IN (*) DO (
			cd %%g
			cd
			cd>> C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394\internal\array-dirs.txt
		)
	)
	cd "C:/Users/Kaden/Desktop/Folder/git/kubebow.github.io/7394"
)
echo.
:: Go through all the directories
FOR /f %%L in (C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394\internal\array-dirs.txt) DO (
	echo [Updating found directory:]
	:: Get parent dir title text
	cd %%L
	cd ..
	cd
	set prntRaw=!CD!
	set prntForm=!prntRaw:~56!
	set prntForm=!prntForm:\=/!
	:: Get current dir title text
	cd %%L
	cd
	set seedeez=!CD!
	set SOFbs=!seedeez:~56!
	set SOFfs=!SOFbs:\=/!
	:: Top of index.html
	echo.> index.html
	echo [Top of index.html]
	FOR %%P IN (C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394\internal\htmltop*) DO (
		:: Add part to file
		type "%%P">> index.html
		:: Add title (unless 7394 or final loop around)
		if /I not !seedeez!==C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394 (
			if /I not %%P==C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394\internal\htmltop3.webpartveryrealfiletype (
				if /I not %%P==C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394\internal\htmltop2.webpartveryrealfiletype (
					echo !SOFfs!>> index.html
				) else (
					:: Redirect to kubebow homepage when going to parent from 7394
					if /I not !prntRaw!==C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io (
						echo /7394>> index.html
						:: Don't use prntForm if 7394 is parent
						if /I not !prntRaw!==C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394 (
							echo !prntForm!>> index.html
						)
					)
				)
			)
		)
	)
	:: Directory items
	echo [Directory items]
	FOR /D %%D IN ("dir /A:D *") DO (
		echo %%D
		type "directory0.webpartveryrealfiletype">> index.html
		echo !SOFfs!>> index.html
		echo %%D>> index.html
		echo /index.html>> index.html
		type "directory1.webpartveryrealfiletype">> index.html
		echo %%D>> index.html
		type "directory2.webpartveryrealfiletype">> index.html
	)
	echo.
)
:: FOR %%f IN (*) DO echo %%f
type "C:\Users\Kaden\Desktop\Folder\git\kubebow.github.io\7394\internal\htmlbottom.webpartveryrealfiletype">> index.html
pause

:: iamastupidnerd