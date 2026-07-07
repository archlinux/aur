# Maintainer: Soumadip Das <soumadip@zohomail.in>
pkgname=quikrun
pkgver=2.2.4
pkgrel=1
pkgdesc="Run your code without hassle"
arch=("any")
url="https://github.com/soymadip/quikrun"
license=("GPL3")
depends=("python")
makedepends=("python-installer")
source=("https://files.pythonhosted.org/packages/py3/q/$pkgname/$pkgname-$pkgver-py3-none-any.whl")
sha256sums=('2bb993a8462a6c80177a263dee3bc1f701b848dac349386479e4a1993864322d')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/$pkgname-$pkgver-py3-none-any.whl"
}
