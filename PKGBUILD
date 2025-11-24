# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_zig=0.15
pkgname="zine"
pkgver=0.11.2
pkgrel=1
pkgdesc="Fast, Scalable, Flexible Static Site Generator (SSG)"
arch=(
  'aarch64'
  'x86_64'
)
url="https://zine-ssg.io"
_url="https://github.com/kristoff-it/${pkgname}"
license=('MIT')
depends=(
  'glibc'
)
makedepends=(
  "zig>=${_zig}"
)
_zigdepends=(
  # zine
  "zig-afl-kit-8ef04d1db48650345dca68da1e1b8f2615125c40.tar.gz::https://github.com/kristoff-it/zig-afl-kit/archive/8ef04d1db48650345dca68da1e1b8f2615125c40.tar.gz"
  "lsp-kit-4835b9d3d3cf732fe1830189d81f331c68fb3e77.tar.gz::https://github.com/zigtools/lsp-kit/archive/4835b9d3d3cf732fe1830189d81f331c68fb3e77.tar.gz"
  "scripty-50dbab8945440089384f26ec165d870c29555247.tar.gz::https://github.com/kristoff-it/scripty/archive/50dbab8945440089384f26ec165d870c29555247.tar.gz"

  "tracy-67d2d89e351048c76fc6d161e0ac09d8a831dc60.tar.gz::https://github.com/kristoff-it/tracy/archive/67d2d89e351048c76fc6d161e0ac09d8a831dc60.tar.gz"
  "mime-a2ed0cba3b1463217168034ffed8c1604e72598d.tar.gz::https://github.com/kristoff-it/mime/archive/a2ed0cba3b1463217168034ffed8c1604e72598d.tar.gz"
  "wuffs-5822dc06c75b30d53082debf68c90193cb2b2608.tar.gz::https://github.com/allyourcodebase/wuffs/archive/5822dc06c75b30d53082debf68c90193cb2b2608.tar.gz"
  "xcode-frameworks-8a1cfb373587ea4c9bb1468b7c986462d8d4e10e.tar.gz::https://github.com/hexops/xcode-frameworks/archive/8a1cfb373587ea4c9bb1468b7c986462d8d4e10e.tar.gz"
  "superhtml-8cb16babb0c66b6512d6aeb4cbc37ed90641d980.tar.gz::https://github.com/kristoff-it/superhtml/archive/8cb16babb0c66b6512d6aeb4cbc37ed90641d980.tar.gz"
  "zeit-46583c4695bade6841a558c0ce5648426b556214.tar.gz::https://github.com/rockorager/zeit/archive/46583c4695bade6841a558c0ce5648426b556214.tar.gz"
  "flow-syntax-6992eddeb9a4a013886db0cbca2156686d01efe4.tar.gz::https://github.com/neurocyte/flow-syntax/archive/6992eddeb9a4a013886db0cbca2156686d01efe4.tar.gz"
  "ziggy-4353b20ef2ac750e35c6d68e4eb2a07c2d7cf901.tar.gz::https://github.com/kristoff-it/ziggy/archive/4353b20ef2ac750e35c6d68e4eb2a07c2d7cf901.tar.gz"
  "supermd-530ac6c337c9a9511560fba3181db10d1fe23ef1.tar.gz::https://github.com/kristoff-it/supermd/archive/530ac6c337c9a9511560fba3181db10d1fe23ef1.tar.gz"

  # zig-afl-kit
  "AFLplusplus-a52f1376e2d49720c39e4abf4aa4944afbf82191.tar.gz::https://github.com/allyourcodebase/AFLplusplus/archive/a52f1376e2d49720c39e4abf4aa4944afbf82191.tar.gz"
  # wuffs
  "wuffs-mirror-release-c-90e4d81a6a8b7b601e8e568da32a105d7f7705e5.tar.gz::https://github.com/google/wuffs-mirror-release-c/archive/90e4d81a6a8b7b601e8e568da32a105d7f7705e5.tar.gz"
  # superhtml
  "known-folders-ab5cf5feb936fa3b72c95d3ad0c0c67791937ba1.tar.gz::https://github.com/ziglibs/known-folders/archive/ab5cf5feb936fa3b72c95d3ad0c0c67791937ba1.tar.gz"
  "lsp-kit-01c14e592d25dc57dfebba27b8bd2b4aa91c1140.tar.gz::https://github.com/zigtools/lsp-kit/archive/01c14e592d25dc57dfebba27b8bd2b4aa91c1140.tar.gz"
  # flow-syntax
  "tree-sitter-6e2827ee231e220467bf04d2a2746faff5cb204a.tar.gz::https://github.com/neurocyte/tree-sitter/releases/download/master-6e2827ee231e220467bf04d2a2746faff5cb204a/source.tar.gz"
  "cbor-7d2eeb68c8a2fb3f4d6baad6cc04c521b92974c0.tar.gz::https://github.com/neurocyte/cbor/archive/7d2eeb68c8a2fb3f4d6baad6cc04c521b92974c0.tar.gz"
  # ziggy
  "known-folders-aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz::https://github.com/ziglibs/known-folders/archive/aa24df42183ad415d10bc0a33e6238c437fc0f59.tar.gz"
  # supermd
  "cmark-gfm-b96c27a5152b9124d657dee7fb1186d0a13c1fe4.tar.gz::https://github.com/kristoff-it/cmark-gfm/archive/b96c27a5152b9124d657dee7fb1186d0a13c1fe4.tar.gz"

  # AFLplusplus
  "AFLplusplus-4.21c.tar.gz::https://github.com/AFLplusplus/AFLplusplus/archive/refs/tags/v4.21c.tar.gz"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
  # "${_zigdepends[@]}"
)
# noextract=(
#   "${_zigdepends[@]%%::*}"
# )
b2sums=('fdf89ce193cada8003899e165b6d4b90c34edbf3b8be4a8ff26a721de7a4df67585816ce4e1453a5e0e5cb90d801a2aeec7ca26d27fe4077fc1ea449416056c8')
           
# prepare() {
#   cd "${srcdir}"
#   for dep in "${_zigdepends[@]}"; do
#     zig fetch --global-cache-dir ./zig-global-cache "${dep%%::*}"
#   done
# }

build() {
  local zig_options=(
    --summary all
    --prefix /usr
    --search-prefix /usr
    --global-cache-dir "${srcdir}/zig-global-cache"
    # --system "${srcdir}/zig-global-cache/p"
    --verbose
    -Dtarget=native-linux.6.15-gnu.2.41
    -Dcpu=baseline
    -Doptimize=ReleaseSafe
  )

  cd "${srcdir}/${_pkgsrc}"
  DESTDIR="build" zig build "${zig_options[@]}"
  find "build" -type f -name '*.zig' -delete
}

# check() {
#   local zig_options=(
#     --summary all
#     --prefix /usr
#     --search-prefix /usr
#     --global-cache-dir "${srcdir}/zig-global-cache"
#     --system "${srcdir}/zig-global-cache/p"
#     --verbose
#     -Dtarget=native-linux.6.15-gnu.2.41
#     -Dcpu=baseline
#     -Doptimize=ReleaseSafe
#   )
# 
#   cd "${srcdir}/${_pkgsrc}"
#   DESTDIR="check" zig build test "${zig_options[@]}"
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
