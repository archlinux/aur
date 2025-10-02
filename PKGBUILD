# Maintainer: Andres <andresrodriguezlemus@proton.me>
pkgname=pyfetch
pkgver=1.0.1
pkgrel=1
arch=('any')
license=('MIT')
depends=('python' 'python-pyfiglet')
source=("https://github.com/andresr124/pyfetch/releases/download/v1.0.1/pyfetch-1.0.1.tar.gz")
sha256sums=('SKIP')  # Replace with actual checksum if you prefer

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 pyfetch "$pkgdir/usr/bin/pyfetch"
}
