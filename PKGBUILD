pkgname=langman
pkgver=1.0
pkgrel=1
pkgdesc="Single-binary doc viewer"
arch=('x86_64')
license=('GPL2') # Change this from MIT to GPL2

package() {
    install -Dm755 langman "$pkgdir/usr/bin/langman"
    # This installs the license file to the system folder
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
