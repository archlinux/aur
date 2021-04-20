# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Maintainer: Andrew Bueide <abueide@protonmail.com>
# Maintainer: rouhannb <rouhannb@protonmail.com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite
pkgver=1.2.27
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64')
url="http://www.aseprite.org/"
license=('custom')
depends=('cmark' 'curl' 'giflib' 'zlib' 'libpng' 'tinyxml' 'freetype2' 'fontconfig' 'libxcursor'
         'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'git' 'python2' 'python' 'freeglut' 'xorgproto' 'libxi' 'harfbuzz-icu'
             'nettle')
conflicts=("aseprite-git" "aseprite-gpl" "skia-git")
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname^}-\
v${pkgver}-Source.zip"
"${pkgname}.desktop"
"git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
"git+https://github.com/${pkgname}/skia.git#branch=${pkgname}-m81"
"${pkgname}-buildtools.tar.gz::https://chromium.googlesource.com/chromium/buildtools.git/+archive/\
505de88083136eefd056e5ee4ca0f01fe9b33de8.tar.gz"
"${pkgname}-common.tar.gz::https://skia.googlesource.com/common.git/+archive/\
9737551d7a52c3db3262db5856e6bcd62c462b92.tar.gz"
"${pkgname}-angle2.tar.gz::https://chromium.googlesource.com/angle/angle.git/+archive/\
ee07cb317579dfda40dabb5d6d9c209e0e9e0643.tar.gz"
"${pkgname}-dawn.tar.gz::https://dawn.googlesource.com/dawn.git/+archive/\
604072bc2ed01018eb03bcbbf9d94042f679af63.tar.gz"
"${pkgname}-dng_sdk.tar.gz::https://android.googlesource.com/platform/external/dng_sdk.git/\
+archive/c8d0c9b1d16bfda56f15165d39e0ffa360a11123.tar.gz"
"${pkgname}-egl-registry.tar.gz::https://skia.googlesource.com/external/github.com/KhronosGroup\
/EGL-Registry/+archive/a0bca08de07c7d7651047bedc0b653cfaaa4f2ae.tar.gz"
"${pkgname}-expat.tar.gz::https://android.googlesource.com/platform/external/expat.git/+archive/\
e5aa0a2cb0a5f759ef31c0819dc67d9b14246a4a.tar.gz"
"${pkgname}-freetype.tar.gz::https://skia.googlesource.com/third_party/freetype2.git/+archive/\
0a3d2bb99b45b72e1d45185ab054efa993d97210.tar.gz"
"${pkgname}-harfbuzz.tar.gz::https://chromium.googlesource.com/external/github.com/harfbuzz/\
harfbuzz.git/+archive/3a74ee528255cc027d84b204a87b5c25e47bff79.tar.gz"
"${pkgname}-icu.tar.gz::https://chromium.googlesource.com/chromium/deps/icu.git/+archive/\
dbd3825b31041d782c5b504c59dcfb5ac7dda08c.tar.gz"
"${pkgname}-imgui.tar.gz::https://skia.googlesource.com/external/github.com/ocornut/imgui.git\
/+archive/d38d7c6628bebd02692cfdd6fa76b4d992a35b75.tar.gz"
"${pkgname}-libgifcodec.tar.gz::https://skia.googlesource.com/libgifcodec/+archive/\
38d9c73f49b861bb4a9829371ac311544b120023.tar.gz"
"${pkgname}-libjpeg-turbo.tar.gz::https://skia.googlesource.com/external/github.com/libjpeg-turbo\
/libjpeg-turbo.git/+archive/574f3a772c96dc9db2c98ef24706feb3f6dbda9a.tar.gz"
"${pkgname}-libpng.tar.gz::https://skia.googlesource.com/third_party/libpng.git/+archive/\
386707c6d19b974ca2e3db7f5c61873813c6fe44.tar.gz"
"${pkgname}-libwebp.tar.gz::https://chromium.googlesource.com/webm/libwebp.git/+archive/\
0fe1a89dbf1930fc2554dbe76adad5d962054ead.tar.gz"
"${pkgname}-lua.tar.gz::https://skia.googlesource.com/external/github.com/lua/lua.git/+archive/\
e354c6355e7f48e087678ec49e340ca0696725b1.tar.gz"
"${pkgname}-microhttpd.tar.gz::https://android.googlesource.com/platform/external/libmicrohttpd\
/+archive/748945ec6f1c67b7efc934ab0808e1d32f2fb98d.tar.gz"
"${pkgname}-opencl-lib.tar.gz::https://skia.googlesource.com/external/github.com/GPUOpen-Tools/\
common-lib-amd-APPSDK-3.0/+archive/4e6d30e406d2e5a65e1d65e404fe6df5f772a32b.tar.gz"
"${pkgname}-opencl-registry.tar.gz::https://skia.googlesource.com/external/github.com/\
KhronosGroup/OpenCL-Registry/+archive/932ed55c85f887041291cef8019e54280c033c35.tar.gz"
"${pkgname}-opengl-registry.tar.gz::https://skia.googlesource.com/external/github.com/\
KhronosGroup/OpenGL-Registry/+archive/14b80ebeab022b2c78f84a573f01028c96075553.tar.gz"
"${pkgname}-piex.tar.gz::https://android.googlesource.com/platform/external/piex.git/+archive/\
bb217acdca1cc0c16b704669dd6f91a1b509c406.tar.gz"
"${pkgname}-sdl.tar.gz::https://skia.googlesource.com/third_party/sdl/+archive/\
5d7cfcca344034aff9327f77fc181ae3754e7a90.tar.gz"
"${pkgname}-sfntly.tar.gz::https://chromium.googlesource.com/external/github.com/googlei18n/\
sfntly.git/+archive/b55ff303ea2f9e26702b514cf6a3196a2e3e2974.tar.gz"
"${pkgname}-spirv-cross.tar.gz::https://chromium.googlesource.com/external/github.com/\
KhronosGroup/SPIRV-Cross/+archive/53ab2144b90abede33be5161aec5dfc94ddc3caf.tar.gz"
"${pkgname}-spirv-headers.tar.gz::https://skia.googlesource.com/external/github.com/KhronosGroup/\
SPIRV-Headers.git/+archive/29c11140baaf9f7fdaa39a583672c556bf1795a1.tar.gz"
"${pkgname}-spirv-tools.tar.gz::https://skia.googlesource.com/external/github.com/KhronosGroup\
/SPIRV-Tools.git/+archive/0c4feb643b89d1792b02f7cbef315e9d95633bd7.tar.gz"
"${pkgname}-swiftshader.tar.gz::https://swiftshader.googlesource.com/SwiftShader/+archive/\
430def835f9f85d52f4a96db9b715cd9a7403c9c.tar.gz"
"${pkgname}-wuffs.tar.gz::https://skia.googlesource.com/external/github.com/google/wuffs.git\
/+archive/4080840928c0b05a80cda0d14ac2e2615f679f1a.tar.gz"
"${pkgname}-zlib.tar.gz::https://chromium.googlesource.com/chromium/src/third_party/zlib/+archive/\
ea3ba903faac98b64b2bf8de5e98cd97b335a474.tar.gz"
"gn::https://chromium-gn.storage-download.googleapis.com/3523d50538357829725d4ed74b777a572ce0ac74"
)
_gitsrc=("${source[@]:4:29}")
noextract=("${_gitsrc[@]%%::*}")
sha256sums=('541a5c561fe7481cfb6aec80ecc9a8435d8387325ba30c9e3116c3c76ef539d7'
            'deaf646a615c79a4672b087562a09c44beef37e7acfc6f5f66a437d4f3b97a25'
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
            'SKIP'
            'c8c2d617f1a33d6eb27f25ebcc30bd8ba1e6a0aa980cada21dda2ad1401fa4a2')

prepare() {
  cd "${srcdir}"

  # Install skia deps (essentially runs git-sync-deps with the files already downloaded)
  mkdir --parents --verbose skia/third_party/externals

  for _dep in buildtools common
  do
    mkdir --parents --verbose "skia/${_dep}"
    tar --verbose --extract --file "${pkgname}-${_dep}.tar.gz" --directory "skia/${_dep}"
  done

  for _dep in angle2 dawn dng_sdk egl-registry expat freetype harfbuzz icu imgui opencl-registry \
              libjpeg-turbo libpng libwebp lua microhttpd opencl-lib opengl-registry piex \
              sdl sfntly spirv-cross spirv-headers spirv-tools swiftshader zlib wuffs
  do
    mkdir --parents --verbose "skia/third_party/externals/${_dep}"
    tar --verbose --extract --file "${pkgname}-${_dep}.tar.gz" --directory \
      "skia/third_party/externals/${_dep}"
  done

  chmod u=rwx,g=rx,o=rx --verbose gn
  mv --verbose gn skia/bin/gn
  cp --verbose skia/bin/gn skia/buildtools/linux64/gn

  mkdir --parents --verbose binsub
  ln --force --symbolic $(which python2) binsub/python
}

build() {
  cd "${srcdir}"

  # Build skia
  _skiapath="${srcdir}/binsub:${srcdir}/depot_tools:${PATH}"
  cd skia
  PATH="${_skiapath}" gn gen out/Release-x64 \
    --args="is_debug=false is_official_build=true skia_use_system_expat=false \
    skia_use_system_icu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false \
    skia_use_system_libwebp=false skia_use_system_zlib=false"
  PATH="${_skiapath}" ninja -C out/Release-x64 skia modules

  # Build aseprite
  cd "${srcdir}"
  mkdir --parents --verbose build && cd build

  cmake \
    -DWITH_WEBP_SUPPORT=ON \
    -DUSE_SHARED_CURL=ON \
    -DUSE_SHARED_GIFLIB=ON \
    -DUSE_SHARED_HARFBUZZ=ON \
    -DUSE_SHARED_ZLIB=ON \
    -DUSE_SHARED_LIBPNG=ON \
    -DUSE_SHARED_TINYXML=ON \
    -DUSE_SHARED_CMARK=ON \
    -DENABLE_UPDATER=OFF \
    -DUSE_SHARED_FREETYPE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLAF_BACKEND=skia \
    -DSKIA_DIR="${srcdir}/skia" \
    -DSKIA_LIBRARY_DIR="${srcdir}/skia/out/Release-x64" \
    -DSKIA_LIBRARY="${srcdir}/skia/out/Release-x64/libskia.a" \
    -G Ninja \
    ..

  ninja aseprite
}

package() {
  cd "${srcdir}"/build

  install -D --verbose "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Aseprite, by default, doesn't install a few files on its own. So, they are installed manually.

  install --directory --verbose "${pkgdir}/usr/share/${pkgname}/data"
  cp --recursive --verbose 'bin/data' "${pkgdir}/usr/share/${pkgname}"

  install --directory --verbose "${pkgdir}/usr/share/doc/${pkgname}"
  cp --recursive --verbose '../docs' "${pkgdir}/usr/share/doc/${pkgname}"
  install --mode=644 --verbose 'bin/data/EULA.txt' "${pkgdir}/usr/share/doc/${pkgname}"
  install --mode=644 --verbose '../README.md' "${pkgdir}/usr/share/doc/${pkgname}"

  install -D --mode=644 --verbose "../${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for _size in 32 48 64
  do
    install -D --mode=644 --verbose "../data/icons/ase${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done

  install -D --mode=644 --verbose --target-directory "${pkgdir}/usr/share/licenses/${pkgname}" \
    'bin/data/EULA.txt'
  install --mode=644 --verbose '../docs/LICENSES.md' "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
