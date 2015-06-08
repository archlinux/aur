# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=python2-pyfig
pkgver=2.1
pkgrel=2
pkgdesc="A small and simple configuration file parser written in Python"
arch=('any')
url="http://pypi.python.org/pypi/Pyfig"
license=('GPL')
depends=('python2')
conflicts=('python-pyfig')
source=(http://bitbucket.org/alecwh/pyfig/downloads/pyfig${pkgver}.tar.gz)
md5sums=('4745cd1bf83b4ed08928e4ca9514447a')
sha256sums=('886a0d6a44730ab80828292e8ec10ac56444e218adb2725a3dc816d6ca02048b')

build() {
  cd "${srcdir}/Pyfig config parser-${pkgver}"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
