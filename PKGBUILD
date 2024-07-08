pkgname=publisher
pkgver=check
pkgrel=0
pkgdesc="Tool to publish & distribute CLI tools"
arch=('x86_64' 'i686')
url="https://github.com/termapps/publisher"
license=("MIT")
provides=("publisher")
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/vcheck/publisher-vcheck-x86_64-unknown-linux-gnu.zip)
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/vcheck/publisher-vcheck-i686-unknown-linux-gnu.zip)
sha256sums_x86_64=("Not Found")
sha256sums_i686=("Not Found")

package() {
    install -Dm755 "$srcdir/publisher" "$pkgdir/usr/bin/publisher"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/publisher/LICENSE"
}
