# Maintainer: Andres <andresrodriguezlemus@proton.me>
pkgname=pyfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python-based Neofetch alternative"
arch=('any')
url="https://github.com/yourusername/pyfetch"
license=('MIT')
depends=('python' 'python-pyfiglet')
source=("$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')  # Replace with actual checksum if needed

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 pyfetch "$pkgdir/usr/bin/pyfetch"
}
