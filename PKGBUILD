# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=ffmpeg-full-git
pkgver=8.1.r122018.gfacc32b0d8
pkgrel=1
_svt_hevc_ver='4181c9ee0611baefb40b4c0ed10023cfd837d522'
_svt_vp9_ver='290fb8c3662ed76a8887b587a9b8201878ba71ed'
_whispercpp_ver='1.8.2'
pkgdesc='Complete solution to record, convert and stream audio and video (all possible features including libfdk-aac; git version)'
arch=('x86_64')
url='https://ffmpeg.org/'
license=('LicenseRef-nonfree-and-unredistributable')
depends=(
    'alsa-lib'
    'aom'
    'aribb24'
    'avisynthplus' # loaded on-demand by dlopen()
    'bzip2'
    'cairo'
    'celt'
    'chromaprint-fftw'
    'codec2'
    'dav1d'
    'davs2'
    'flite1'
    'fontconfig'
    'freetype2'
    'frei0r-plugins' # loaded on-demand by dlopen()
    'fribidi'
    'gcc-libs'
    'glib2'
    'glibc'
    'glslang'
    'gnutls'
    'gsm'
    'harfbuzz'
    'jack'
    'kvazaar'
    'ladspa' # loaded on-demand by dlopen()
    'lame'
    'lcevcdec'
    'lcms2'
    'libaribcaption'
    'libass'
    'libavc1394'
    'libbluray'
    'libbs2b'
    'libcaca'
    'libcdio-paranoia'
    'libdc1394'
    'libdrm'
    'libdvdnav'
    'libdvdread'
    'libfdk-aac'
    'libgcrypt'
    'libgme'
    'libiec61883'
    'libilbc'
    'libjxl'
    'libklvanc'
    'liblc3'
    'libmodplug'
    'libmysofa'
    'libopenmpt'
    'libplacebo'
    'libpulse'
    'librabbitmq-c'
    'libraw1394'
    'librist'
    'librsvg'
    'libsoxr'
    'libssh'
    'libtheora'
    'libva'
    'libvdpau'
    'libvorbis'
    'libvpl'
    'libvpx'
    'libx11'
    'libxcb'
    'libxext'
    'libxml2'
    'libxv'
    'libwebp'
    'lilv'
    'mpeghdec'
    'ocl-icd'
    'openal'
    'openapv'
    'opencore-amr'
    'opencv'
    'openh264'
    'openjpeg2'
    'openvino'
    'opus'
    'qrencode'
    'quirc'
    'rav1e'
    'rockchip-mpp'
    'rtmpdump'
    'rubberband'
    'sdl2'
    'shine'
    'smbclient'
    'snappy'
    'sndio'
    'speex'
    'srt'
    'svt-av1'
    'svt-hevc'
    'svt-vp9'
    'tesseract'
    'twolame'
    'uavs3d-git'
    'v4l-utils'
    'vapoursynth' # loaded on-demand by dlopen()
    'vid.stab'
    'vmaf'
    'vo-amrwbenc'
    'vulkan-icd-loader' # loaded on-demand by dlopen()
    'vvenc'
    'x264'
    'x265'
    'xavs'
    'xavs2'
    'xevd'
    'xeve'
    'xvidcore'
    'xz'
    'zeromq'
    'zimg'
    'zlib'
    'zvbi')
optdepends=(
    'nvidia-utils: for NVIDIA CUVID/NVDEC/NVENC support'
    'vpl-runtime: for Intel Quick Sync Video')
makedepends=(
    'amf-headers'
    'clang'
    'cmake'
    'cuda'
    'decklink-sdk'
    'ffnvcodec-headers'
    'git'
    'gmp'
    'libgl'
    'libomxil-bellagio'
    'lv2'
    'nasm'
    'opencl-headers'
    'vulkan-headers')
provides=(
    'ffmpeg'
    'ffmpeg-full'
    'ffmpeg-git'
    'libavcodec.so'
    'libavdevice.so'
    'libavfilter.so'
    'libavformat.so'
    'libavutil.so'
    'libswscale.so'
    'libswresample.so')
conflicts=('ffmpeg')
source=('git+https://git.ffmpeg.org/ffmpeg.git'
        'git+https://github.com/lensfun/lensfun.git'
        "https://github.com/ggml-org/whisper.cpp/archive/v${_whispercpp_ver}/whisper.cpp-${_whispercpp_ver}.tar.gz"
        '010-ffmpeg-add-svt-hevc.patch'
        "020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-HEVC/${_svt_hevc_ver}/ffmpeg_plugin/0002-doc-Add-libsvt_hevc-encoder-docs.patch"
        "030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"::"https://raw.githubusercontent.com/OpenVisualCloud/SVT-VP9/${_svt_vp9_ver}/ffmpeg_plugin/master-0001-Add-ability-for-ffmpeg-to-run-svt-vp9.patch"
        '040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch'
        '050-ffmpeg-fix-cuda-nvcc-with-gcc14.patch'
        '060-ffmpeg-whisper.cpp-fix-pkgconfig.patch'
        'LICENSE')
sha256sums=('SKIP'
            'SKIP'
            'bcee25589bb8052d9e155369f6759a05729a2022d2a8085c1aa4345108523077'
            '8f863a30d93345d3f3c5eec7db14a64ae54ca5feda38cc37a876779c6c03a1fc'
            'a164ebdc4d281352bf7ad1b179aae4aeb33f1191c444bed96cb8ab333c046f81'
            '1f06dfcb78e43a6c732cbc4f6ae583ae19fb111b56d33c8c860d5b6566c04f99'
            '1c4f328bfb0dfedf4478f7b3659bcd08c591823a389b9e9e4eb8c35b0b3e0356'
            'e8c5977d35de6c45a20fdd9be65d47695d75a9aed6355e254d24f850f69f50d4'
            '98b3d28cbd13bb575c602785f6b8cb0b66ea3128ab5a3a82fc1645822320c136'
            '04a7176400907fd7db0d69116b99de49e582a6e176b3bfb36a03e50a4cb26a36')

prepare() {
    rm -f ffmpeg/libavcodec/libsvt_{hevc,vp9}.c
    patch -d ffmpeg -Np1 -i "${srcdir}/010-ffmpeg-add-svt-hevc.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/020-ffmpeg-add-svt-hevc-docs-g${_svt_hevc_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/030-ffmpeg-add-svt-vp9-g${_svt_vp9_ver:0:7}.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/040-ffmpeg-add-av_stream_get_first_dts-for-chromium.patch"
    patch -d ffmpeg -Np1 -i "${srcdir}/050-ffmpeg-fix-cuda-nvcc-with-gcc14.patch"
    patch -d "whisper.cpp-${_whispercpp_ver}" -Np1 -i "${srcdir}/060-ffmpeg-whisper.cpp-fix-pkgconfig.patch"
}

pkgver() {
    printf '%s.r%s.g%s' "$(git -C ffmpeg describe --tags --long | awk -F'-' '{ sub(/^n/, "", $1); print $1 }')" \
                        "$(git -C ffmpeg describe --tags --match 'N' | awk -F'-' '{ print $2 }')" \
                        "$(git -C ffmpeg rev-parse --short HEAD)"
}

build() {
    local _stagingdir="${srcdir}/staging"
    local _pkgconfigdir="${_stagingdir}/lib/pkgconfig"
    export PKG_CONFIG_PATH="${_pkgconfigdir}${PKG_CONFIG_PATH:+":${PKG_CONFIG_PATH}"}"
    
    local -a _cmake_opts=(
        '-GUnix Makefiles'
        '-DBUILD_SHARED_LIBS:BOOL=OFF'
        '-DCMAKE_BUILD_TYPE:STRING=None'
        "-DCMAKE_INSTALL_PREFIX:PATH=${_stagingdir}"
        '-Wno-dev')
    
    # ffmpeg requires lensfun git master, but lensfun-git package wrongly installs its files to non-standard locations:
    # https://aur.archlinux.org/cgit/aur.git/commit/?h=lensfun-git&id=7b7a2d4890df59cde62c7dbfde3cefd7868a2707
    # building it locally as a static library for the time being - this also have the benefit of avoid rebuilding packages
    # requiring lensfun, like gegl (required for gimp, a commonly used package), as lensfun git master have a soname bump
    cmake -B build/lensfun -S lensfun \
        "${_cmake_opts[@]}" \
        -DBUILD_STATIC:BOOL='ON' \
        -DINSTALL_PYTHON_MODULE:BOOL='OFF' \
        -DINSTALL_HELPER_SCRIPTS:BOOL='OFF'
    cmake --build build/lensfun --target install
    sed -i \
        -e 's/\(-llensfun\)/\1 -lglib-2.0 -lstdc++/' \
        -e '/Cflags: /s/$/ -DCONF_LENSFUN_STATIC/' "${_pkgconfigdir}/lensfun.pc"
    
    # whisper.cpp AUR package conflicts with imagemagick at the time of writing
    # building it locally as a static library for the time being, as imagemagick is a commonly used package (high usage in pkgstats)
    cmake -B build/whisper.cpp -S "whisper.cpp-${_whispercpp_ver}" \
        "${_cmake_opts[@]}" \
        -DWHISPER_BUILD_EXAMPLES:BOOL='OFF' \
        -DWHISPER_BUILD_TESTS:BOOL='OFF'
    cmake --build build/whisper.cpp --target install
    
    cd ffmpeg
    printf '%s\n' '  -> Running ffmpeg configure script...'
    
    export CFLAGS+=' -isystem/opt/cuda/include'
    export LDFLAGS+=' -L/opt/cuda/lib64'
    
    # fix build of libavfilter/asrc_flite.c with gcc 14
    export CFLAGS+=' -Wno-error=incompatible-pointer-types'
    
    ./configure \
        --prefix='/usr' \
        --enable-lto \
        \
        --disable-rpath \
        --enable-gpl \
        --enable-version3 \
        --enable-nonfree \
        --enable-shared \
        --disable-static \
        --disable-stripping \
        --disable-htmlpages \
        --enable-gray \
        \
        --enable-alsa \
        --enable-avisynth \
        --enable-bzlib \
        --enable-cairo \
        --enable-chromaprint \
        --enable-frei0r \
        --enable-gcrypt \
        --enable-gmp \
        --enable-gnutls \
        --enable-iconv \
        --enable-ladspa \
        --enable-lcms2 \
        --enable-libaom \
        --enable-libaribb24 \
        --enable-libaribcaption \
        --enable-libass \
        --enable-libbluray \
        --enable-libbs2b \
        --enable-libcaca \
        --enable-libcelt \
        --enable-libcdio \
        --enable-libcodec2 \
        --enable-libdav1d \
        --enable-libdavs2 \
        --enable-libdc1394 \
        --enable-libdvdnav \
        --enable-libdvdread \
        --enable-libfdk-aac \
        --enable-libflite \
        --enable-libfontconfig \
        --enable-libfreetype \
        --enable-libfribidi \
        --enable-libharfbuzz \
        --enable-libglslang \
        --enable-libgme \
        --enable-libgsm \
        --enable-libiec61883 \
        --enable-libilbc \
        --enable-libjack \
        --enable-libjxl \
        --enable-libklvanc \
        --enable-libkvazaar \
        --enable-liblc3 \
        --enable-liblcevc-dec \
        --enable-liblensfun \
        --enable-libmodplug \
        --enable-libmp3lame \
        --enable-libmpeghdec \
        --enable-liboapv \
        --enable-libopencore-amrnb \
        --enable-libopencore-amrwb \
        --enable-libopencv \
        --enable-libopenh264 \
        --enable-libopenjpeg \
        --enable-libopenmpt \
        --enable-libopenvino \
        --enable-libopus \
        --enable-libplacebo \
        --enable-libpulse \
        --enable-libqrencode \
        --enable-libquirc \
        --enable-librabbitmq \
        --enable-librav1e \
        --enable-librist \
        --enable-librsvg \
        --enable-librubberband \
        --enable-librtmp  \
        --disable-libshaderc \
        --enable-libshine \
        --enable-libsmbclient \
        --enable-libsnappy \
        --enable-libsoxr \
        --enable-libspeex \
        --enable-libsrt \
        --enable-libssh \
        --enable-libsvtav1 \
        --enable-libsvthevc \
        --enable-libsvtvp9 \
        --disable-libtensorflow \
        --enable-libtesseract \
        --enable-libtheora \
        --disable-libtls \
        --disable-libtorch \
        --enable-libtwolame \
        --enable-libuavs3d \
        --enable-libv4l2 \
        --enable-libvidstab \
        --enable-libvmaf \
        --enable-libvo-amrwbenc \
        --enable-libvorbis \
        --enable-libvpx \
        --enable-libvvenc \
        --enable-libwebp \
        --enable-libx264 \
        --enable-libx265 \
        --enable-libxevd \
        --enable-libxeve \
        --enable-libxavs \
        --enable-libxavs2 \
        --enable-libxcb \
        --enable-libxcb-shm \
        --enable-libxcb-xfixes \
        --enable-libxcb-shape \
        --enable-libxvid \
        --enable-libxml2 \
        --enable-libzimg \
        --enable-libzmq \
        --enable-libzvbi \
        --enable-lv2 \
        --enable-lzma \
        --enable-decklink \
        --disable-mbedtls \
        --enable-libmysofa \
        --enable-openal \
        --enable-opencl \
        --enable-opengl \
        --disable-openssl \
        --disable-pocketsphinx \
        --enable-sndio \
        --enable-sdl2 \
        --enable-vapoursynth \
        --enable-vulkan \
        --enable-whisper \
        --enable-xlib \
        --enable-zlib \
        \
        --enable-amf \
        --enable-cuda-nvcc \
        --enable-cuda-llvm \
        --enable-cuvid \
        --enable-ffnvcodec \
        --enable-libdrm \
        --enable-libvpl \
        --disable-libnpp \
        --enable-nvdec \
        --enable-nvenc \
        --disable-ohcodec \
        --enable-omx \
        --enable-rkmpp \
        --enable-v4l2-m2m \
        --enable-vaapi \
        --enable-vdpau
    make
    make tools/qt-faststart
}

package() {
    make -C ffmpeg DESTDIR="$pkgdir" install
    install -D -m755 ffmpeg/tools/qt-faststart -t "${pkgdir}/usr/bin"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed -i \
        -e 's|-llensfun ||' \
        -e 's|-lwhisper ||' \
        -e "s|-L${srcdir}/staging/lib ||g" \
        "${pkgdir}/usr/lib/pkgconfig/libavfilter.pc"
}
