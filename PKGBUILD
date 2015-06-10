# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=python-regex
pkgver=0.1.20150318
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
sha512sums=('13c61c96075f4d6c25782a79283fbfb3174fd04f4455cc3cfec8520d149d5463354ef72c3bf4b0faad1e6a4a141b28611d2d76c3d1bf69213434053935f74bca')

package() {
  cd "${srcdir}/regex-2015.03.18"
  LANG=en_US.UTF-8 python setup.py install --root="${pkgdir}/" --optimize=1
}
