# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}-bin
pkgver=0.9.14
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
source=("https://github.com/jclehner/nmrpflash/releases/download/v${pkgver}/nmrpflash-${pkgver}-linux.zip")
sha256sums=('0e979660307384225a49b9634cb308c0ab21e9e4750b8f5b593ce146177fb29a')

package() {
  install -Dm0755 nmrpflash "${pkgdir}"/usr/bin/nmrpflash
}
