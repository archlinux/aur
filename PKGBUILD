# Maintainer: HAHWUL <hahwul@gmail.com>
pkgname=hwaro
pkgver=0.10.0
pkgrel=1
pkgdesc="Lightweight and fast Static Site Generator(SSG) written in Crystal."
arch=('x86_64')
url="https://github.com/hahwul/hwaro"
license=('MIT')
source=("hwaro-${pkgver}::https://github.com/hahwul/hwaro/releases/download/v${pkgver}/hwaro-v${pkgver}-linux-x86_64")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/hwaro-${pkgver}" "${pkgdir}/usr/bin/hwaro"
  install -Dm644 "${srcdir}/../LICENSE" "${pkgdir}/usr/share/licenses/hwaro/LICENSE"
}
