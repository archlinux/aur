# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=grib2ctl
pkgver=0.9.13
pkgrel=1
pkgdesc="Takes GRIB files and makes GrADS control files"
arch=('any')
url="http://www.cpc.ncep.noaa.gov/products/wesley/grib2ctl.html"
license=('custom:NWS')
depends=('perl')
source=(ftp://ftp.cpc.ncep.noaa.gov/wd51we/wgrib.scripts/${pkgname}.pl
        NWS_license.txt)
md5sums=('56c14e322311d48ebaa67e32a991a883'
         '64f9f7f5ad383df409986d8a67d2fa78')

build() {
  echo "Nothing to build"
}

package() {
  install -Dm755 ${srcdir}/${pkgname}.pl ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 ${srcdir}/NWS_license.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/NWS
}
