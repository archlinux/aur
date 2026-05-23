# Maintainer: Soumadip Das <soumadip@zohomail.in>
pkgname=quikrun
pkgver=2.1.0
pkgrel=1
pkgdesc="Run your code without hassle"
arch=("any")
url="https://github.com/soymadip/quikrun"
license=("GPL3")
depends=("python")
makedepends=("python-installer")
source=("https://files.pythonhosted.org/packages/py3/q/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('d6561b776f668cf6aeb56554a4be3330df88608e90a89f7e08203905a45d01b0')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/$pkgname-$pkgver-py3-none-any.whl"
}
