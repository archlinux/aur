# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
pkgname=python-shogun
pkgver=0.2
pkgrel=1
pkgdesc="A dead simple build system based on Ninja"
arch=('any')
url="https://github.com/Streetwalrus/shogun"
license=('MIT')
depends=('python>=3.5' 'python-jinja>=2.0' 'ninja')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/Streetwalrus/shogun/archive/v$pkgver.tar.gz")
md5sums=('9bca14af5832c9854688a8df0dda4bb9')

package() {
  cd "$srcdir/shogun-$pkgver"
  ./setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}

# vim:set ts=2 sw=2 et:
