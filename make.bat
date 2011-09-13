@ECHO OFF
setlocal

REM Command file for Sphinx documentation

REM repos
set REPO_SPHINX_PHP=git://github.com/fabpot/sphinx-php.git
set DIR_SPHINX_PHP=misc/sphinx-php
set REPO_SRC=git://github.com/symfony/symfony-docs.git
set REPO_DST=git://github.com/symfony-japan/symfony-docs-ja.git

REM You can set these variables from the command line.
if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build -c misc
)
set TRANSLANG=ja
set SPHINXOPTS_SRC=-D language=%TRANSLANG%
set SPHINXOPTS_DST=
set PAPER=
set SOURCEDIR_SRC=source-en
set SOURCEDIR_DST=source-%TRANSLANG%
set BUILDDIR_SRC=build-en
set BUILDDIR_DST=build-%TRANSLANG%

REM Internal variables.
set PAPEROPT_a4=-D latex_paper_size=a4
set PAPEROPT_letter=-D latex_paper_size=letter
set ALLSPHINXOPTS_SRC=-d %BUILDDIR_SRC%/doctrees %SPHINXOPTS_SRC% %SOURCEDIR_SRC%
set ALLSPHINXOPTS_DST=-d %BUILDDIR_DST%/doctrees %SPHINXOPTS_DST% %SOURCEDIR_DST%

if "%1" == "" goto help

if "%1" == "help" (
	:help
	echo.Please use `make ^<target^>` where ^<target^> is one of
	echo.  html       to make standalone HTML files
	echo.  html-src   to make standalone HTML files for SRC
	echo.  html-dst   to make standalone HTML files for DST
	echo.  clean      to clean HTML files
	echo.  clean-src  to clean HTML files for SRC
	echo.  clean-dst  to clean HTML files for DST
	goto end
)

if "%1" == "setting" (
	git submodule add %REPO_SPHINX_PHP% %DIR_SPHINX_PHP%
	git submodule add %REPO_SRC% %SOURCEDIR_SRC%
	git submodule add %REPO_DST% %SOURCEDIR_DST%
	git submodule update --init %SOURCEDIR_SRC%
	git submodule update --init %SROUCEDIR_DST%
	git submodule update --init %DIR_SPHINX_PHP%
	mkdir %BUILDDIR_SRC%
	mkdir %BUILDDIR_DST%
	goto end
)

if "%1" == "clean" (
	for /d %%i in (%BUILDDIR_SRC%\*) do rmdir /q /s %%i
	del /q /s %BUILDDIR_SRC%\*
	for /d %%i in (%BUILDDIR_DST%\*) do rmdir /q /s %%i
	del /q /s %BUILDDIR_DST%\*
)

if "%1" == "clean-src" (
	for /d %%i in (%BUILDDIR_SRC%\*) do rmdir /q /s %%i
	del /q /s %BUILDDIR_SRC%\*
	goto end
)

if "%1" == "clean-dst" (
	for /d %%i in (%BUILDDIR_DST%\*) do rmdir /q /s %%i
	del /q /s %BUILDDIR_DST%\*
	goto end
)

if "%1" == "html" (
	%SPHINXBUILD% -b html %ALLSPHINXOPTS_SRC% %BUILDDIR_SRC%/html
	if errorlevel 1 exit /b 1
	echo.
	echo.Build finished. The HTML pages are in %BUILDDIR_SRC%/html.
	%SPHINXBUILD% -b html %ALLSPHINXOPTS_DST% %BUILDDIR_DST%/html
	if errorlevel 1 exit /b 1
	echo.
	echo.Build finished. The HTML pages are in %BUILDDIR_DST%/html.
	goto end
)

if "%1" == "html-src" (
	%SPHINXBUILD% -b html %ALLSPHINXOPTS_SRC% %BUILDDIR_SRC%/html
	if errorlevel 1 exit /b 1
	echo.
	echo.Build finished. The HTML pages are in %BUILDDIR_SRC%/html.
	goto end
)

if "%1" == "html-dst" (
	%SPHINXBUILD% -b html %ALLSPHINXOPTS_DST% %BUILDDIR_DST%/html
	if errorlevel 1 exit /b 1
	echo.
	echo.Build finished. The HTML pages are in %BUILDDIR_DST%/html.
	goto end
)

:end
endlocal
