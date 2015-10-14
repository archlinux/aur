# Maintainer: Andreas Bilke <andreas@bilke.org>

pkgname=python-powerlaw
_pkgname=powerlaw
pkgrel=1
pkgver=1.3.5
pkgdesc='A Python Package for Analysis of Heavy-Tailed Distributions'
arch=('any')
url='https://github.com/jeffalstott/powerlaw'
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=('python-mpmath: support for gamma function fitting')
makedepends=('git' 'awk' 'sed')
license=('MIT')
md5sums=('8619caf36a67682de057b8db2fafdce1')
sha256sums=('632df690ed41886fa0d468ff59ebd85c32c8d27846f21190e0b8fd0c35fdeda6')

source=('https://pypi.python.org/packages/source/p/powerlaw/powerlaw-1.3.5.tar.gz')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
}
