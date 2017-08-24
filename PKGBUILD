# Maintainer: madflow <madflow@web.de>
pkgname="omnidb-server"
pkgver=2.0.4
pkgrel=1
pkgdesc="Web tool for database management. Install this in any server, and it allows anybody with a web browser to connect to any database server."
arch=('i686' 'x86_64')
url="https://omnidb.org/"
license=('MIT')
depends=('python')
source_i686=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-i386.deb")
source_x86_64=("https://omnidb.org/dist/${pkgver}/omnidb-server_${pkgver}-debian-amd64.deb")
options=("!strip")
sha256sums_i686=('42d6022c71d1bd929a6327d4adc283346bcc0a45684eac63e94f8d3e7b7f4618')
sha256sums_x86_64=('6427eb329ef045489440d73ee2c4c43dd14900e1ee88533aef13d5b4582d5fee')

package() {
    cd "$pkgdir"
    tar xf "$srcdir/data.tar.xz"
}
