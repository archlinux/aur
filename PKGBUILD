# Maintainer: Alex Joedt
pkgname=dman
pkgver=1.9.0
pkgrel=1
pkgdesc="A dotfile manager focused on Git overlay model and snapshots"
arch=('x86_64' 'aarch64')
url="https://github.com/alexjoedt/dman"
license=('MIT')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alexjoedt/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alexjoedt/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('6bdbbe778a2921416625d60a21541337293ef242834a15093f3b395a2da3f0ce')
sha256sums_aarch64=('628ac3628443c175585086f4159d1928385f18f780f3addc14f9dcdd6dbce707')

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}