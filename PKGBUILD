pkgname=publisher
pkgver=0.1.9
pkgrel=0
pkgdesc="Tool to publish & distribute CLI tools"
arch=('x86_64' 'i686')
url="https://github.com/termapps/publisher"
license=("MIT")
provides=("publisher")
conflicts=()
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v$pkgver/publisher-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("f9cb6b0295dcb7f8f93ac6de2bb6ff0b20d550b746c5c58f0f61420272100e8d")
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v$pkgver/publisher-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("39efd304da47d62a13c3b1afcc702066df0032b76e90a0bb6922c8eff7afc949")

package() {
    cd "$srcdir"
    install -Dm755 "publisher" "$pkgdir/usr/bin/publisher"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/publisher/LICENSE"
}
