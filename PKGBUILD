# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=joshuto-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="ranger-like terminal file manager written in Rust"
url="https://github.com/kamiyaa/joshuto"
license=("LGPL3")
arch=("x86_64")
depends=("gcc-libs")
provides=("joshuto")
conflicts=("joshuto" "joshuto-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
b2sums=('08c0f6bd233063ee112b9bfa0b471efa65f4e36a190c7be98492efaa7425e02bd781766c8fa8d9dd82054d2f1bc470e5c708296932deac5df1e2c7a564ce7513')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/joshuto-v$pkgver-x86_64-unknown-linux-gnu/joshuto"
}
