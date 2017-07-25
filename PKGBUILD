# Maintainer: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>

pkgname=python-powerlaw
_pkgname=powerlaw
pkgrel=1
pkgver=1.4.3
pkgdesc='A Python Package for Analysis of Heavy-Tailed Distributions'
arch=('any')
url='https://github.com/jeffalstott/powerlaw'
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=('python-mpmath: support for gamma function fitting')
makedepends=('git' 'awk' 'sed')
license=('MIT')
md5sums=('2ea92f975361594767b652d863909d2e')
sha256sums=('4e8a9f603738c9115fb057ced3039653114f70bbb2ffb42b49228e0366d61950')

source=('https://pypi.python.org/packages/83/7e/12756bfd0a98fda04e35b25353a6870dbcd53680faca3b77ff044cc65fec/powerlaw-1.4.3.tar.gz')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
}
