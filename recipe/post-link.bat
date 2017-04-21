@echo on

"java.exe" -classpath "%PREFIX%\opt\scijava-jupyter-kernel\*"^
           "org.scijava.jupyter.commands.InstallScijavaKernel" ^
           -pythonBinaryPath "%PREFIX%\python.exe" ^
           -verbose "info" ^
           -classpath "%PREFIX%\opt\scijava-jupyter-kernel\*" ^
           -installAllKernels
