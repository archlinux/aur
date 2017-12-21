# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-radadb'
pkgver=1.0.4
pkgrel=1
pkgdesc="A lightweight uncomplicated NoSQL schemaless ORM for sqlite3"
arch=('any')
url="https://github.com/tariqdaouda/rabaDB"
license=('Apache2')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/tariqdaouda/rabaDB/archive/${pkgver}.tar.gz")
md5sums=('94f32b72000fddf11f65bcaf67eb49cf')

package() {
  cd "${srcdir}/rabaDB-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
