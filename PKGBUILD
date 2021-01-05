# Maintainer : Darshit Shah <git@darnir.net>
#
pkgname=firefly-cli
pkgver=0.0.3
pkgrel=1
pkgdesc="A python-based command line interface for practically entering expenses in Firefly III"
url="https://github.com/afonsoc12/firefly-cli"
license=('Apache')
arch=('i686' 'x86_64')
depends=('python')
# makedepends=('python-distribute')
source=("https://github.com/afonsoc12/firefly-cli/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('2b216b0b67711add3e7ff8329d8f9d05')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
