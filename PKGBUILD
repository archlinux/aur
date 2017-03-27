# Maintainer: Jakob Kreuze <jakob@memeware.net>
pkgname=python-distorm3
pkgver=3.3.4
pkgrel=1
pkgdesc="Powerful Disassembler Library For x86/AMD64."
arch=('i686' 'x86_64')
url="https://github.com/gdabah/distorm"
license=('BSD')
depends=('python')
makedepends=()
source=("$pkgname::https://github.com/gdabah/distorm/releases/download/v3.3.4/distorm3-3.3.4.zip")
md5sums=('SKIP')

package() {
    cd "$srcdir/distorm3-3.3.4"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
