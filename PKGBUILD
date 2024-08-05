# Maintainer: Your Name <your.email@example.com>
pkgname=archie
pkgver=1.1
pkgrel=1
pkgdesc="A brief description of your program"
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

