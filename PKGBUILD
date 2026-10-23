# Maintainer: Soumadip Das <soumadip@zohomail.in>
pkgname=quikrun
pkgver=2.4.0
pkgrel=1
pkgdesc="Run your code without hassle"
arch=("any")
url="https://github.com/soymadip/quikrun"
license=("GPL3")
depends=("python")
makedepends=("python-installer")
source=("https://files.pythonhosted.org/packages/py3/q/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('dad2c696841a6431dd973270dbe89178e68f106907a1cb9812a7e2f03ebc5bd5')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/$pkgname-$pkgver-py3-none-any.whl"
}
