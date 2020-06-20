# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Maintainer: Andrew Bueide <abueide@protonmail.com>
# Maintainer: rouhannb <rouhannb@gmail.com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite
pkgver=1.2.21
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64')
url="http://www.aseprite.org/"
license=('custom')
depends=('cmark' 'curl' 'giflib' 'zlib' 'libpng' 'tinyxml' 'freetype2' 'fontconfig' 'libxcursor'
         'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'git' 'python2' 'freeglut' 'xorgproto' 'libxi' 'harfbuzz-icu'
             'nettle')
conflicts=("aseprite-git" "aseprite-gpl" "skia-git")
source=("https://github.com/${pkgname}/${pkgname}/releases/download/v${pkgver}/${pkgname^}-\
v${pkgver}-Source.zip"
"${pkgname}.desktop"
"git+https://chromium.googlesource.com/chromium/tools/depot_tools.git"
"git+https://github.com/${pkgname}/skia.git#branch=${pkgname}-m81"
"git+https://chromium.googlesource.com/chromium/buildtools.git\
#commit=505de88083136eefd056e5ee4ca0f01fe9b33de8"
"git+https://skia.googlesource.com/common.git#commit=9737551d7a52c3db3262db5856e6bcd62c462b92"
"angle2::git+https://chromium.googlesource.com/angle/angle.git\
#commit=ee07cb317579dfda40dabb5d6d9c209e0e9e0643"
"git+https://dawn.googlesource.com/dawn.git#commit=604072bc2ed01018eb03bcbbf9d94042f679af63"
"git+https://android.googlesource.com/platform/external/dng_sdk.git\
#commit=c8d0c9b1d16bfda56f15165d39e0ffa360a11123"
"egl-registry::git+https://skia.googlesource.com/external/github.com/KhronosGroup/EGL-Registry\
#commit=a0bca08de07c7d7651047bedc0b653cfaaa4f2ae"
"git+https://android.googlesource.com/platform/external/expat.git\
#commit=e5aa0a2cb0a5f759ef31c0819dc67d9b14246a4a"
"freetype::git+https://skia.googlesource.com/third_party/freetype2.git\
#commit=0a3d2bb99b45b72e1d45185ab054efa993d97210"
"git+https://chromium.googlesource.com/external/github.com/harfbuzz/harfbuzz.git\
#commit=3a74ee528255cc027d84b204a87b5c25e47bff79"
"git+https://chromium.googlesource.com/chromium/deps/icu.git\
#commit=dbd3825b31041d782c5b504c59dcfb5ac7dda08c"
"git+https://skia.googlesource.com/external/github.com/ocornut/imgui.git\
#commit=d38d7c6628bebd02692cfdd6fa76b4d992a35b75"
"git+https://skia.googlesource.com/libgifcodec#commit=38d9c73f49b861bb4a9829371ac311544b120023"
"git+https://skia.googlesource.com/external/github.com/libjpeg-turbo/libjpeg-turbo.git\
#commit=574f3a772c96dc9db2c98ef24706feb3f6dbda9a"
"git+https://skia.googlesource.com/third_party/libpng.git\
#commit=386707c6d19b974ca2e3db7f5c61873813c6fe44"
"git+https://chromium.googlesource.com/webm/libwebp.git\
#commit=0fe1a89dbf1930fc2554dbe76adad5d962054ead"
"git+https://skia.googlesource.com/external/github.com/lua/lua.git\
#commit=e354c6355e7f48e087678ec49e340ca0696725b1"
"microhttpd::git+https://android.googlesource.com/platform/external/libmicrohttpd\
#commit=748945ec6f1c67b7efc934ab0808e1d32f2fb98d"
"opencl-lib::git+https://skia.googlesource.com/external/github.com/GPUOpen-Tools/\
common-lib-amd-APPSDK-3.0#commit=4e6d30e406d2e5a65e1d65e404fe6df5f772a32b"
"opencl-registry::git+https://skia.googlesource.com/external/github.com/KhronosGroup/\
OpenCL-Registry#commit=932ed55c85f887041291cef8019e54280c033c35"
"opengl-registry::git+https://skia.googlesource.com/external/github.com/KhronosGroup/\
OpenGL-Registry#commit=14b80ebeab022b2c78f84a573f01028c96075553"
"git+https://android.googlesource.com/platform/external/piex.git\
#commit=bb217acdca1cc0c16b704669dd6f91a1b509c406"
"git+https://skia.googlesource.com/third_party/sdl\
#commit=5d7cfcca344034aff9327f77fc181ae3754e7a90"
"git+https://chromium.googlesource.com/external/github.com/googlei18n/sfntly.git\
#commit=b55ff303ea2f9e26702b514cf6a3196a2e3e2974"
"spirv-cross::git+https://chromium.googlesource.com/external/github.com/KhronosGroup/\
SPIRV-Cross#commit=53ab2144b90abede33be5161aec5dfc94ddc3caf"
"spirv-headers::git+https://skia.googlesource.com/external/github.com/KhronosGroup/\
SPIRV-Headers.git#commit=29c11140baaf9f7fdaa39a583672c556bf1795a1"
"spirv-tools::git+https://skia.googlesource.com/external/github.com/KhronosGroup/SPIRV-Tools.git\
#commit=0c4feb643b89d1792b02f7cbef315e9d95633bd7"
"swiftshader::git+https://swiftshader.googlesource.com/SwiftShader\
#commit=430def835f9f85d52f4a96db9b715cd9a7403c9c"
"git+https://skia.googlesource.com/external/github.com/google/wuffs.git\
#commit=4080840928c0b05a80cda0d14ac2e2615f679f1a"
"git+https://chromium.googlesource.com/chromium/src/third_party/zlib\
#commit=ea3ba903faac98b64b2bf8de5e98cd97b335a474"
"gn::https://chromium-gn.storage-download.googleapis.com/3523d50538357829725d4ed74b777a572ce0ac74"
)
sha256sums=('ac5f65cf32019c2d44033e25f1a3424ef2727cbfafc06b5083114e63b40845a1'
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
    mv --force --no-target-directory --verbose "${_dep}" "skia/${_dep}"
  done

  for _dep in angle2 dawn dng_sdk egl-registry expat freetype harfbuzz icu imgui opencl-registry \
              libjpeg-turbo libpng libwebp lua microhttpd opencl-lib opengl-registry piex \
              sdl sfntly spirv-cross spirv-headers spirv-tools swiftshader zlib wuffs
  do
    mv --force --no-target-directory --verbose "${_dep}" "skia/third_party/externals/${_dep}"
  done

  chmod u=rwx,g=rx,o=rx --verbose gn
  mv --verbose gn skia/bin/gn
  cp --verbose skia/bin/gn skia/buildtools/linux64/gn

  mkdir --verbose binsub
  ln --symbolic /usr/bin/python2 binsub/python
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
