# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.5.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('80c4baf41c72e060b712c8c757c40e59eb9eda9590ad7602ee56ad56a955048f')
sha256sums_x86_64=('43baf126c811b0c6e0dc73d4327a62d721cb0bc94f26c555309e406edcb7a011')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
