# Maintainer: Bernardas Ališauskas bernardas.ališauskas@protonmail.com
pkgname=sauth
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple, minimalistic http server with authentication written in python"
arch=(any)
license=('GPL3')
url="https://github.com/Granitosaurus/sauth"
depends=('python' 'python-setuptools' 'python-click')
makedepends=('python-setuptools')
source=("https://github.com/Granitosaurus/sauth/archive/${pkgver}.tar.gz")
md5sums=('a3982f16d9c006fa02c0d345ae7683b8')
package() {
  cd "${srcdir}/sauth-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
