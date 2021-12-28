# Maintainer: Imperator Storm <30777770+ImperatorStorm@users.noreply.github.com>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: Andrew Bueide <abueide@protonmail.com>
# Contributor: rouhannb <rouhannb@protonmail.com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite
pkgver=1.2.30
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
"git+https://github.com/${pkgname}/skia.git#branch=${pkgname}-m96"
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
sha256sums=('9f4b098fe2327f2e9d73eb9f2aeebecad63e87ff2cf6fb6eeeee3c0778bb8874'
            'deaf646a615c79a4672b087562a09c44beef37e7acfc6f5f66a437d4f3b97a25'
            'SKIP'
            'SKIP'
            '23594f876b7f29555999d2f9aa2058e6ae1ece4fb720cdd0292c639c693694d6'
            'bbdd106ac79d31f42ba80b1286b7a4c1cbae7cac12725786d664db7c255957c2'
            'd928ac40fee155edf1cf823d57ce559786ff9f2c3dda7e83a857132ab545ed06'
            '59957d0753ecf327c9f66b3009a908505f38d672637bf4d0c4ee0141e8bdd17a'
            '75b7fd8c6351b0c51f866d3defefe0266c27e1b593e1ba5cded546376431b09b'
            'ca6f81ccc155144fbf2d168d596a71d254fc18738e0702a82f68974bd4e839e2'
            'ad256da64e2beca4f49ef02a39146f4f73d89d160eabf8b0eb8fce6cb8d606e4'
            'ff369316b724ced12280be18398a3600d4e2c2a581ec425180cc5b47a3e1d02a'
            'ff8bc5c39d0a2db4b81501a693e91427d97200e88d2940ddbfb5df13677cde56'
            'c1f69fa10880cfce79480c7b7f4b968c116e04c942c7d12a0f68fdd94484e9d4'
            '4678c9a24079f601abc7a4299009465fe65c60fd67c243532ece674bd2e16ada'
            '1ebf59f258299728962612b0c0d91caa2d0b66f60402792445b6ca1cac82e147'
            '7f9e63d4ba3610698add3556455086173605957a8e9fa59ebcc4804cbdcff047'
            'bc31921c8bd1af7015657846d21498c665b9094bac8984d903dac273c3d9323e'
            'cb1856e3c77b6d26ce3e8de648ba657418e289203e7f8f99a9f6a581ad6af93e'
            'bf24eb0dccd631d5752f60ee3076c6102198d636655a929c5708aa61918d43a9'
            '82c778de66817b8b96f3bbd8447b2bca429761d7e9de4d59158bec7ce33031e2'
            'ca9a80bb352c65caf62a9a08c3737bea5c4e6c836bd89d25e311c36620fb1b9e'
            'f4f79c84ccc4de73ac7e8aa08f9ff47c5bfbab01b79889917b9f1ffa3bdb19df'
            'f625e848d0fc137703efbbb5592e76b44e95332bc65acc67485b9855ffbc56fc'
            '86e43c39de644ff66ca02feeee144aa3a9654cf1bd59e186952fc75885d0edb5'
            '618ce44921ddac4add337829f1b314388f5feedbc563a897b9c766c900b5e170'
            'cfa961a45b62689aef775456075cb2d1440d58d78d6b0874f361fcf7b768b021'
            '2d26bf7a01cc69271b07971162c648a2da55308c65fe300ec93356cba9fe1b2f'
            'd9c642324328b376a34ed01058af5b6fae3c2a8d7736300551227ee6335e439f'
            '4cc0cdf2d707ce3edc846fcaf516caea45ea6baafb4077d043660b91ee91b3aa'
            '34294532feba98c460721117ffb18a6c5584f7c48823ccc58109abd1bf2c7c45'
            'fcd29d69245483da000d6b162caccf0607b58dc06b77a5c79ad64403730f47e8'
            '6280ed3515504fd9b64ce6f9fdedfcc49316dd56466726797fb80db0599be074'
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
