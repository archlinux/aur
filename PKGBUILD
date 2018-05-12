# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: James Rayner <james@archlinux.org>
# Contributor: Scott Horowitz <stonecrest@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mirage
pkgver=0.9.5.2
pkgrel=5
pkgdesc="A simple GTK+ Image Viewer"
url="https://sourceforge.net/projects/mirageiv.berlios/"
license=('GPL')
depends=('pygtk' 'desktop-file-utils' 'python2-exiv2')
arch=('x86_64')
source=(http://downloads.sourceforge.net/project/mirageiv.berlios/${pkgname}-${pkgver}.tar.bz2)
md5sums=('92191a4496b0a50486ed7299baf6729f')

build() {
    cd ${pkgname}-${pkgver}
    python2 setup.py build
}
package() {
    cd ${pkgname}-${pkgver}
    python2 setup.py install --root="${pkgdir}"
}
