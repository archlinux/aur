# Maintainer: Daniel Kantor <git@daniel-kantor.com>
pkgname=python-seagoat
pkgver=0.40.7
pkgrel=1
pkgdesc="A semantic-code search engine"
arch=('any')
url="https://aur.archlinux.org/packages/python-seagoat"
license=('MIT')
depends=('python' 'python-appdirs' 'python-click' 'python-pygments' 'python-typing_extensions' 'python-gitpython')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/s/seagoat/seagoat-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  python -m pip install --no-deps --ignore-installed --root="$pkgdir" seagoat-${pkgver}.tar.gz
}
