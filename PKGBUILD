# Maintainer: Keiran keiran0@proton.me
pkgname=archie
pkgver=1.3
pkgrel=1
pkgdesc="Archie is a command-line tool for managing packages on Arch Linux"
arch=('x86_64')
url="https://github.com/zackychann/archie"
license=('GPL')
source=("$url/releases/download/v$pkgver/$pkgname.tar.zst")
sha256sums=('SKIP')  # Replace 'SKIP' with the actual sha256sum of the tar.zst file for better security

package() {
    cd "$srcdir"
    # Install the binary directly to /usr/bin
    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

