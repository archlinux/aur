# Maintainer: Joffrey <j-off@live.fr>

pkgname=blocklist
pkgver=0.1.1
pkgrel=1
pkgdesc='Command-line tool for download and write blocklists'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Joffr3y/$pkgname"
license=('GPL3')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('062c390358560ea29c57372cb916a0e95c27714551b21cad80f7ba96056b83f5')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python './setup.py' install --root="$pkgdir" --optimize=1
}
