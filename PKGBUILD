# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-coloredlogs
pkgver=10.0
pkgrel=1
pkgdesc="Colored stream handler for Python's logging module"
arch=(any)
url='https://coloredlogs.readthedocs.io'
license=(MIT)
depends=(python2 python2-humanfriendly python2-monotonic)
makedepends=(python2-setuptools)
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/63/09/1da37a51b232eaf9707919123b2413662e95edd50bace5353a548910eb9d/coloredlogs-$pkgver.tar.gz)
sha256sums=(b869a2dda3fa88154b9dd850e27828d8755bfab5a838a1c97fbc850c6e377c36)
sha512sums=(f4a51fd8fa92ea4e2ef0b58305dcc4bbe12851e722fc85cfd4f48a9388002efced52bcf027f6dc4c525b095f3f953970e73928fdce3245ab4f9d13ae36b9d498)

package() {
  cd $srcdir/coloredlogs-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1
}
