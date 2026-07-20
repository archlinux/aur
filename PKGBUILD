# Maintainer: HAHWUL <hahwul@gmail.com>
pkgname=gori
pkgver=0.1.1
pkgrel=1
pkgdesc="TUI web proxy (MITM) for inspecting, intercepting and replaying HTTP traffic."
arch=('x86_64')
url="https://github.com/hahwul/gori"
license=('Apache-2.0')
# The release binary is a static musl build, so it has no runtime depends.
source=(
  "gori-${pkgver}::https://github.com/hahwul/gori/releases/download/v${pkgver}/gori-v${pkgver}-linux-x86_64"
  "LICENSE-gori-${pkgver}::https://raw.githubusercontent.com/hahwul/gori/refs/tags/v${pkgver}/LICENSE"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "${srcdir}/gori-${pkgver}" "${pkgdir}/usr/bin/gori"
  install -Dm644 "${srcdir}/LICENSE-gori-${pkgver}" "${pkgdir}/usr/share/licenses/gori/LICENSE"
}
