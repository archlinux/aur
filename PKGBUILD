# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-humanfriendly
pkgver=1.44.7
pkgrel=1
pkgdesc="Human friendly output for text interfaces using Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://humanfriendly.readthedocs.org"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/05/43/47c39f284391051c503322b86d2ffbe1e7314a3156cf5649aa7af03c85fb/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('ead99eb5d8a8416b6b1a1a41892efa06')
sha256sums=('fcee758612edc6fead9b8fd1d5a473eab2c3a84cf8766f3ce70862ccd35e8a64')
provides=('humanfriendly' 'python2-humanfriendly')
conflicts=('humanfriendly')

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
