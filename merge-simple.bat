@echo off
echo Merging csgocafe.cf and csgocafebot folders...

rem Create destination directory if it doesn't exist
if not exist "C:\Users\Administrator\Desktop\csgocafe-github" mkdir "C:\Users\Administrator\Desktop\csgocafe-github"

rem Copy all files from csgocafe.cf
echo Copying files from csgocafe.cf...
xcopy "C:\Users\Administrator\Desktop\csgocafe.cf\*" "C:\Users\Administrator\Desktop\csgocafe-github\" /E /H /C /I /Y /EXCLUDE:exclusions.txt

rem Copy all files from csgocafebot
echo Copying files from csgocafebot...
xcopy "C:\Users\Administrator\Desktop\csgocafebot\*" "C:\Users\Administrator\Desktop\csgocafe-github\" /E /H /C /I /Y /EXCLUDE:exclusions.txt

rem Copy template files specifically
echo Copying template files...
copy "C:\Users\Administrator\Desktop\csgocafe-merged\config.template.js" "C:\Users\Administrator\Desktop\csgocafe-github\" /Y
copy "C:\Users\Administrator\Desktop\csgocafe-merged\steambot.config.template.js" "C:\Users\Administrator\Desktop\csgocafe-github\" /Y
copy "C:\Users\Administrator\Desktop\csgocafe-merged\.gitignore" "C:\Users\Administrator\Desktop\csgocafe-github\" /Y
copy "C:\Users\Administrator\Desktop\csgocafe-merged\README.md" "C:\Users\Administrator\Desktop\csgocafe-github\" /Y
copy "C:\Users\Administrator\Desktop\csgocafe-merged\DOCUMENTATION.md" "C:\Users\Administrator\Desktop\csgocafe-github\" /Y

echo Merge complete! Files are in C:\Users\Administrator\Desktop\csgocafe-github 