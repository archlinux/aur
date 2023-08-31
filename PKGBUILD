# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
pkgname=joshuto-bin
pkgver=0.9.5
pkgrel=1
pkgdesc="ranger-like terminal file manager written in Rust"
url="https://github.com/kamiyaa/joshuto"
license=("LGPL3")
arch=("x86_64" "arm" "aarch64")
depends=("gcc-libs")
provides=("joshuto")
conflicts=("joshuto" "joshuto-git")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_arm=("$pkgname-$pkgver-arm.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-arm-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/kamiyaa/joshuto/releases/download/v$pkgver/joshuto-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
b2sums_x86_64=('08c0f6bd233063ee112b9bfa0b471efa65f4e36a190c7be98492efaa7425e02bd781766c8fa8d9dd82054d2f1bc470e5c708296932deac5df1e2c7a564ce7513')
b2sums_arm=('cd8dc2d2423140d2ee3e25540f48d8d904f6a4d633fb279f00b3c2bdbeaa66c67c6ac50c83244caf5b564aa8d4cd4ea6ecab593f55d0de06700dd2abc746f653')
b2sums_aarch64=('d9fff2bcde89c3708891f58e07f96e8afd65fc84d63fde31bbd2f6137c278de254202bb61a3ec8cf3fbe1034a36699365595ccff5b50e2ff26ca17ec0ae1bc6e')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/joshuto-v$pkgver-x86_64-unknown-linux-gnu/joshuto"
}
