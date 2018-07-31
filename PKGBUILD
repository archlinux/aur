# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.10.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('39be3f26a2da8c6ebcc4de32fea7524a57773b2bec6d63c1b525cc9070451064')
sha256sums_x86_64=('42935fdfad689cffc1ba1997d6982292923f66a30dd02c34770a66b02fce9625')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
