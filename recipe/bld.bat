@echo on

rem Install Beakerx...waiting for a Maven artifact.
rem This manual installation will be removed as soon as BeakerX release Maven artifact.

cd "%RECIPE_DIR%"
git clone https://github.com/twosigma/beakerx.git
if errorlevel 1 exit 1

cd beakerx\
git checkout 3b7dc90e209a73516d5241b10fd72148301fde0d
if errorlevel 1 exit 1

call gradlew.bat -p kernel\base publishToMavenLocal
if errorlevel 1 exit 1

cd "%RECIPE_DIR%"
RMDIR beakerx

rem rem Install Scijava Jupyter Kernel
cd "%SRC_DIR%"
md "%PREFIX%\opt\scijava-jupyter-kernel"
if errorlevel 1 exit 1

call mvn clean install dependency:copy-dependencies -Pconda --settings "%RECIPE_DIR%\settings.xml"
if errorlevel 1 exit 1

copy "target\scijava-jupyter-kernel-*" "%PREFIX%\opt\scijava-jupyter-kernel"
if errorlevel 1 exit 1
