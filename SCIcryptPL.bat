echo off

:start

echo '''''''''''''''''''''''''''''''''''''''''''''''''''
echo '                    SCIcrypt                     '
echo '  Nacisnij przycisk aby wybrac funkcje           '
echo '  Z = szyfrowanie                                '
echo '  O = odszyfrowywanie                            '
echo '                                                 '
echo '  obslugiwane znaki: abcdefghijklmnopqrstuvwxyz_ '
echo '  bez spacji, uzyj _                             '
echo '  duze litery sa traktowane jako male            '
echo '''''''''''''''''''''''''''''''''''''''''''''''''''

choice /C ZO /N

if %ERRORLEVEL% == 1 ( goto encrypt )
if %ERRORLEVEL% == 2 ( goto decrypt )

goto start

:encrypt
set /p string=tekst do zaszyfrowania (bez spacji) : 
set /p kod_1=kod 1/2 (liczba od 0 do 27) : 
set /p kod_2=kod 2/2 (liczba dowolna, najlepiej min. 3-cyfrowa) : 
echo zaszyfrowany tekst:
call clencryptor.bat %string% %kod_1% %kod_2%
goto start

:decrypt
set /p string=tekst do odszyfrowania : 
set /p kod_1=kod 1/2 : 
set /p kod_2=kod 2/2 : 
echo odszyfrowany tekst:
call cldecryptor.bat %string% %kod_1% %kod_2%
goto start