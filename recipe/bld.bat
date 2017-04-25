@echo on

rem rem Install Scijava Jupyter Kernel
cd "%SRC_DIR%"
md "%PREFIX%\opt\scijava-jupyter-kernel"
if errorlevel 1 exit 1

call mvn clean install dependency:copy-dependencies -Pconda --settings "%RECIPE_DIR%\settings.xml"
if errorlevel 1 exit 1

copy "target\scijava-jupyter-kernel-*" "%PREFIX%\opt\scijava-jupyter-kernel"
if errorlevel 1 exit 1
