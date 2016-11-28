# Maintainer: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>
pkgname=crudini
_branch=master
pkgver=0.8
pkgrel=1
pkgdesc="A utility for manipulating ini files"
url="http://www.pixelbeat.org/programs/crudini/"
arch=("any")
license=('GPL2')
depends=('python2-iniparse')
source=("https://github.com/pixelb/crudini/archive/master.zip")
sha512sums=("2041229b59504c48d3c1dde2f61bfe1ea34444eacbefc3ed331a4db2220040d946236bf4816201835f37ecc3917c998996eb948a1d377e24c9afcee2b4d70444")
prepare() {
    sed -i 's/python/python2/' ${srcdir}/${pkgname}\-${_branch}/crudini
}
package() {
    mkdir -p ${pkgdir}/usr/bin
    install -m755 ${srcdir}/${pkgname}\-${_branch}/crudini ${pkgdir}/usr/bin
}
