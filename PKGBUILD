# Maintainer: Alex Joedt
pkgname=dman
pkgver=1.7.0
pkgrel=1
pkgdesc="A dotfile manager focused on Git overlay model and snapshots"
arch=('x86_64' 'aarch64')
url="https://github.com/alexjoedt/dman"
license=('MIT')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alexjoedt/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alexjoedt/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('8773fc2606e25d1b5e556a628a6feffd7fffb4e0b64a39bbb32d14a6e3d4c9c2')
sha256sums_aarch64=('97307afced2e4aba4955367b8827b12b78a50f82efe77aa136430951e2718a90')

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}