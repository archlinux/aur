# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.11.2
pkgrel=5
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
conflicts=("hcclient")
depends=()
source=("hcclient-${pkgver}-arch.tar.gz::${url}/releases/download/v$pkgver/hcclient-${pkgver}-arch.tar.gz")
sha256sums=('7748a2985ce2ec07e2a9e9953c07a54ac4bcdb91957e221e163b7839f299c578')

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
