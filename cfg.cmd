REM attempt to configure OpenCV to build the requisite .pyd file for Python 3 support on Windows x64. Using VS2019 to build
REM remove all build artefacts each run
rm build
mkdir build
cd build
REM modify PYROOT to suit local conditions
set PYROOT=r:/apps/python3
REM 
cmake -G "Visual Studio 16 2019" -A x64 " -DWITH_FFMPEG=Off -D CMAKE_BUILD_TYPE=RELEASE -D BUILD_opencv_python3=On -D PYTHON3_EXECUTABLE="%PYROOT%" -D PYTHON3_INCLUDE_DIR="%PYROOT%/include" -D PYTHON3_LIBRARY="%PYROOT%/libs/python37.lib" -D PYTHON3_LIBRARY="%PYROOT%/libs" -D PYTHON3_LIBRARY_DEBUG="%PYROOT%/libs/python37_d.lib" -D PYTHON3_PACKAGES_PATH="%PYROOT%/Lib/site-packages" -D OPENCV_FORCE_PYTHON_LIBS=On -D PYTHON3_NUMPY_INCLUDE_DIRS="%PYROOT%/lib/site-packages/numpy/core/include" -D CMAKE_INSTALL_PREFIX=r:/src/libs/opencv/install" -D WITH_CUDA=Off PYTHON3_NUMPY_VERSION="1.16.3" .. > ../config.log
cd ..
