# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}-bin
pkgver=0.9.15
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
source=("https://github.com/jclehner/nmrpflash/releases/download/v${pkgver}/nmrpflash-${pkgver}-linux.zip")
sha256sums=('41e5fa7b35986a140f23bcc35a580c07a404b52f781f4f51f45c5c6ac237a6c6')

package() {
  install -Dm0755 nmrpflash "${pkgdir}"/usr/bin/nmrpflash
}
