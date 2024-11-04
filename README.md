# ASTR code 
Version 2.0 

ASTR code is a high-order finite-difference flow solver for compressible turbulence research. This project explores the usage of CUDA-Fortran to parallelise the ASTR code. The tgv solver for a 3D case has been parallelised using CUDA.

# Download, Installation and Compilation
Required dependencies: Fortran 90, NVIDIA HPC SDK, CMAKE

The installation guide for NVIDIA HPC SDK can be found at [Installation Guide](https://docs.nvidia.com/hpc-sdk/hpc-sdk-install-guide/index.html)

## Download the gpu accelerated astr code:

git clone [https://github.com/terencel411/astr-gpu-acceleration.git](https://github.com/terencel411/astr-gpu-acceleration.git)

## Compilation:
The Makefile gives a more complete and safe way of compiling and installing the code.

Go to the directory where the miniapps code is present

cd astr/miniapps/tgv_solver_3d

There cpu and the gpu accelerated code are present in the same directory, which can be compiled using the following cmake commands

Compile and execute the cpu code

cmake cpu

Compile and execute the gpu accelerated code

cmake gpu

## Acceleration Comparison
To make the compare the acceleration obtained
cmake compare

A text file 'time_report.txt' will be generated with the accelerations details.






