# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}-bin
pkgver=0.9.20
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
source=("https://github.com/jclehner/nmrpflash/releases/download/v${pkgver}/nmrpflash-${pkgver}-linux.zip")
sha256sums=('23281d225fb986626ec120f3869f63f6bb42d1b32d8f0dad6650701e37d4aac3')

package() {
  install -Dm0755 nmrpflash "${pkgdir}"/usr/bin/nmrpflash
}
