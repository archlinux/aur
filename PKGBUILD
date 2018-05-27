# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-humanfriendly
pkgver=4.12.1
pkgrel=1
pkgdesc='Human-friendly output for text interfaces using Python'
arch=(any)
url='https://humanfriendly.readthedocs.io'
license=(MIT)
depends=(python2 python2-monotonic)
makedepends=(python2-setuptools)
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/8a/17/2f49d6b94908ff21031f2daaac498170e64983ddcc34d8d1becd2c45b03b/humanfriendly-$pkgver.tar.gz)
sha256sums=(937b4d2c99d29007023ebcab23579429541bfb3357a97e5df38fc5d851a112a3)
sha512sums=(cca8c14b63a7113a06e5f99b5d28ba4228705bfe9b25873f74ac711116fc1b71debd021284573d9cfd41906c825fbf914b779b785359bc9d617f388e5cb633db)

package() {
  cd $srcdir/humanfriendly-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
