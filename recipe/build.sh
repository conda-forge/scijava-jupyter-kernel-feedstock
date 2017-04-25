#!/bin/bash -euo

# Install Scijava Jupyter Kernel
cd $SRC_DIR/
mkdir -p "$PREFIX/opt/scijava-jupyter-kernel"
mvn clean install dependency:copy-dependencies -Pconda --settings "$RECIPE_DIR/settings.xml"

# TODO: tell Maven to also copy the main artifact !
cp $SRC_DIR/target/scijava-jupyter-kernel-*.jar "$PREFIX/opt/scijava-jupyter-kernel/"
