# Maintainer: Alex Joedt
pkgname=dman
pkgver=1.3.0
pkgrel=1
pkgdesc="A dotfile manager focused on Git overlay model and snapshots"
arch=('x86_64' 'aarch64')
url="https://github.com/alexjoedt/dman"
license=('MIT')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alexjoedt/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alexjoedt/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('bb2e44785a8f29565a7d95953de72350438c09bd63bdce5169abc25be5482c9d')
sha256sums_aarch64=('10023b5b240a28d17b86704f58aa8b33fa24e0c60ae532fcd2571424d5449b3b')

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}