# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.14.5
pkgrel=1
pkgdesc="A terminal client for hack.chat"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
conflicts=("hcclient")
depends=()
source=("hcclient-${pkgver}-arch.tar.gz::${url}/releases/download/v$pkgver/hcclient-${pkgver}-arch.tar.gz")
sha256sums=('cc080249c96c3bff1d3bc3218c8b1fc5d675b082c69c10693dcca6c79d230cf6')

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
