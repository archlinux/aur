# Maintainer: Samuel Åkesson <sermuns@lysator.liu.se>
pkgname=stil-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="generate STatic site from Index Listing of directory"
url="https://github.com/sermuns/stil"
license=("WTFPL")
arch=("x86_64")
provides=("stil")
conflicts=("stil")
source=("https://github.com/sermuns/stil/releases/download/v$pkgver/stil-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('9fd864c9f54f8abba7932875e52e3a257fbb8ff3149ffa57a9117f89d378bbf9')
options=(!debug)

package() {
    install -Dm755 stil -t "$pkgdir/usr/bin"
}
