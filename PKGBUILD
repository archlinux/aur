pkgname=publisher
pkgver=0.1.3
pkgrel=0
pkgdesc="Tool to publish & distribute CLI tools"
arch=('x86_64' 'i686')
url="https://github.com/termapps/publisher"
license=("MIT")
provides=("publisher")
conflicts=()
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v$pkgver/publisher-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("7e8471a919bbab089685d7651341cb081ff96553e0a612cd28b71745bfea6538")
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v$pkgver/publisher-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("b6f8e62b9006aa0bbf8872a8118e453e6a30c6387682e03ae3aa957736907470")

package() {
    cd "$srcdir"
    install -Dm755 "publisher" "$pkgdir/usr/bin/publisher"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/publisher/LICENSE"
}
