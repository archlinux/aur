# Contributor: Jeff Parent <jecxjo@sdf.lonestar.org>
# Maintainer: AlexTimmi <codelaunch@gmail.com>

pkgname=cqrlog
pkgver=2.3.0
pkgrel=1
pkgdesc="An advanced ham radio logger based on MySQL database ( MariaDB replaces MySQL in repositories ). (Binary Version)"
arch=('x86_64')
url="http://www.cqrlog.com"
license=('GPL')
groups=()

depends=('mariadb' 'libmariadbclient' 'mariadb-clients' 'hamlib' 'trustedqsl' 'xplanet' 'glabels' )


if [ "$CARCH" = "x86_64" ]; then
    _arch='amd64'
sha256sums=('866e6518aeca70534f58c9dfae8ba4ec82bd3940d07dff066d7dc7906be7fc9f')
fi

_pkg="${pkgname//_/-}_${pkgver//_/-}_${_arch}"
source=($url/files/${pkgname//_/-}_${pkgver}/${_pkg}.tar.gz)


package() {

    cd "${pkgname}-${pkgver}"
    cp -rfv ./* $pkgdir
}
