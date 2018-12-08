@REM 2018-08-03
@REM show hash values of a file:
@REM   MD2 MD4 MD5 SHA1 SHA256 SHA384 SHA512
@ECHO OFF

ECHO MD5:
certutil -hashfile %1 MD5 | findstr /R "^[a-z0-9]*$"
ECHO SHA1:
certutil -hashfile %1 SHA1 | findstr /R "^[a-z0-9]*$"
ECHO SHA256:
certutil -hashfile %1 SHA256 | findstr /R "^[a-z0-9]*$"