# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.18.0
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
conflicts=("hcclient")
depends=()
source=("hcclient-${pkgver}-arch.tar.gz::${url}/releases/download/v$pkgver/hcclient-${pkgver}-arch.tar.gz")
sha256sums=('f3f11719322ebf02e50ad87830a7e7a8ac1473aa6eb6b88d2f5d45cb7f708266')

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
