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
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')
options=(!debug)

package() {
    install -Dm755 stil -t "$pkgdir/usr/bin"
}
