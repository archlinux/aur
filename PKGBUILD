# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-mailman-hyperkitty-plugin')
_pkgbase='mailman-hyperkitty'
pkgver=1.1.0
pkgrel=1
pkgdesc="Hyperkitty archive plugin for mailman"
arch=(any)
makedepends=('python-setuptools')
depends=('mailman-core' 'python-setuptools' 'python-requests')
url="https://gitlab.com/mailman/mailman-hyperkitty"
license=('GPL')
options=(!emptydirs)
source=("${_pkgbase}-${pkgver}.tar.gz::https://gitlab.com/mailman/mailman-hyperkitty/-/archive/v${pkgver}/mailman-hyperkitty-v${pkgver}.tar.gz")
sha256sums=('b3a32e66961571c3b68f536cf50dbd186620577dd16024e67d299a0857e1d40d')

package() {
  cd "$srcdir/$_pkgbase-v$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
