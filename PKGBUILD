# Maintainer: Soumadip Das <soumadip@zohomail.in>
pkgname=quikrun
pkgver=1.1.0
pkgrel=1
pkgdesc="Run your code without hassle"
arch=("any")
url="https://github.com/soymadip/quikrun"
license=("GPL3")
depends=("python")
makedepends=("python-installer")
source=("https://files.pythonhosted.org/packages/py3/q/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('8f011c465d042e262b3ac32709738dd7564e0a3aa0285525db0f439f689a78e0')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/$pkgname-$pkgver-py3-none-any.whl"
}
