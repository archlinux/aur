# Maintainer: kyeboard <me@kyeboard.me>

pkgname="planetary"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="A blazingly fast tool to print your contributions in terminal elegantly"
arch=("x86_64")
url="https://planetary.kyeboard.me"
license=("MIT")
depends=()
provides=("planetary")
conflicts=("planetary")
source=("$pkgname-$pkgver.tgz::https://github.com/kyeboard/planetary/releases/download/v${pkgver}/planetary-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/bin"
    ln -s planetary "$pkgdir/usr/bin/planetary"
    install -m755 planetary "$pkgdir/usr/bin"
}

