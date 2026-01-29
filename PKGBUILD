# Maintainer: YourName <youremail@example.com>
pkgname=zipkg
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple AUR installer/remover script"
arch=('x86_64')
url="https://example.com/zipkg"
license=('MIT')

depends=('git' 'base-devel' 'bash')

source=("zipkg" "README.md")
sha256sums=('SKIP' 'SKIP')

package() {
    # Install the script as an executable
    install -Dm755 "$srcdir/zipkg" "$pkgdir/usr/bin/zipkg"

    # Install the README
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/zipkg/README.md"
}
