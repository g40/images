REM attempt to configure OpenCV to build the requisite .pyd file for Python 3 support on Windows x64. Using VS2019 to build
REM remove all build artefacts each run
rm -rf build
rm -rf .cache
mkdir build
cd build
REM modify PYROOT to suit local conditions
set PYROOT=r:/apps/python3
REM where the OpenCV root folder is located
set OCVROOT=r:/src/libs
REM caution ^ (caret) is used in .cmd files for line continuation.
cmake -G "Visual Studio 16 2019" -A "x64"^
 -DCMAKE_BUILD_TYPE=RELEASE^
 -DBUILD_SHARED_LIBS=OFF^
 -DBUILD_WITH_STATIC_CRT=OFF^
 -DBUILD_WITH_DEBUG_INFO=OFF^
 -DBUILD_PACKAGE=On^
 -DBUILD_opencv_python3=On^
 -DPYTHON_LIBRARIES="%PYROOT%/libs"^
 -DPYTHON_INCLUDE_DIRS="%PYROOT%/include"^
 -DPYTHON3_EXECUTABLE="%PYROOT%/python.exe"^
 -DPYTHON3_INCLUDE_DIR="%PYROOT%/include"^
 -DPYTHON3_INCLUDE_PATH="%PYROOT%/include"^
 -DPYTHON3_LIBRARY="%PYROOT%/libs/python37.lib"^
 -DPYTHON3_LIBRARY_DEBUG="%PYROOT%/libs/python37_d.lib"^
 -DPYTHON3_PACKAGES_PATH="%PYROOT%/Lib/site-packages"^
 -DPYTHON3_NUMPY_INCLUDE_DIRS="%PYROOT%/lib/site-packages/numpy/core/include"^
 -DCMAKE_INSTALL_PREFIX="%OCVROOT%/opencv/install"^
 -DOPENCV_FORCE_PYTHON_LIBS=On^
 -DINSTALL_C_EXAMPLES=On^
 -DINSTALL_PYTHON_EXAMPLES=On^
 -DPYTHON3_NUMPY_VERSION="1.16.3"^
 -DBUILD_opencv_flann=Off^
 -DBUILD_opencv_stitching=Off^
 -DBUILD_opencv_highgui=Off^
 -DBUILD_opencv_dnn=Off^
 -DBUILD_opencv_features2d=Off^
 -DBUILD_opencv_photo=Off^
 -DBUILD_opencv_calib3d=Off^
 -DBUILD_opencv_objdetect=Off^
 -DBUILD_opencv_ts=Off^
 -DWITH_CAROTENE=OFF^
 -DWITH_NVCUVID=OFF^
 -DWITH_OPENCL_SVM=OFF^
 -DWITH_OPENCLAMDFFT=OFF^
 -DWITH_OPENCLAMDBLAS=OFF^
 -DWITH_OPENEXR=OFF^
 -DWITH_MATLAB=OFF^
 -DWITH_GTK=OFF^
 -DWITH_GSTREAMER=OFF^
 -DWITH_GPHOTO2=OFF^
 -DWITH_FFMPEG=OFF^
 -DWITH_CUBLAS=OFF^
 -DWITH_CUDA=OFF^
 -DWITH_CUFFT=OFF^
 -DWITH_EIGEN=OFF^
 -DWITH_VTK=OFF^
 -DWITH_JASPER=OFF^
 -DWITH_WEBP=OFF^
 -DWITH_1394=OFF^
 .. > ../config.log 2>&1
 REM return to OpenCV root directory
cd ..
