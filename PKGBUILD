# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.2.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('d3444a8bbcea89a0e9c8ce2d6842ce509f351c13d8ef9ecb500e8504973d159c')
sha256sums_x86_64=('1af9fc942c82f5008006c981279fcf0b67538b30ff22820aff990a74dafe47bf')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
