# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Maintainer: Andrew Bueide <abueide@protonmail.com>
# Maintainer: rouhannb <rouhannb@gmail.com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite
pkgver=1.2.15
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64' 'i686')
url="http://www.aseprite.org/"
license=('custom')
depends=('cmark' 'pixman' 'curl' 'giflib' 'zlib' 'libpng' 'libjpeg-turbo' 'tinyxml' 'freetype2'
         'harfbuzz' 'nettle' 'fontconfig' 'libxcursor' 'desktop-file-utils')
makedepends=('cmake' 'ninja' 'git' 'python2')
conflicts=("aseprite-git" "aseprite-gpl")
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname^}-\
v${pkgver}-Source.zip"
"${pkgname}.desktop"
"git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
"git+https://github.com/${pkgname}/skia.git#branch=${pkgname}-m71"
"git+https://chromium.googlesource.com/chromium/buildtools.git\
#commit=505de88083136eefd056e5ee4ca0f01fe9b33de8"
"git+https://skia.googlesource.com/common.git#commit=9737551d7a52c3db3262db5856e6bcd62c462b92"
"angle2::git+https://chromium.googlesource.com/angle/angle.git\
#commit=956ab4d9fab36be9929e63829475d4d69b2c681c"
"git+https://android.googlesource.com/platform/external/dng_sdk.git\
#commit=96443b262250c390b0caefbf3eed8463ba35ecae"
"egl-registry::git+https://skia.googlesource.com/external/github.com/KhronosGroup/EGL-Registry\
#commit=a0bca08de07c7d7651047bedc0b653cfaaa4f2ae"
"git+https://android.googlesource.com/platform/external/expat.git#tag=android-6.0.1_r55"
"freetype::git+https://skia.googlesource.com/third_party/freetype2.git\
#commit=7edc937fe679d14d66f55cf6f7fa607925d38f3c"
"git+https://android.googlesource.com/platform/external/googletest\
#commit=dd43b9998e9a44a579a7aba6c1309407d1a5ed95"
"git+https://skia.googlesource.com/third_party/harfbuzz.git#tag=1.4.2"
"git+https://chromium.googlesource.com/chromium/deps/icu.git\
#commit=ec9c1133693148470ffe2e5e53576998e3650c1d"
"git+https://skia.googlesource.com/external/github.com/ocornut/imgui.git\
#commit=bc6ac8b2aee0614debd940e45bc9cd0d9b355c86"
"git+https://chromium.googlesource.com/external/github.com/open-source-parsers/jsoncpp.git\
#tag=1.0.0"
"git+https://skia.googlesource.com/external/github.com/libjpeg-turbo/libjpeg-turbo.git#tag=2.0.0"
"git+https://skia.googlesource.com/third_party/libpng.git#tag=v1.6.33"
"git+https://chromium.googlesource.com/webm/libwebp.git#tag=v0.6.1"
"git+https://skia.googlesource.com/external/github.com/lua/lua.git#tag=v5-3-4"
"microhttpd::git+https://android.googlesource.com/platform/external/libmicrohttpd\
#commit=748945ec6f1c67b7efc934ab0808e1d32f2fb98d"
"opencl-lib::git+https://skia.googlesource.com/external/github.com/GPUOpen-Tools/\
common-lib-amd-APPSDK-3.0#commit=4e6d30e406d2e5a65e1d65e404fe6df5f772a32b"
"opengl-registry::git+https://skia.googlesource.com/external/github.com/KhronosGroup/\
OpenGL-Registry#commit=14b80ebeab022b2c78f84a573f01028c96075553"
"git+https://android.googlesource.com/platform/external/piex.git\
#commit=bb217acdca1cc0c16b704669dd6f91a1b509c406"
"git+https://skia.googlesource.com/third_party/sdl\
#commit=5d7cfcca344034aff9327f77fc181ae3754e7a90"
"git+https://chromium.googlesource.com/external/github.com/googlei18n/sfntly.git\
#commit=b18b09b6114b9b7fe6fc2f96d8b15e8a72f66916"
"spirv-headers::git+https://skia.googlesource.com/external/github.com/KhronosGroup/\
SPIRV-Headers.git#commit=661ad91124e6af2272afd00f804d8aa276e17107"
"spirv-tools::git+https://skia.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git\
#commit=e9e4393b1c5aad7553c05782acefbe32b42644bd"
"swiftshader::git+https://swiftshader.googlesource.com/SwiftShader\
#commit=d6126aea667e37d2d7b57b0a381b9f26912a21b7"
"git+https://chromium.googlesource.com/chromium/src/third_party/zlib\
#commit=ea3ba903faac98b64b2bf8de5e98cd97b335a474"
"git+https://github.com/2d-inc/Nima-Cpp.git#commit=4bd02269d7d1d2e650950411325eafa15defb084"
"git+https://github.com/2d-inc/Nima-Math-Cpp.git#commit=e0c12772093fa8860f55358274515b86885f0108"
"gn::https://chromium-gn.storage-download.googleapis.com/2f27ff0b6118e5886df976da5effa6003d19d1ce"
)
sha256sums=(
'813d6a099e1131f25f54e3935d6fdcdb1d0854ba757af074f3fc59dc869f38f4'
'c258fa38a0e0bd575f0bd744c4c3b60cf8d59d596c7572f84bd392e1c5e49b4f'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'c482981e91b5591ff85e055f3026956d6178aae3560ed984ff60b22e99351312'
)

prepare() {
  cd "$srcdir"

  # Install skia deps (essentially runs git-sync-deps with the files already downloaded)
  mkdir --parents --verbose skia/third_party/externals

  for dep in buildtools common
  do
    rm --recursive --force "skia/$dep"
    mv --force --no-target-directory --verbose "$dep" "skia/$dep"
  done

  for dep in angle2 dng_sdk egl-registry expat freetype googletest harfbuzz icu imgui jsoncpp \
             libjpeg-turbo libpng libwebp lua microhttpd opencl-lib opengl-registry piex sdl \
             sfntly spirv-headers spirv-tools swiftshader zlib Nima-Cpp Nima-Math-Cpp
  do
    rm --recursive --force "skia/third_party/externals/$dep"
    mv --force --no-target-directory --verbose "$dep" "skia/third_party/externals/$dep"
  done

  chmod u=rwx,g=rx,o=rx --verbose gn
  mv --verbose gn skia/bin/gn
  cp --verbose skia/bin/gn skia/buildtools/linux64/gn

  # Skia assumes python is linked to python2, not python3
  # Also, running ninja from depot_tools seems to cause problems
  mkdir --parents --verbose binsub
  cd binsub
  ln --force --symbolic --verbose /usr/bin/python2 python
  ln --force --symbolic --verbose /usr/bin/python2-config python-config
  ln --force --symbolic --verbose /usr/bin/ninja
}

build() {
  cd "$srcdir"

  # Build skia
  _skiapath="$srcdir/binsub:$srcdir/depot_tools:$PATH"
  cd skia
  PATH="$_skiapath" gn gen out/Release --args="is_debug=false is_official_build=true\
    skia_use_system_expat=false skia_use_system_icu=false skia_use_system_libjpeg_turbo=false\
    skia_use_system_libpng=false skia_use_system_libwebp=false skia_use_system_zlib=false"
  PATH="$_skiapath" ninja -C out/Release skia

  # Build aseprite
  cd "$srcdir"
  mkdir --parents --verbose build && cd build

  cmake \
    -DUSE_SHARED_PIXMAN=ON \
    -DWITH_WEBP_SUPPORT=ON \
    -DUSE_SHARED_CURL=ON \
    -DUSE_SHARED_GIFLIB=ON \
    -DUSE_SHARED_JPEGLIB=ON \
    -DUSE_SHARED_HARFBUZZ=ON \
    -DUSE_SHARED_ZLIB=ON \
    -DUSE_SHARED_LIBPNG=ON \
    -DUSE_SHARED_TINYXML=ON \
    -DUSE_SHARED_CMARK=ON \
    -DENABLE_UPDATER=OFF \
    -DUSE_SHARED_FREETYPE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLAF_OS_BACKEND=skia \
    -DSKIA_DIR="$srcdir/skia" \
    -DSKIA_OUT_DIR="$srcdir/skia/out/Release" \
    -G Ninja \
    ..

  cmake --build .
}

package() {
  cd "$srcdir"/build

  DESTDIR="$pkgdir" cmake --install .
  # Aseprite doesn't seem to install README.md for some reason.
  install --mode=644 --verbose 'bin/data/README.md' "$pkgdir/usr/share/aseprite/data"

  install -D --mode=644 --verbose "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D --mode=644 --verbose "../data/icons/ase48.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -D --mode=644 --verbose "../EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

  # Remove conflicting files with libarchive
  # TODO: With the current compilation options, looks like aseprite build process builds these
  # binaries. Disable the compilation of the following files later on:
  # Note: Github issue: https://github.com/aseprite/aseprite/issues/1602
  rm --verbose "$pkgdir/usr/bin/"{bsdcat,bsdcpio,bsdtar,img2webp}
  rm --recursive --verbose "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/share/WebP" \
                           "$pkgdir/usr/share/man"
}

# vim:set ts=2 sw=2 et:
