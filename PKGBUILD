# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=libumlib0
pkgver=0.8.2
pkgrel=1
pkgdesc="Library with common functions used by every UMView module."
arch=('x86_64')
url="https://sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc>=2.4')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
install="${pkgname}.install"
source=("http://ftp.us.debian.org/debian/pool/main/u/umview/libumlib0_0.8.2-1.1_amd64.deb"
        "${pkgname}.install")
md5sums=("28edfce5ed77824603fbf0742a790e78"
         "b4165e6142a92d65c8e14479486decc4")

prepare() {
   cd "$srcdir"
   tar -xf data.tar.xz
}

package() {
   cp -r "${srcdir}/usr" "$pkgdir"
}
