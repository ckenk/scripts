@REM http://stackoverflow.com/questions/138497/iterate-all-files-in-a-directory-using-a-for-loop
@REM http://stackoverflow.com/questions/4366707/getting-the-full-name-of-a-files-parent-directory-in-batch-script
@REM http://stackoverflow.com/questions/2396003/get-parent-directory-name-for-a-particular-file-using-dos-batch-scripting


@REM Unzip multiple zip files, each to a folder havaing the same name of the zip file.
@REM Content of the zip file will be in the folder and then another script can be run to process each.
@REM In this case, the files inside the folders are expected to be files with '.log' extension and 
@REM their names are passed in to a another script to be processed.
@REM
@REM %~dI - expands %I to a drive letter only
@REM %~pI - expands %I to a path only
@REM %~nI - expands %I to a file name only
@echo off
for /R %%f in (*.zip) do (
    UNZIP -o %%f -d %%~dpf%%~nf
)

for /R %%g in (*.log) do (
	@echo Processing: %%g
	
	@REM call another batch file for processing each log file
	@CALL <process_logs>.bat %%g
)
@echo on
