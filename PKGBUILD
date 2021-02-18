# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.17.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_x86_64=("https://github.com/OmniDB/OmniDB/releases/download/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_x86_64=('4fa5c2d2a7e79b408538633031c7c0fbdc216e74d862f0c86267cf703d42aec4')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
