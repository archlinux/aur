# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.16.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_x86_64=('095726b3d47853a3c3fc2ca4c581c29eb4cb74c08cab02295001206c5336719e')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
