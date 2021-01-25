# Maintainer: Platon Pronko <platon7pronko@gmail.com>

pkgname='python-meteocalc'
pkgver=1.1.0
pkgrel=1
pkgdesc="Several functions for calculation of meteorological variables: dew point, heat index, wind chill, feels like temperature."
arch=("any")
url="https://github.com/malexer/meteocalc"
license=("MIT")
makedepends=("python-setuptools")

source=("https://github.com/malexer/meteocalc/archive/${pkgver}.tar.gz")
sha256sums=('3dae55e9b8380af04e3eadd6fa26d81ecb6250562c4a862b9a31801548e43ccb')

prepare() {
  cd "${srcdir}/meteocalc-${pkgver}"
}

package() {
  cd "${srcdir}/meteocalc-${pkgver}"
  python setup.py install --root=${pkgdir} 
}
