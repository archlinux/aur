# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-app"
pkgver=2.11.0
pkgrel=1
pkgdesc="Web tool for database management. This is a standalone version that can be used to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-app_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('f369b5c161e5a7dd21ce7fac514f94eaf8ea45906f53d8473af29546a9b4efd8')
sha256sums_x86_64=('859a3fd537922135d8a1ad504253c02a46a50ef44943b1859566ea1177bf6bb0')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
