# Maintainer: Alex Joedt
pkgname=dman
pkgver=1.4.0
pkgrel=1
pkgdesc="A dotfile manager focused on Git overlay model and snapshots"
arch=('x86_64' 'aarch64')
url="https://github.com/alexjoedt/dman"
license=('MIT')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alexjoedt/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alexjoedt/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('2e96ae8633ee76f89b2f485f77632b45d704fcbd6d00364488bfcae5651274b7')
sha256sums_aarch64=('77e4fd922c2e233a7c9e3084949c6f18254435aa3b7490a96bf75ee0c50fbed8')

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}