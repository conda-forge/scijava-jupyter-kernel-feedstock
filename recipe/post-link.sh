#!/bin/bash -euo

"${PREFIX}/bin/java" -classpath "${PREFIX}/opt/scijava-jupyter-kernel/*" \
                     "org.scijava.jupyter.commands.InstallScijavaKernel" \
                     -pythonBinaryPath "$(which python)" \
                     -verbose "info" \
                     -classpath "${PREFIX}/opt/scijava-jupyter-kernel/*" \
                     -javaBinaryPath "${PREFIX}/bin/java" \
