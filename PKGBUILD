# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=python-minilog
pkgver=2.3.1
pkgrel=2
pkgdesc="Minimalistic wrapper for Python logging."
arch=('any')
url="https://github.com/jacebrowning/minilog"
license=('MIT')
depends=('python')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/bc/33/731b5be35c83268725451d25eeac78fa0625e9d0c8f115ad3b1e5173737f/minilog-${pkgver}-py3-none-any.whl")
noextract=("minilog-${pkgver}-py3-none-any.whl")
sha256sums=('1a679fefe6140ce1d59c3246adc991f9eb480169e5a6c54d2be9023ee459dc30')

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/minilog-${pkgver}-py3-none-any.whl"
}
