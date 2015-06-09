# Maintainer: John Reese <john@noswap.com>
# Upstream URL: https://github.com/jreese/dotlink
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/jreese/arch


pkgname=dotlink
pkgver=0.6.0
pkgrel=1
pkgdesc="Automated deployment of dotfiles to local or remote locations"
arch=('any')
url="https://github.com/jreese/dotlink"
license=('MIT')
depends=('python-setuptools')
makedepends=('git')

source=("https://pypi.python.org/packages/source/D/Dotlink/Dotlink-${pkgver}.tar.gz")
md5sums=('f3034e0113089178352511b2f3590ff0')

package() {
  cd "$srcdir/Dotlink-$pkgver"
  python setup.py install --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
