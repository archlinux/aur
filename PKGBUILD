# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=netcdf-java
pkgver=4.6.8
pkgrel=1
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
sha1sums=('be5a6bbc400b0fe972c0428c71cead2d541b196c')

package() {
    install -Dm644 ${srcdir}/netcdfAll-${pkgver}.jar ${pkgdir}/usr/share/java/netcdf/netcdfAll-${pkgver}.jar
    ln -s netcdfAll-${pkgver}.jar ${pkgdir}/usr/share/java/netcdf/netcdf.jar
}

