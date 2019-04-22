# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.15.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_x86_64=('8d001343ac5a3c277c54ebbda69dd3229cbc69a95bb35daf2576443abcc5ce11')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
