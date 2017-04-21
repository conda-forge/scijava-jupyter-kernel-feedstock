@echo on

rem Install Beakerx...waiting for a Maven artifact.
rem This manual installation will be removed as soon as BeakerX release Maven artifact.
git clone https://github.com/twosigma/beakerx.git
CD beakerx
git checkout 3b7dc90e209a73516d5241b10fd72148301fde0d
CALL gradlew.bat -p kernel\base publishToMavenLocal
CD ..

rem Install Maven (see https://github.com/conda-forge/maven-feedstock/issues/1)
powershell -nologo -noprofile -Command "Invoke-WebRequest http://apache.mirror.rafal.ca/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.zip -OutFile apache-maven-3.5.0-bin.zip" && if errorlevel 1 exit 1
powershell -nologo -noprofile -Command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('apache-maven-3.5.0-bin.zip', 'maven'); }" && if errorlevel 1 exit 1
DEL apache-maven-3.5.0-bin.zip

rem Install Scijava Jupyter Kernel
MD "%PREFIX%\opt\scijava-jupyter-kernel"
"%SRC_DIR%\maven\apache-maven-3.5.0\bin\mvn" clean install -Pconda "%RECIPE_DIR%\settings.xml" && if errorlevel 1 exit 1
"%SRC_DIR%\maven\apache-maven-3.5.0\bin\mvn" dependency:copy-dependencies -Pconda "%RECIPE_DIR%\settings.xml" && if errorlevel 1 exit 1

rem TODO: tell Maven to also copy the main artifact !
COPY /B "%PREFIX%\target\scijava-jupyter-kernel-*.jar" "%PREFIX%\opt\scijava-jupyter-kernel\"


RMDIR maven
RMDIR beakerx
