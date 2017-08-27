# Maintainer: Nicolas Quiénot <niQo @ aur>
pkgname=python-mirobo
pkgver=0.1.4
pkgrel=1
pkgdesc="Python library & console tool for controlling Xiaomi Vacuum cleaner robot"
arch=('i686' 'x86_64')
url="https://github.com/rytilahti/python-mirobo"
license=('GPL')
depends=('python-setuptools' 'python-construct' 'python-click' 'python-cryptography' 'python-pretty-cron' 'python-typing' 'python-zeroconf')
makedepends=()
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('795d2401e3c50593f9e9c5a781c9fffe')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  python setup.py install --root=$pkgdir
}
