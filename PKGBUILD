# Maintainer hlgl2 <hlgl2 at web dot de>

# Upstream URL: http://gpl.internetconnection.net

pkgname=mtftar
pkgver=1.5
pkgrel=1
pkgdesc="A tool for translating a MTF stream to a TAR stream."
arch=('x86_64' 'i686' 'armv7h')
url="http://gpl.internetconnection.net"
license=('GPL2')
sha256sums=('a7f7753b52b1500dc30fd757cdcb4f3b8a9058e11f332b3c4e078ddbe4e451e5')
source=('https://web.archive.org/web/20161130081454/http://gpl.internetconnection.net/files/mtftar.tar.gz')

build() {
    cd $pkgname
    make
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$pkgname/mtftar" "$pkgdir/usr/bin/"
}
