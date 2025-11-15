# Maintainer: Samuel Åkesson <sermuns@lysator.liu.se>
pkgname=stil-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="generate STatic site from Index Listing of directory"
url="https://github.com/sermuns/stil"
license=("WTFPL")
arch=("x86_64")
provides=("stil")
conflicts=("stil")
source=("https://github.com/sermuns/stil/releases/download/v$pkgver.tar.gz")
sha256sums=('128f4f8f280de1624481e91114b0040ee798faba84ce0df2171025deb9ae6e65')
options=(!debug)

package() {
    install -Dm755 stil -t "$pkgdir/usr/bin"
}
