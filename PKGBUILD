# Maintainer: Hugo Posnic <hugo.posnic@gmail.com>
# Author: Hugo Posnic <hugo.posnic@gmail.com>
# Author: Nathan Seva <nathan.seva@outlook.fr>
pkgname=imeditor
pkgver=0.4
pkgrel=1
pkgdesc="Simple & versatile image editor."
arch=("any")
url="https://github.com/ImEditor/ImEditor"
license=('GPL')
depends=('python' 'gtk3' 'python-pillow')
source=("$url/archive/$pkgver.tar.gz")
md5sums=("9c600f208d61597d8294b78fabf04317")

package() {
    cd ${srcdir}/ImEditor-$pkgver
    install -dm755 ${pkgdir}/usr/share/${pkgname}
    cp -R imeditor/* ${pkgdir}/usr/share/${pkgname}
    install -D -m644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
