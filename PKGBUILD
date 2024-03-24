pkgname=publisher
pkgver=0.0.2
pkgrel=0
pkgdesc="Tool to publish & distribute CLI tools"
arch=('x86_64' 'i686')
url="https://github.com/termapps/publisher"
license=("MIT")
provides=("publisher")
source_x86_64=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v0.0.2/publisher-v0.0.2-x86_64-unknown-linux-gnu.zip)
source_i686=($pkgname-$pkgver.zip::https://github.com/termapps/publisher/releases/download/v0.0.2/publisher-v0.0.2-i686-unknown-linux-gnu.zip)
sha256sums_x86_64=("bd3ba103dfb536bccc3016720141820d322465d7eb5bd1e29d32c61375c363d1")
sha256sums_i686=("509a72d2a6b49659b3050b551fa483d4f656b7fa8c09e4ebc146d97ee3509801")

package() {
    install -Dm755 "$srcdir/publisher" "$pkgdir/usr/bin/publisher"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/publisher/LICENSE"
}
