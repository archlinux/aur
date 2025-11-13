# Maintainer: Lunethra

pkgname=voltix
pkgver=1.0.0
pkgrel=1
pkgdesc="🔋 Display battery info as an ASCII battery in terminal"
arch=('any')
url="https://github.com/Lunethra/voltix"
license=('MIT')
depends=('python' 'python-typer' 'python-rich')
source=("main.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/main.py" "$pkgdir/usr/bin/voltix"
}
