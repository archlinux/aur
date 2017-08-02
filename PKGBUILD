# Maintainer: Nicolas Quiénot <niQo @ aur>
pkgname=python-mirobo
pkgver=0.1.2
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi Vacuum cleaner robot"
arch=('i686' 'x86_64')
url="https://github.com/rytilahti/python-mirobo"
license=('GPL')
depends=('python-setuptools' 'python-typing' 'python-cryptography' 'python-pretty-cron' 'python-click' 'python-construct')
makedepends=()
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e619350ee9735dbdd4cd59779eebcdb8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  python setup.py install --root=$pkgdir
}
