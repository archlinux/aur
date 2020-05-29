# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=cups-xerox-phaser-6500
pkgver=1.0.0
pkgrel=2
_rpmname=Xerox-Phaser-6500-Linux.rpm
pkgdesc='CUPS driver for the Xerox Phaser 6500 series (N & DN)'
url='https://www.support.xerox.com/support/phaser-6500/downloads/engb.html?operatingSystem=linux&fileLanguage=en_GB'
license=('custom')
arch=('any')
depends=('cups')
makedepends=('rpmextract' 'libtool')
source=("http://download.support.xerox.com/pub/drivers/6500/drivers/linux/en_GB/$_rpmname")
sha256sums=('29b46cd1e57463ad4adcfa507bdaecd9fcdbda50fdb4cb34f53164af45dbebcb')

package() {
    cp -r usr "$pkgdir/"
}

