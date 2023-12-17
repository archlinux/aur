# Maintainer: AnnikaV9 <carrot.moncher@gmail.com>

pkgname=hcclient-bin
pkgver=1.18.1
pkgrel=2
pkgdesc="A terminal client for hack.chat"
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
  echo "This package will NO LONGER be updated as binary builds of hcclient are not provided anymore."
  echo "\`hcclient-bin\` will be frozen at 1.18.1."
  echo "Switch to the \`hcclient\` or \`hcclient-latex\` packages to receive updates."
  echo "===================="
  read -p "Press any key to continue anyway..."
}

package() {
  install -Dm755 "${srcdir}/hcclient-${pkgver}" "${pkgdir}/usr/bin/hcclient"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/hcclient/LICENSE"
}
