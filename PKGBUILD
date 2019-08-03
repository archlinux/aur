# Maintainer: MadPhysicist <jfoxrabinovitz at gmail dot com>
pkgname=netcdf-java
pkgver=5.0.0
pkgrel=1
pkgdesc='network Common Data Form interface for array-oriented data access implemented in Java'
arch=('any')
url='http://www.unidata.ucar.edu/software/thredds/current/netcdf-java/'
license=('apache')
groups=()
depends=('java-runtime>=8')
makedepends=()
optdepends=('netcdf: native implementation of netCDF with C bindings')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://artifacts.unidata.ucar.edu/repository/unidata-releases/edu/ucar/netcdfAll/${pkgver}/netcdfAll-${pkgver}.jar")
noextract=("netcdfAll-${pkgver}.jar")
sha1sums=('3e3d2e1c1774d61e96eb631a6b8eb636c345d6cc')

package() {
    install -Dm644 ${srcdir}/netcdfAll-${pkgver}.jar ${pkgdir}/usr/share/java/netcdf/netcdfAll-${pkgver}.jar
    ln -s netcdfAll-${pkgver}.jar ${pkgdir}/usr/share/java/netcdf/netcdf.jar
}

