# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=luigi
pkgver=2.2.0
pkgrel=1
pkgdesc="Workflow mgmgt + task scheduling + dependency resolution"
arch=('any')
depends=('python' 'python-daemon' 'python-tornado')
makedepends=('python-setuptools')
optdepends=('python-mechanize: for debugging Hadoop jobs more easily')
url="https://github.com/spotify/luigi"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/ab/f2/487cc0a14227f92d18291ea85bed2acbe09e23b717f42626af13f8a91fbe/luigi-2.2.0.tar.gz)
md5sums=('9e304df7d11dc54b5cc702ccd59f0012')
sha256sums=('18cc4f424b4379158ccb765282aaa0e31b7bf46d0db855ede22c227cc315336c')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
