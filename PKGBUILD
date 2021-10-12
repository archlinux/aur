# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}-bin
pkgver=0.9.16
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
source=("https://github.com/jclehner/nmrpflash/releases/download/v${pkgver}/nmrpflash-${pkgver}-linux.zip")
sha256sums=('e3b0d8a1eae935a2d0062e75b00db80caa43e3ad5c374eca31368d00ddcf907c')

package() {
  install -Dm0755 nmrpflash "${pkgdir}"/usr/bin/nmrpflash
}
