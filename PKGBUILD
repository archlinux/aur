# Maintainer: Alex Joedt <alex@joedt.com>
pkgname=dman
pkgver=1.0.0
pkgrel=1
pkgdesc="A dotfile manager focused on Git overlay model and snapshots"
arch=('x86_64' 'aarch64')
url="https://github.com/alexjoedt/dman"
license=('MIT')
depends=('glibc')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/alexjoedt/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/alexjoedt/$pkgname/releases/download/v$pkgver/${pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('4170f126380da13ca4b407c76d6796386d17a233114e5c2db5f036cf0d8029db')
sha256sums_aarch64=('f89bb3735ccad8d579161a1263f03374ade3d72efd460ca14751dc096de89d59')

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
