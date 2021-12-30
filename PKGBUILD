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
"git+https://github.com/${pkgname}/skia.git#branch=${pkgname}-m81"
"${pkgname}-${pkgver}-buildtools.tar.gz::https://chromium.googlesource.com/chromium/buildtools.git/+archive/\
505de88083136eefd056e5ee4ca0f01fe9b33de8.tar.gz"
"${pkgname}-${pkgver}-common.tar.gz::https://skia.googlesource.com/common.git/+archive/\
9737551d7a52c3db3262db5856e6bcd62c462b92.tar.gz"
"${pkgname}-${pkgver}-angle2.tar.gz::https://chromium.googlesource.com/angle/angle.git/+archive/\
ee07cb317579dfda40dabb5d6d9c209e0e9e0643.tar.gz"
"${pkgname}-${pkgver}-dawn.tar.gz::https://dawn.googlesource.com/dawn.git/+archive/\
604072bc2ed01018eb03bcbbf9d94042f679af63.tar.gz"
"${pkgname}-${pkgver}-dng_sdk.tar.gz::https://android.googlesource.com/platform/external/dng_sdk.git/\
+archive/c8d0c9b1d16bfda56f15165d39e0ffa360a11123.tar.gz"
"${pkgname}-${pkgver}-egl-registry.tar.gz::https://skia.googlesource.com/external/github.com/KhronosGroup\
/EGL-Registry/+archive/a0bca08de07c7d7651047bedc0b653cfaaa4f2ae.tar.gz"
"${pkgname}-${pkgver}-expat.tar.gz::https://android.googlesource.com/platform/external/expat.git/+archive/\
e5aa0a2cb0a5f759ef31c0819dc67d9b14246a4a.tar.gz"
"${pkgname}-${pkgver}-freetype.tar.gz::https://skia.googlesource.com/third_party/freetype2.git/+archive/\
0a3d2bb99b45b72e1d45185ab054efa993d97210.tar.gz"
"${pkgname}-${pkgver}-harfbuzz.tar.gz::https://chromium.googlesource.com/external/github.com/harfbuzz/\
harfbuzz.git/+archive/3a74ee528255cc027d84b204a87b5c25e47bff79.tar.gz"
"${pkgname}-${pkgver}-icu.tar.gz::https://chromium.googlesource.com/chromium/deps/icu.git/+archive/\
dbd3825b31041d782c5b504c59dcfb5ac7dda08c.tar.gz"
"${pkgname}-${pkgver}-imgui.tar.gz::https://skia.googlesource.com/external/github.com/ocornut/imgui.git\
/+archive/d38d7c6628bebd02692cfdd6fa76b4d992a35b75.tar.gz"
"${pkgname}-${pkgver}-libgifcodec.tar.gz::https://skia.googlesource.com/libgifcodec/+archive/\
38d9c73f49b861bb4a9829371ac311544b120023.tar.gz"
"${pkgname}-${pkgver}-libjpeg-turbo.tar.gz::https://skia.googlesource.com/external/github.com/libjpeg-turbo\
/libjpeg-turbo.git/+archive/574f3a772c96dc9db2c98ef24706feb3f6dbda9a.tar.gz"
"${pkgname}-${pkgver}-libpng.tar.gz::https://skia.googlesource.com/third_party/libpng.git/+archive/\
386707c6d19b974ca2e3db7f5c61873813c6fe44.tar.gz"
"${pkgname}-${pkgver}-libwebp.tar.gz::https://chromium.googlesource.com/webm/libwebp.git/+archive/\
0fe1a89dbf1930fc2554dbe76adad5d962054ead.tar.gz"
"${pkgname}-${pkgver}-lua.tar.gz::https://skia.googlesource.com/external/github.com/lua/lua.git/+archive/\
e354c6355e7f48e087678ec49e340ca0696725b1.tar.gz"
"${pkgname}-${pkgver}-microhttpd.tar.gz::https://android.googlesource.com/platform/external/libmicrohttpd\
/+archive/748945ec6f1c67b7efc934ab0808e1d32f2fb98d.tar.gz"
"${pkgname}-${pkgver}-opencl-lib.tar.gz::https://skia.googlesource.com/external/github.com/GPUOpen-Tools/\
common-lib-amd-APPSDK-3.0/+archive/4e6d30e406d2e5a65e1d65e404fe6df5f772a32b.tar.gz"
"${pkgname}-${pkgver}-opencl-registry.tar.gz::https://skia.googlesource.com/external/github.com/\
KhronosGroup/OpenCL-Registry/+archive/932ed55c85f887041291cef8019e54280c033c35.tar.gz"
"${pkgname}-${pkgver}-opengl-registry.tar.gz::https://skia.googlesource.com/external/github.com/\
KhronosGroup/OpenGL-Registry/+archive/14b80ebeab022b2c78f84a573f01028c96075553.tar.gz"
"${pkgname}-${pkgver}-piex.tar.gz::https://android.googlesource.com/platform/external/piex.git/+archive/\
bb217acdca1cc0c16b704669dd6f91a1b509c406.tar.gz"
"${pkgname}-${pkgver}-sdl.tar.gz::https://skia.googlesource.com/third_party/sdl/+archive/\
5d7cfcca344034aff9327f77fc181ae3754e7a90.tar.gz"
"${pkgname}-${pkgver}-sfntly.tar.gz::https://chromium.googlesource.com/external/github.com/googlei18n/\
sfntly.git/+archive/b55ff303ea2f9e26702b514cf6a3196a2e3e2974.tar.gz"
"${pkgname}-${pkgver}-spirv-cross.tar.gz::https://chromium.googlesource.com/external/github.com/\
KhronosGroup/SPIRV-Cross/+archive/53ab2144b90abede33be5161aec5dfc94ddc3caf.tar.gz"
"${pkgname}-${pkgver}-spirv-headers.tar.gz::https://skia.googlesource.com/external/github.com/KhronosGroup/\
SPIRV-Headers.git/+archive/29c11140baaf9f7fdaa39a583672c556bf1795a1.tar.gz"
"${pkgname}-${pkgver}-spirv-tools.tar.gz::https://skia.googlesource.com/external/github.com/KhronosGroup\
/SPIRV-Tools.git/+archive/0c4feb643b89d1792b02f7cbef315e9d95633bd7.tar.gz"
"${pkgname}-${pkgver}-swiftshader.tar.gz::https://swiftshader.googlesource.com/SwiftShader/+archive/\
430def835f9f85d52f4a96db9b715cd9a7403c9c.tar.gz"
"${pkgname}-${pkgver}-wuffs.tar.gz::https://skia.googlesource.com/external/github.com/google/wuffs.git\
/+archive/4080840928c0b05a80cda0d14ac2e2615f679f1a.tar.gz"
"${pkgname}-${pkgver}-zlib.tar.gz::https://chromium.googlesource.com/chromium/src/third_party/zlib/+archive/\
ea3ba903faac98b64b2bf8de5e98cd97b335a474.tar.gz"
"gn::https://chromium-gn.storage-download.googleapis.com/3523d50538357829725d4ed74b777a572ce0ac74"
)
_gitsrc=("${source[@]:4:29}")
noextract=("${_gitsrc[@]%%::*}")
sha256sums=('9f4b098fe2327f2e9d73eb9f2aeebecad63e87ff2cf6fb6eeeee3c0778bb8874'
            'deaf646a615c79a4672b087562a09c44beef37e7acfc6f5f66a437d4f3b97a25'
            'SKIP'
            'SKIP'
            '519c6cb4c9848d0d264199ffa1cf0db1f54801d73761f7154eb234da59938336'
            'aa24de5def12a7fdce55fed1597f8963e0b0a53edee80cf4ebf948cb67f85cba'
            'bbd7ea3cd967cef781c9c9d21e0ee669c7b295d4a5b970db4fb3458f667e722a'
            'fb5ea8819605873837820d2fc8e918f63f0563ce5909887418327b2135d7abc8'
            '24de65063315ace8a576deddc899c7f39cd1e203d343b6e50930235bd276f37d'
            '576f3b2bafa98b2c1bbaf62240c3caf797d9e1844e9ce13e5047564f6351cdb8'
            '1495e9d046e52cdfd1fc984e1d88dfcc1f9632f67f33352192711104c704d730'
            'ec5e7d646bc1971bd3ac93518b2b2d29feef579f7becd4f9d9b81a6a0a03e532'
            'c4db4e9f64dbbb4fd4dec253550912937a1e1a1668534f631eb37903fb923fc7'
            '5e029fc50628fd5749b6fd901dd1cac7c4f92a3a9db2431b4306b1bbcff5aec5'
            '0d237fea0d5dcb5dbfeeff6109980cea2ac58e2c10727147684356719f8c5de6'
            'c0fdfb263bcc12c7fb6eafec55f0d1fd8383c37c3b1e4eb4596748214ffed093'
            'e7fed969dd5bf83d1269ad73fbc189aead42fb4f32b2f4ddee2cb46affaa2155'
            '6a5ec5804d3bc49ea79acce95a8ca36720842b83f15a368e2f98503d354b3dac'
            '152f67d21ba8765d16d8b8470879054a3a06e9185b9fadefe4853954642cc0ed'
            '4278b14776b9a09d85a91ebbb4af6b02df964f888ef33b2691164365bb82398f'
            '7515a68210b87d67c2919dac25ccf88f6a1da7a903b84951481e3a6f3f13f01b'
            'e5c9cbcd367c5b2d2ac3e6c90ec987d0aa55b82f17077af328751a6a9bac30c9'
            '6cebe18d357122853914b9fc3c13e0a221e2da19312d9745b41bf0042cc87310'
            '23d27a0ebe16b795e9733caa4a6fdc25089ced37556a9af0d21c6d13aa18f691'
            'e8f7ed6ca96d34235eb0ad427ff947e6f21d5d5a39f06e14bdc6473a40a06cf4'
            'dc783398daf21f2c66fb791f61a3e92547851fd841059a5a39912396b1e0f1ac'
            '823dc6115a2749dc69e8f6e5afb0deca15ee8851cb36168cf2cca131b5201455'
            '8d68986e51a55daa8ff196e83cb45fd05f7444bc1b7ce8dc380bdd45a070d256'
            '7a1c9d0118e24ca68f48260129cee9bf610ec0319928ccfc19d173132ca75d93'
            'a007a25eb9f274f30082e4186f1f69bddea55ce7ac61f87215ad1865a16c49ce'
            'fcd7aee8e452bfad434abdb3dfcaac2021184b16f43e26261cdc022e668b4ec0'
            '59889d07c504160a2320d4f95454e7bf53fa1d6543239d1160f4161afc7dd842'
            '274759bdd39d1c20da4144128d9246e50a3c5dc8570ae4b7689c840daece7746'
            'c8c2d617f1a33d6eb27f25ebcc30bd8ba1e6a0aa980cada21dda2ad1401fa4a2')

prepare() {
  cd "${srcdir}"

  # Install skia deps (essentially runs git-sync-deps with the files already downloaded)
  mkdir --parents --verbose skia/third_party/externals

  for _dep in buildtools common
  do
    mkdir --parents --verbose "skia/${_dep}"
    tar --verbose --extract --file "${pkgname}-${pkgver}-${_dep}.tar.gz" --directory "skia/${_dep}"
  done

  for _dep in angle2 dawn dng_sdk egl-registry expat freetype harfbuzz icu imgui opencl-registry \
              libjpeg-turbo libpng libwebp lua microhttpd opencl-lib opengl-registry piex \
              sdl sfntly spirv-cross spirv-headers spirv-tools swiftshader zlib wuffs
  do
    mkdir --parents --verbose "skia/third_party/externals/${_dep}"
    tar --verbose --extract --file "${pkgname}-${pkgver}-${_dep}.tar.gz" --directory \
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
