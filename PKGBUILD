# Maintainer: Soumadip Das <soumadip@zohomail.in>
pkgname=quikrun
pkgver=2.2.2
pkgrel=1
pkgdesc="Run your code without hassle"
arch=("any")
url="https://github.com/soymadip/quikrun"
license=("GPL3")
depends=("python")
makedepends=("python-installer")
source=("https://files.pythonhosted.org/packages/py3/q/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=("SKIP")

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/$pkgname-$pkgver-py3-none-any.whl"
}
