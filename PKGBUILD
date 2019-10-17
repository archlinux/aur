# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}-bin
pkgver=0.9.13
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
source=("https://github.com/jclehner/nmrpflash/releases/download/v${pkgver}/nmrpflash-${pkgver}-linux.zip")
sha256sums=('643a6207aa0a700ebafbf49aeb7591741cbb84027e4fb109527059d4076aeff7')

package() {
  install -Dm0755 nmrpflash "${pkgdir}"/usr/bin/nmrpflash
}
