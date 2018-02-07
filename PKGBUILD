# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>
# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=cqrlog
pkgver=2.2.0
pkgrel=1
pkgdesc="An advanced ham radio logger based on MySQL database ( MariaDB replaces MySQL in repositories ). (Binary Version)"
arch=('x86_64')
url="http://www.cqrlog.com"
license=('GPL')
groups=()

depends=('mariadb' 'libmariadbclient' 'mariadb-clients' 'hamlib' 'trustedqsl' 'xplanet' 'glabels' )


if [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
sha256sums=('6659c29f918d3f0d1c7bc902d3d1f60316be18c0260c94f59325b498fb68d699')
fi

_pkg="${pkgname//_/-}_${pkgver//_/-}_${_arch}"
source=($url/files/${pkgname//_/-}_${pkgver}/${_pkg}.tar.gz)


package() {

    cd "${pkgname}-${pkgver}"
    cp -rfv ./* $pkgdir
}
