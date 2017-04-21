@echo on

rem Install Beakerx...waiting for a Maven artifact.
rem This manual installation will be removed as soon as BeakerX release Maven artifact.
git clone --depth 1 https://github.com/twosigma/beakerx.git
CD beakerx
git checkout master
rem git checkout 3b7dc90e209a73516d5241b10fd72148301fde0d
CALL gradlew.bat -p kernel\base publishToMavenLocal
CD ..

rem Install Scijava Jupyter Kernel
MD "%PREFIX%\opt\scijava-jupyter-kernel"
"mvn" clean install -Pconda "%RECIPE_DIR%\settings.xml"
"mvn" dependency:copy-dependencies -Pconda "%RECIPE_DIR%\settings.xml"

rem TODO: tell Maven to also copy the main artifact !
COPY /B "%PREFIX%\target\scijava-jupyter-kernel-*.jar" "%PREFIX%\opt\scijava-jupyter-kernel\"

RMDIR beakerx
