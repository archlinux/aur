# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=rainbow-roads-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Animate your exercise maps"
arch=('x86_64')
url="https://github.com/NathanBaulch/rainbow-roads"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/rainbow-roads-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('79207b681a52dcd184f24f890c4315e1b4941419d5c745ce2f5a75fee6c65bb9')

package() {
  install -Dm755 "rainbow-roads" "${pkgdir}/usr/bin/rainbow-roads"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
