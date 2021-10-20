# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=libobjectbox
pkgver=0.14.0
pkgrel=1
pkgdesc='The library for objectbox. A database for objects and structs.'
arch=('x86_64')
url="https://github.com/objectbox/objectbox-c"
license=('MIT')
source=("${pkgname}-${pkgver}::https://github.com/objectbox/objectbox-c/releases/download/v${pkgver}/objectbox-linux-x64.tar.gz")
sha256sums=('78c7b55ba5258c198e03b355bbdb17b3696e8d85b3a6f564a9641dff2f2f8354')

package() {
    install -Dm755 lib/libobjectbox.so "${pkgdir}/usr/lib/libobjectbox.so"
}
