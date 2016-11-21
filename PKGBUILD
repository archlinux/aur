# Maintainer: Andreas Bilke <abilke at cosy dot sbg dot ac dot at>

pkgname=python-powerlaw
_pkgname=powerlaw
pkgrel=1
pkgver=1.4.1
pkgdesc='A Python Package for Analysis of Heavy-Tailed Distributions'
arch=('any')
url='https://github.com/jeffalstott/powerlaw'
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=('python-mpmath: support for gamma function fitting')
makedepends=('git' 'awk' 'sed')
license=('MIT')
md5sums=('3b9af3cef3691acf31c0ea8bea70b4c0')
sha256sums=('ddc5afd003cc0b2511210072a18d8cf55bacf47a4fb27250b75fc980f193934e')

source=('https://pypi.python.org/packages/source/p/powerlaw/powerlaw-1.4.1.tar.gz')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
}
