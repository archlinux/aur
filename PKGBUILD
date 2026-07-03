# Maintainer: Soumadip Das <soumadip@zohomail.in>
pkgname=quikrun
pkgver=2.2.0
pkgrel=1
pkgdesc="Run your code without hassle"
arch=("any")
url="https://github.com/soymadip/quikrun"
license=("GPL3")
depends=("python")
makedepends=("python-installer")
source=("https://files.pythonhosted.org/packages/py3/q/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('2c681396e58698b8f5141e6b3548ae5e940776daec4b2cc71f81bbe1974ac377')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/$pkgname-$pkgver-py3-none-any.whl"
}
