# Maintainer: Andreas Bilke <andreas@bilke.org>

pkgname=python-powerlaw
_pkgname=powerlaw
pkgrel=1
pkgver=1.4
pkgdesc='A Python Package for Analysis of Heavy-Tailed Distributions'
arch=('any')
url='https://github.com/jeffalstott/powerlaw'
depends=('python' 'python-numpy' 'python-scipy' 'python-matplotlib')
optdepends=('python-mpmath: support for gamma function fitting')
makedepends=('git' 'awk' 'sed')
license=('MIT')
md5sums=('26e9e3b29885cc3be91dc2bab9ec87ee')
sha256sums=('ef7279b86beb3bbb80e5294eb656d8c2d39cb72a3ee0f34eef0acbbf74a4f530')

source=('https://pypi.python.org/packages/source/p/powerlaw/powerlaw-1.4.tar.gz')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
}
