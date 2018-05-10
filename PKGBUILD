# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mirage
pkgver=1.0_pre1
pkgrel=1
pkgdesc="A simple GTK+ Image Viewer"
url="https://sourceforge.net/projects/mirageiv.berlios/"
license=('GPL')
depends=('pygtk' 'desktop-file-utils')
arch=('x86_64')
source=(http://downloads.sourceforge.net/project/mirageiv.berlios/${pkgname}-${pkgver}.tar.bz2)
md5sums=('dc2f2036a4b1d65c75575b724c0bb22f')

build() {
    cd ${pkgname}-${pkgver}
    python2 setup.py build
}
package() {
    cd ${pkgname}-${pkgver}
    python2 setup.py install --root="${pkgdir}"
}
