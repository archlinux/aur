# Contributor: Max Devaine <maxdevaine@gmail.com>

pkgname=atinout
pkgver=0.9.1
pkgrel=1
pkgdesc='AT commands as input are sent to modem and responses given as output.'
arch=(i686 x86_64)
url='http://atinout.sourceforge.net/'
license=('GPL3')
makedepends=('')
conflicts=('')
source=("atinout-${pkgver}.tar.gz::http://sourceforge.net/projects/atinout/files/v${pkgver}/atinout-${pkgver}.tar.gz/download")
md5sums=('4448694147cd630dde1abfd73a10d753')


build() {
    cd ${srcdir}/atinout-$pkgver
    make
 }

package() {
    cd ${srcdir}/atinout-$pkgver
    install -Dm 755 atinout $pkgdir/usr/bin/atinout
}

