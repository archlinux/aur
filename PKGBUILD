# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=luigi
pkgver=2.1.0
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python' 'python-daemon' 'python-tornado')
makedepends=('python-setuptools')
optdepends=('python-mechanize: for debugging Hadoop jobs more easily')
url="https://github.com/spotify/luigi"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1f2b1e7de7a17d025163cff8d05f7a7a')
sha256sums=('98e3806afae88b8c2cc90ecd621f610c5a67f96aa7d6b5fee1d38f0cc6e499ac')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
