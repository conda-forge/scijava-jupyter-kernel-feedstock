from jupyter_client.kernelspec import KernelSpecManager

manager = KernelSpecManager()
kernels = manager.get_all_specs().keys()

assert "scijava" in kernels

print("Scijava kernel correctly installed.")
