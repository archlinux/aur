# Contributor: Thomas Fanninger <thomas@fanninger.at>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=python-e4u-git
pkgver=0.1rc4
pkgrel=1
epoch=1
pkgdesc="Bundle Library of emoji4unicode at Google"
arch=('any')
url="https://github.com/lambdalisue/e4u"
license=('GPL')
provides=('python-e4u')
depends=('python')
makedepends=('python-setuptools')
options=('!strip' '!emptydirs')

source=("${pkgname}::https://github.com/lambdalisue/e4u/archive/${pkgver}.tar.gz")
sha512sums=(SKIP)

package() {
  cd "${srcdir}/e4u-${pkgver}"
  
  python setup.py install --root="$pkgdir/"
}
