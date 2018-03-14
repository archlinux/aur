# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=opencv
_ippicv_ver='2017u3'
_ippicv_date='20170822'
_tinydnn_ver='1.0.0a3'
_dnn_face_detector_file='res10_300x300_ssd_iter_140000.caffemodel'
_ippicv_commit='dfe3162c237af211e98b8960018b564bc209261d'
_bootdesc_commit='34e4206aef44d50e6bbcd0ab06354b52e7466d26'
_vgg_commit='fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d'
_dnn_face_detector_commit='b2bfc75f6aea5b1f834ff0f0b865a7c18ff1459f'
_face_landmakr_model_commit='8afa57abc8229d611c4937165d20e2a2d9fc5a12'

pkgname=opencv-gstreamer
pkgver=3.4.1
pkgrel=1
pkgdesc='Open Source Computer Vision Library (no Xine/FFmpeg dependency, uses GStreamer)'
arch=('i686' 'x86_64')
url='https://opencv.org/'
license=('BSD')
depends=('intel-tbb' 'openexr' 'gstreamer' 'gst-plugins-base-libs' 'v4l-utils'
         'libdc1394' 'libwebp' 'cblas' 'lapack' 'libgphoto2' 'jasper')
makedepends=('cmake' 'python-numpy' 'python2-numpy' 'mesa' 'eigen' 'hdf5'
             'gtkglext' 'lapacke')
optdepends=('opencv-samples'
            'gtkglext: for the HighGUI module'
            'hdf5: support for HDF5 format'
            'opencl-icd-loader: For coding with OpenCL'
            'python-numpy: Python 3 interface'
            'python2-numpy: Python 2 interface')
provides=('opencv')
conflicts=('opencv' 'opencv-git')
options=('staticlibs')
source=("opencv-${pkgver}.tar.gz"::"https://github.com/opencv/opencv/archive/${pkgver}.tar.gz"
        "opencv_contrib-${pkgver}.tar.gz"::"https://github.com/opencv/opencv_contrib/archive/${pkgver}.tar.gz"
        "tinydnn-${_tinydnn_ver}.tar.gz"::"https://github.com/tiny-dnn/tiny-dnn/archive/v${_tinydnn_ver}.tar.gz"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_dnn_face_detector_commit}/${_dnn_face_detector_file}"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_face_landmakr_model_commit}/face_landmark_model.dat"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_bootdesc_commit}/boostdesc_bgm.i"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_bootdesc_commit}/boostdesc_bgm_bi.i"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_bootdesc_commit}/boostdesc_bgm_hd.i"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_bootdesc_commit}/boostdesc_binboost_064.i"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_bootdesc_commit}/boostdesc_binboost_128.i"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_bootdesc_commit}/boostdesc_binboost_256.i"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_bootdesc_commit}/boostdesc_lbgm.i"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_vgg_commit}/vgg_generated_48.i"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_vgg_commit}/vgg_generated_64.i"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_vgg_commit}/vgg_generated_80.i"
        "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${_vgg_commit}/vgg_generated_120.i")
source_i686=("https://github.com/opencv/opencv_3rdparty/raw/${_ippicv_commit}/ippicv/ippicv_${_ippicv_ver}_lnx_ia32_general_${_ippicv_date}.tgz")
source_x86_64=("https://github.com/opencv/opencv_3rdparty/raw/${_ippicv_commit}/ippicv/ippicv_${_ippicv_ver}_lnx_intel64_general_${_ippicv_date}.tgz")
noextract=("ippicv_${_ippicv_ver}_lnx_ia32_general_${_ippicv_date}.tgz"
           "ippicv_${_ippicv_ver}_lnx_intel64_general_${_ippicv_date}.tgz"
           "tinydnn-${_tinydnn_ver}.tar.gz")
sha256sums=('f1b87684d75496a1054405ae3ee0b6573acaf3dad39eaf4f1d66fdd7e03dc852'
            '298c69ee006d7675e1ff9d371ba8b0d9e7e88374bb7ba0f9d0789851d352ec6e'
            'e2c61ce8c5debaa644121179e9dbdcf83f497f39de853f8dd5175846505aa18b'
            '2a56a11a57a4a295956b0660b4a3d76bbdca2206c4961cea8efe7d95c7cb2f2d'
            'eeab592db2861a6c94d592a48456cf59945d31483ce94a6bc4d3a4e318049ba3'
            'c441a027f15b9b8ff6c006b0775cd86781169ebd5b6257a94bdce668010d5df5'
            '3d54b2934f0de963abbce985da303254ee78eebd05eb2af517105f9b0e670566'
            '4b068631287f9914c3aa5bbdab76368b01493cea494ab47f7a70d2fa4f1c3e1b'
            '090c9cc50663df3a91f2d7c704fa664493c96c39749b4cee9ebc29a20eb680d2'
            '8f3622c1f3c0a14b1f1b7b955c518e97f7ccd0e9796e1dd9e7a975aad9bb2a22'
            'a1c778059332b4904c9ce30ed888e9dd2e44621579362e6deb20ef4f4b0cf819'
            '42f6091199242fb6d96aec2f25644cd6f5e5f2fdddd1720f3422282e88cf3cd8'
            '71274a67ab0896865e27de830eda0065e387d75fe071dab4a887e2430ccb8a35'
            '2746c272af82b9a839a69de151c262be55d9ef8464b268001c33f99f9f5cebbe'
            '08fbc8cb1686b6c45032a08c98f3857ead4755116410e16c68713f4dea4cbf5c'
            'f05e7eb7183ecbc788bfc26cea9db7dad8585178175411b93e444acdc8fb2048')
sha256sums_i686=('ee57bc33d65cc18364feb0a398cf208214ab9a5814aa41e67e55b7298ee45bd6')
sha256sums_x86_64=('9a4b14a24d31768c3ead0720f27d55dcf80723b5ba1cd8903bed1fd69f1b9e2e')

prepare() {
    # cmake downloads some needed files, but here they have been already downloaded by makepkg.
    # place these needed files in cmake cache directory to not redownload them during cmake execution.
    
    [ "$CARCH" = 'i686'   ] && local _ippicv_arch='ia32'
    [ "$CARCH" = 'x86_64' ] && local _ippicv_arch='intel64'
    
    local _ippicv_file="ippicv_${_ippicv_ver}_lnx_${_ippicv_arch}_general_${_ippicv_date}.tgz"
    local _tinydnn_file="tinydnn-${_tinydnn_ver}.tar.gz"
    
    local _cmake_cache="${srcdir}/${_srcname}-${pkgver}/.cache"
    local _ippicv_dir="${_cmake_cache}/ippicv"
    local _tinydnn_dir="${_cmake_cache}/tiny_dnn"
    local _dnn_face_detector_dir="${_cmake_cache}/dnn_face_detector"
    local _face_landmakr_model_dir="${_cmake_cache}/data"
    local _boostdesc_dir="${_cmake_cache}/xfeatures2d/boostdesc"
    local _vgg_dir="${_cmake_cache}/xfeatures2d/vgg"
    
    local _ippicv_md5="$(                openssl dgst -md5 "${_ippicv_file}"            | awk '{ print $2 }')"
    local _tinydnn_md5="$(               openssl dgst -md5 "${_tinydnn_file}"           | awk '{ print $2 }')"
    local _dnn_face_detector_md5="$(     openssl dgst -md5 "${_dnn_face_detector_file}" | awk '{ print $2 }')"
    local _face_landmakr_model_md5="$(   openssl dgst -md5 'face_landmark_model.dat'    | awk '{ print $2 }')"
    local _boostdesc_bgm_md5="$(         openssl dgst -md5 'boostdesc_bgm.i'            | awk '{ print $2 }')"
    local _boostdesc_bgm_bi_md5="$(      openssl dgst -md5 'boostdesc_bgm_bi.i'         | awk '{ print $2 }')"
    local _boostdesc_bgm_hd_md5="$(      openssl dgst -md5 'boostdesc_bgm_hd.i'         | awk '{ print $2 }')"
    local _boostdesc_binboost_064_md5="$(openssl dgst -md5 'boostdesc_binboost_064.i'   | awk '{ print $2 }')"
    local _boostdesc_binboost_128_md5="$(openssl dgst -md5 'boostdesc_binboost_128.i'   | awk '{ print $2 }')"
    local _boostdesc_binboost_256_md5="$(openssl dgst -md5 'boostdesc_binboost_256.i'   | awk '{ print $2 }')"
    local _boostdesc_lbgm_md5="$(        openssl dgst -md5 'boostdesc_lbgm.i'           | awk '{ print $2 }')"
    local _vgg_generated_48_md5="$(      openssl dgst -md5 'vgg_generated_48.i'         | awk '{ print $2 }')"
    local _vgg_generated_64_md5="$(      openssl dgst -md5 'vgg_generated_64.i'         | awk '{ print $2 }')"
    local _vgg_generated_80_md5="$(      openssl dgst -md5 'vgg_generated_80.i'         | awk '{ print $2 }')"
    local _vgg_generated_120_md5="$(     openssl dgst -md5 'vgg_generated_120.i'        | awk '{ print $2 }')"
    
    mkdir -p "${_cmake_cache}/"{ippicv,tiny_dnn,dnn_face_detector,data,xfeatures2d/{boostdesc,vgg}}
    
    cp -a "${_ippicv_file}"            "${_ippicv_dir}/${_ippicv_md5}-${_ippicv_file}"
    cp -a "${_tinydnn_file}"           "${_tinydnn_dir}/${_tinydnn_md5}-v${_tinydnn_ver}.tar.gz"
    cp -a "${_dnn_face_detector_file}" "${_dnn_face_detector_dir}/${_dnn_face_detector_md5}-${_dnn_face_detector_file}"
    cp -a 'face_landmark_model.dat'    "${_face_landmakr_model_dir}/${_face_landmakr_model_md5}-face_landmark_model.dat"
    cp -a 'boostdesc_bgm.i'            "${_boostdesc_dir}/${_boostdesc_bgm_md5}-boostdesc_bgm.i"
    cp -a 'boostdesc_bgm_bi.i'         "${_boostdesc_dir}/${_boostdesc_bgm_bi_md5}-boostdesc_bgm_bi.i"
    cp -a 'boostdesc_bgm_hd.i'         "${_boostdesc_dir}/${_boostdesc_bgm_hd_md5}-boostdesc_bgm_hd.i"
    cp -a 'boostdesc_binboost_064.i'   "${_boostdesc_dir}/${_boostdesc_binboost_064_md5}-boostdesc_binboost_064.i"
    cp -a 'boostdesc_binboost_128.i'   "${_boostdesc_dir}/${_boostdesc_binboost_128_md5}-boostdesc_binboost_128.i"
    cp -a 'boostdesc_binboost_256.i'   "${_boostdesc_dir}/${_boostdesc_binboost_256_md5}-boostdesc_binboost_256.i"
    cp -a 'boostdesc_lbgm.i'           "${_boostdesc_dir}/${_boostdesc_lbgm_md5}-boostdesc_lbgm.i"
    cp -a 'vgg_generated_48.i'         "${_vgg_dir}/${_vgg_generated_48_md5}-vgg_generated_48.i"
    cp -a 'vgg_generated_64.i'         "${_vgg_dir}/${_vgg_generated_64_md5}-vgg_generated_64.i"
    cp -a 'vgg_generated_80.i'         "${_vgg_dir}/${_vgg_generated_80_md5}-vgg_generated_80.i"
    cp -a 'vgg_generated_120.i'        "${_vgg_dir}/${_vgg_generated_120_md5}-vgg_generated_120.i"
}

build() {
    cd "${_srcname}-${pkgver}"
    mkdir -p build
    cd build
    
    # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
    cmake \
        -DBUILD_DOCS:BOOL='OFF' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DBUILD_opencv_java:BOOL='OFF' \
        -DENABLE_FAST_MATH:BOOL='ON' \
        -DENABLE_PRECOMPILED_HEADERS:BOOL='OFF' \
        -DBUILD_WITH_DEBUG_INFO='OFF' \
        -DBUILD_TESTS='OFF' \
        -DBUILD_PERF_TESTS='OFF' \
        -DBUILD_EXAMPLES='ON' \
        -DINSTALL_C_EXAMPLES='ON' \
        -DINSTALL_PYTHON_EXAMPLES='ON' \
        -DCMAKE_COLOR_MAKEFILE:BOOL='ON' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -DOPENCV_EXTRA_MODULES_PATH="${srcdir}/opencv_contrib-${pkgver}/modules" \
        -DLAPACK_LIBRARIES='/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so' \
        -DLAPACK_CBLAS_H='/usr/include/cblas.h' \
        -DLAPACK_LAPACKE_H='/usr/include/lapacke.h' \
        -DWITH_CUDA:BOOL='OFF' \
        -DWITH_FFMPEG:BOOL='OFF' \
        -DWITH_GPHOTO2:BOOL='ON' \
        -DWITH_GSTREAMER:BOOL='ON' \
        -DWITH_GTK_2_X:BOOL='ON' \
        -DWITH_IPP:BOOL='ON' \
        -DWITH_LAPACK:BOOL='ON' \
        -DWITH_LIBV4L:BOOL='ON' \
        -DWITH_OPENCL='ON' \
        -DWITH_OPENGL='ON' \
        -DWITH_TBB='ON' \
        -DWITH_VTK:BOOL='OFF' \
        -DWITH_XINE:BOOL='OFF' \
        -DOPENCV_WARNINGS_ARE_ERRORS:BOOL='OFF' \
        -Wno-dev \
        ..
        
    make
}

package() {
    cd "${_srcname}-${pkgver}/build"
    make DESTDIR="$pkgdir" install
    
    cd "${srcdir}/${_srcname}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
