# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.3.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('95f44e0c3be5a6a04459f37034277073750854aad84066752710184691e6bbe9')
sha256sums_x86_64=('5ff093d8cdac3880735dedbd318eb57621e97e7badf0502ef867b18497203c4c')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
