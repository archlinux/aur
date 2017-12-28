# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.4.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('bae5f061c4bbe144ce8d9b1c2df6b26c8ccf13772e302429bfde7f10161512e0')
sha256sums_x86_64=('a5a3f49de62c9b1dd9fae7ebb224dcb8df4ad06bb125bcf2851f13a15835dd40')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
