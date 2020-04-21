echo off

:start

echo '''''''''''''''''''''''''''''''''''''''''''''''''''
echo '                    SCIcrypt                     '
echo '  press a key to select action                   '
echo '  E = encrypt                                    '
echo '  D = decrypt                                    '
echo '                                                 '
echo '  usable characters: abcdefghijklmnopqrstuvwxyz_ '
echo '  no spaces, use _                               '
echo '  capital letters treated as lower case          '
echo '''''''''''''''''''''''''''''''''''''''''''''''''''

choice /C ED /N

if %ERRORLEVEL% == 1 ( goto encrypt )
if %ERRORLEVEL% == 2 ( goto decrypt )

goto start

:encrypt
set /p string=text to encrypt (no spaces) : 
set /p kod_1=key 1/2 (number between 0 and 27) : 
set /p kod_2=key 2/2 (number above 0, best 3-digit) : 
echo encrypted text:
call clencryptor.bat %string% %kod_1% %kod_2%
goto start

:decrypt
set /p string=text to decrypt : 
set /p kod_1=key 1/2 : 
set /p kod_2=key 2/2 : 
echo decrypted text:
call cldecryptor.bat %string% %kod_1% %kod_2%
goto start