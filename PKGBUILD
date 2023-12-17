# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.18.1
pkgrel=5
pkgdesc="A terminal client for hack.chat, deprecated binary distribution"
arch=("x86_64")
url="https://github.com/AnnikaV9/hcclient"
license=("Unlicense")
provides=("hcclient")
conflicts=("hcclient")
depends=()
source=("hcclient-${pkgver}-arch.tar.gz::${url}/releases/download/v$pkgver/hcclient-${pkgver}-arch.tar.gz")
sha256sums=('6ea3c8d6493f4ecf18a1d33035b51a34591d93b33c79859bad450684e580663c')

build() {
  echo "===================="
  echo "This package will not be updated after 1.18.1 as binary builds of hcclient are no longer provided."
  echo "Switch to the \`hcclient\` or \`hcclient-latex\` packages."
  echo "===================="
  read -p "Press enter to continue anyway..."
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
