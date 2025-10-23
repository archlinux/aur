# Maintainer: Zwee <Zwee42@gmail.com>
pkgname=imgtopwd
pkgver=0.1.0
pkgrel=1
pkgdesc="Generate deterministic passwords from images"
arch=('x86_64')
url="https://github.com/Zwee42/imgtopwd"
license=('GPL-3.0')
depends=('python' 'python-pillow')
source=("imgtopwd.py" "README.md" "LICENSE")
md5sums=('SKIP' 'SKIP' 'SKIP')

package() {
    # Install the Python script into /usr/bin
    install -Dm755 "$srcdir/imgtopwd.py" "$pkgdir/usr/bin/imgtopwd"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}