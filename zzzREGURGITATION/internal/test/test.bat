echo [([ RESULT ])]> result.atxt
echo.>> result.atxt
FOR %%f IN ("*.txt") DO (
	echo [ "%%f" ]>> result.atxt
	type "%%f">> result.atxt
	echo.>> result.atxt )
pause