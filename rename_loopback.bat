@REM A batch file that would rename the file names:
@REM 
@REM FROM: something_20201216_163527_7719B214ABA759E0C0DA2F1A64D4D3F9AAE15984.xml
@REM TO:   20201216_163527_7719B214ABA759E0C0DA2F1A64D4D3F9AAE15984_something.xml
@REM 
@REM File name is expected to have 4 parts seperated with an underscore ('_') and the extension '.xml'.
@REM 
@REM You can run the batch file over and over on the renamed file and the parts of the name would rearrange in a round robin fashion.
@REM 
@REM tokens=1-5 : 4 parts of the file name & the extension starting with .
@REM delims=_.	: Token seperating characters, to split the file name (_ and .) 
@REM %%i %%j %%k 
@REM %%l	: Tokens starting from %i since i is our starting point (https://ss64.com/nt/for_f.html, https://ss64.com/nt/for.html)
@REM 
@ECHO OFF
FOR /F "tokens=1-5 delims=_." %%i IN ('DIR /b /a-d *.XML') DO (
	RENAME %%i_%%j_%%k_%%l.xml %%j_%%k_%%l_%%i.xml
)
@ECHO ON
