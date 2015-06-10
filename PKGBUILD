# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=netcdf-java
pkgver=4.6.2
pkgrel=2
pkgdesc='network Common Data Form interface for array-oriented data access implemented in Java'
arch=('any')
url='http://www.unidata.ucar.edu/software/thredds/current/netcdf-java/'
license=('apache')
groups=()
depends=('java-runtime')
makedepends=()
optdepends=('netcdf: native implementation of netCDF with C bindings')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("ftp://ftp.unidata.ucar.edu/pub/netcdf-java/v${pkgver%.*}/netcdfAll-${pkgver}.jar")
noextract=("netcdfAll-${pkgver}.jar")
sha1sums=('29295a23177e44998d0ef36caf6b01789124f3ba')

package() {
    install -Dm644 ${srcdir}/netcdfAll-${pkgver}.jar ${pkgdir}/usr/share/java/netcdf/netcdfAll-${pkgver}.jar
    ln -s netcdfAll-${pkgver}.jar ${pkgdir}/usr/share/java/netcdf/netcdf.jar
}

