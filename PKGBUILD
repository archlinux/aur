# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=python-regex
pkgver=0.1.20141024
pkgrel=1
pkgdesc="Alternative regular expression module"
arch=(i686 x86_64)
url="https://code.google.com/p/mrab-regex-hg/"
license=(custom)
depends=(python)
makedepends=(python-distribute)
conflicts=(python-regex-hg)
options=(!emptydirs)
source=("http://ftp.de.debian.org/debian/pool/main/p/python-regex/python-regex_${pkgver}.orig.tar.gz")
sha512sums=('aea8d2d27924a10c3eb06519eca0b5d439b18474c64814138881e7dddfaa7b45d977262c17dbee261d408956454552c86c6b5762d3ec9e12aff0e1c5f51cb672')

package() {
  cd "${srcdir}/regex-2014.10.24"
  LANG=en_US.UTF-8 python setup.py install --root="${pkgdir}/" --optimize=1
}
