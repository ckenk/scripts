@REM A batch file that would rename the flash logs to something like this:
@REM 
@REM FROM: something_20201216_163527_7719B214ABA759E0C0DA2F1A64D4D3F9AAE15984.xml
@REM TO:   20201216_163527_7719B214ABA759E0C0DA2F1A64D4D3F9AAE15984_something.xml
@REM
@REM You can run the batch file over and over on the renamed file and the parts of the name would rearrange in a round robin fashion
@REM 
@ECHO OFF
FOR /F "tokens=1-5 delims=_." %%i IN ('DIR /b /a-d *.XML') DO (
	RENAME %%i_%%j_%%k_%%l.xml %%j_%%k_%%l_%%i.xml
)
@ECHO ON