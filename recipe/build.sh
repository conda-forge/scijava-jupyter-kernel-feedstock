#!/bin/bash -euo

# Install Beakerx...
# ...waiting for a Maven artifact.
# This manual installation will be removed as soon as BeakerX release Maven artifact.
cd $RECIPE_DIR/

git clone https://github.com/twosigma/beakerx.git
cd beakerx/
git checkout 3b7dc90e209a73516d5241b10fd72148301fde0d
./gradlew --no-daemon -p kernel/base publishToMavenLocal
cd $RECIPE_DIR/ && rm -fr beakerx

# Install Scijava Jupyter Kernel
cd $SRC_DIR/
mkdir -p "$PREFIX/opt/scijava-jupyter-kernel"
mvn clean install dependency:copy-dependencies -Pconda --settings "$RECIPE_DIR/settings.xml"

# TODO: tell Maven to also copy the main artifact !
cp $SRC_DIR/target/scijava-jupyter-kernel-*.jar "$PREFIX/opt/scijava-jupyter-kernel/"
