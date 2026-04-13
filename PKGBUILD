# Maintainer: GooseStation contributors

_pkgname=goosestation-libretro
_upstream_commit=5e7be496a2d0480aaabbe9746a1a4576b469d301
_overlay_commit=d9522353f01a6bcbf5162613f7fe74027e233388
_overlay_raw="https://codeberg.org/hueponik/goosestation-overlay/raw/commit/${_overlay_commit}/games-emulation/goosestation-libretro/files"
pkgname=${_pkgname}
pkgver=0+git.${_upstream_commit:0:9}
pkgrel=1
pkgdesc='Sony PlayStation libretro core based on goosified DuckStation'
arch=('x86_64' 'aarch64')
url='https://codeberg.org/hueponik/goosestation-overlay'
license=('CC-BY-NC-ND-4.0')
depends=(
  'cpuinfo-pytorch-git'
  'freetype2'
  'libjpeg-turbo'
  'libpng'
  'libwebp'
  'libzip'
  'plutosvg'
  'systemd-libs'
  'zlib'
  'zstd'
)
makedepends=(
  'cmake'
  'ed'
  'git'
  'pkgconf'
)
optdepends=(
  'libretro-core-info: generic libretro core metadata collection'
  'vulkan-icd-loader: Vulkan renderer support'
  'shaderc: Vulkan renderer support'
  'spirv-cross: Vulkan renderer support'
)
provides=('goosestation-libretro')
conflicts=('goosestation-libretro')
source=(
  "duckstation-${_upstream_commit}.tar.gz::https://github.com/stenzek/duckstation/archive/${_upstream_commit}.tar.gz"
  "goosify.sh::${_overlay_raw}/goosify.sh"
  "goosestation_libretro.info::${_overlay_raw}/goosestation_libretro.info"
  "libretro.h::${_overlay_raw}/libretro.h"
  "libretro_opengl_context.h::${_overlay_raw}/libretro_opengl_context.h"
  "libretro_vulkan.h::${_overlay_raw}/libretro_vulkan.h"
  # cmake Find modules for system deps
  "Findcpuinfo.cmake::${_overlay_raw}/cmake/Findcpuinfo.cmake"
  "Findfreetype.cmake::${_overlay_raw}/cmake/Findfreetype.cmake"
  "FindPNG.cmake::${_overlay_raw}/cmake/FindPNG.cmake"
  "Findplutosvg.cmake::${_overlay_raw}/cmake/Findplutosvg.cmake"
  "Findshaderc.cmake::${_overlay_raw}/cmake/Findshaderc.cmake"
  "Findspirv_cross_c_shared.cmake::${_overlay_raw}/cmake/Findspirv_cross_c_shared.cmake"
  "FindWebP.cmake::${_overlay_raw}/cmake/FindWebP.cmake"
  "Findzstd.cmake::${_overlay_raw}/cmake/Findzstd.cmake"
  # cmake config shims
  "cpuinfoConfig.cmake::${_overlay_raw}/lib/cmake/cpuinfo/cpuinfoConfig.cmake"
  "freetypeConfig.cmake::${_overlay_raw}/lib/cmake/freetype/freetypeConfig.cmake"
  "PNGConfig.cmake::${_overlay_raw}/lib/cmake/PNG/PNGConfig.cmake"
  "plutosvgConfig.cmake::${_overlay_raw}/lib/cmake/plutosvg/plutosvgConfig.cmake"
  "ShadercConfig.cmake::${_overlay_raw}/lib/cmake/Shaderc/ShadercConfig.cmake"
  "spirv_cross_c_sharedConfig.cmake::${_overlay_raw}/lib/cmake/spirv_cross_c_shared/spirv_cross_c_sharedConfig.cmake"
  "WebPConfig.cmake::${_overlay_raw}/lib/cmake/WebP/WebPConfig.cmake"
  "zstdConfig.cmake::${_overlay_raw}/lib/cmake/zstd/zstdConfig.cmake"
)
sha256sums=('5ba5c07c054b3b005d82aeafdc46803fc9e2af77a591d3577b64b0a1086792d7'
            'ead7a00366b951b12007d4d94f71d3c40587e64893067d3ea3fcf07e9d625b53'
            '8817fa840f8496a37d130d43bcbc55bcb51c23b7db4e93f438a0f46fd51b6ce9'
            '4dd7690b6e83a236cd073b6f1a00006bac5182f1c22b612d816cbe6556bda66d'
            '03b2a16d41adec09e8b2e82cb17ea8cac45dec4d9aae904d057062f75c354ca4'
            'c6c11e4c4e792c0466e494bcfc8c10fa3d83f9b1d70e0fbf6307720d9f79823e'
            'ed2a2979f4317675feafc3b69e75696046ae2f55d917a8ce1843332f31079d2d'
            '1888e36030f24fefac484617e3004ec66dfeadc092ef7d96159d3e98b880dc2e'
            'b9651cfcfa39c6ae6667c25e58a60887b0d4ffda446c07309b0692ecdd417342'
            '7492167b15df409714a51c6539bb2b6f5a199872486083a2a1809abd8033da33'
            '777a5e67ad0873d2887aaa64a9bb812bca8c3f3fcae30a893a586bd001628d84'
            '0102c7a15bf3c8940640cf43af8bac00f9d96ce3312f3cb0f64eb6b7f23f6f6a'
            '37a8fda99817abdb5f98b1629eefc3ea2449bd675a85358cc4a11128d95605fc'
            'd80902f3f2ebd7f55bd74626ef65c25a3f93085574a8e4f346951e14a4d242e7'
            '9ab6f926c84a255431d51017d8016c9ae29e6d4ba33a1c9cef11dd1f946e7457'
            '20f07a35494c69711cffa5e9f98c16502fda7c8a06ce1891c23ac6cd6caec89a'
            'ff9920bc90857ebe92c90fb9432c444334d71a58afe368daa2c7d04150d81537'
            '0bc2dae8c8b8b785a85586f7801405eae28a0f4ae50d3af28a7b761d904ae117'
            'd1e16230c047a1ec3506e3b6e2a871ea2d689be26ede7fe14835c3c1f0740e7d'
            'ec826d84781062bec9ca5e5b847de479d72f5e7d5dbe4d8cdc98f32bb841b855'
            '6f77c032c5f73f4927f4945e28178ee4bdc7846b516b03ca1bbd38ab82911106'
            'ab8d0ee6561098cda7e5bd62a727e72ca4c89caf57ab4e37beaceba71b5ef6e5')

_setup_cmake_shims() {
  # Set up cmake Find modules and config shims in a directory structure
  # that DuckStation's cmake can find via CMAKE_MODULE_PATH and CMAKE_PREFIX_PATH
  local shimdir="${srcdir}/cmake-shims"
  install -d "${shimdir}/cmake"
  install -d "${shimdir}/lib/cmake/cpuinfo"
  install -d "${shimdir}/lib/cmake/freetype"
  install -d "${shimdir}/lib/cmake/PNG"
  install -d "${shimdir}/lib/cmake/plutosvg"
  install -d "${shimdir}/lib/cmake/Shaderc"
  install -d "${shimdir}/lib/cmake/spirv_cross_c_shared"
  install -d "${shimdir}/lib/cmake/WebP"
  install -d "${shimdir}/lib/cmake/zstd"

  # Find modules
  install -m644 "${srcdir}/Findcpuinfo.cmake"              "${shimdir}/cmake/"
  install -m644 "${srcdir}/Findfreetype.cmake"              "${shimdir}/cmake/"
  install -m644 "${srcdir}/FindPNG.cmake"                   "${shimdir}/cmake/"
  install -m644 "${srcdir}/Findplutosvg.cmake"              "${shimdir}/cmake/"
  install -m644 "${srcdir}/Findshaderc.cmake"               "${shimdir}/cmake/"
  install -m644 "${srcdir}/Findspirv_cross_c_shared.cmake"  "${shimdir}/cmake/"
  install -m644 "${srcdir}/FindWebP.cmake"                  "${shimdir}/cmake/"
  install -m644 "${srcdir}/Findzstd.cmake"                  "${shimdir}/cmake/"

  # Config shims (redirectors that point back to Find modules)
  install -m644 "${srcdir}/cpuinfoConfig.cmake"              "${shimdir}/lib/cmake/cpuinfo/"
  install -m644 "${srcdir}/freetypeConfig.cmake"             "${shimdir}/lib/cmake/freetype/"
  install -m644 "${srcdir}/PNGConfig.cmake"                  "${shimdir}/lib/cmake/PNG/"
  install -m644 "${srcdir}/plutosvgConfig.cmake"             "${shimdir}/lib/cmake/plutosvg/"
  install -m644 "${srcdir}/ShadercConfig.cmake"              "${shimdir}/lib/cmake/Shaderc/"
  install -m644 "${srcdir}/spirv_cross_c_sharedConfig.cmake" "${shimdir}/lib/cmake/spirv_cross_c_shared/"
  install -m644 "${srcdir}/WebPConfig.cmake"                 "${shimdir}/lib/cmake/WebP/"
  install -m644 "${srcdir}/zstdConfig.cmake"                 "${shimdir}/lib/cmake/zstd/"
}

prepare() {
  cd "duckstation-${_upstream_commit}"

  local goosify="${srcdir}/goosify.sh"
  install -m755 "${goosify}" .
  bash ./goosify.sh
}

build() {
  _setup_cmake_shims
  local shimdir="${srcdir}/cmake-shims"

  # Detect available GPU backends
  local _enable_opengl=OFF _enable_vulkan=OFF
  if pkg-config --exists gl 2>/dev/null || pkg-config --exists opengl 2>/dev/null; then
    _enable_opengl=ON
  fi
  if pkg-config --exists vulkan 2>/dev/null; then
    _enable_vulkan=ON
  fi

  cmake -S "duckstation-${_upstream_commit}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_DISABLE_PRECOMPILE_HEADERS=OFF \
    -DBUILD_LIBRETRO=ON \
    -DBUILD_REGTEST=OFF \
    -DBUILD_TESTS=OFF \
    -DENABLE_OPENGL=${_enable_opengl} \
    -DENABLE_VULKAN=${_enable_vulkan} \
    -DLIBRETRO_HEADERS_DIR="${srcdir}" \
    -DCMAKE_MODULE_PATH="${shimdir}/cmake" \
    -DCMAKE_PREFIX_PATH="${shimdir}" \
    -DCMAKE_CXX_FLAGS="-Wno-invalid-offsetof" \
    -Wno-dev

  cmake --build build --parallel --target duckstation_libretro

  # Verify no internal symbols leak — collisions with libvulkan etc. cause hangs
  local _leaked
  _leaked=$(nm -D build/src/duckstation-libretro/goosestation_libretro.so \
    | grep -E '^[0-9a-f]+ [TBD] ' | grep -v ' retro_' || true)
  if [[ -n "$_leaked" ]]; then
    echo "ERROR: leaked symbols from libretro core:" >&2
    echo "$_leaked" >&2
    return 1
  fi
}

package() {
  install -Dm755 build/src/duckstation-libretro/goosestation_libretro.so \
    "${pkgdir}/usr/lib/libretro/goosestation_libretro.so"

  install -Dm644 "${srcdir}/goosestation_libretro.info" \
    "${pkgdir}/usr/share/libretro/info/goosestation_libretro.info"
}
