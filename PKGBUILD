pkgname=publisher
pkgver=0.1.4
pkgrel=0
pkgdesc="Tool to publish & distribute CLI tools"
arch=('x86_64' 'i686')
url="https://github.com/termapps/publisher"
license=("MIT")
provides=("publisher")
conflicts=()
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v$pkgver/publisher-v$pkgver-x86_64-unknown-linux-gnu.zip)
sha256sums_x86_64=("34f8c8c5b38e326b279a0e73672b803c487e184f811ee4a524b021c64d39bb77")
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v$pkgver/publisher-v$pkgver-i686-unknown-linux-gnu.zip)
sha256sums_i686=("775404696bb099181c8939f24ee0dc876349886f26527f7abb4168ec386c5071")

package() {
    cd "$srcdir"
    install -Dm755 "publisher" "$pkgdir/usr/bin/publisher"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/publisher/LICENSE"
}
