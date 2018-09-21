# Contributor: AlexTimmi <codelaunch@gmail.com>

pkgname=cqrlog-bin
_pkgname_sourse=cqrlog
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
sha256sums_x86_64=('866e6518aeca70534f58c9dfae8ba4ec82bd3940d07dff066d7dc7906be7fc9f')
fi

_pkg="${_pkgname_sourse//_/-}_${pkgver//_/-}_${_arch}"
source_x86_64=($url/files/${_pkgname_sourse//_/-}_${pkgver}/${_pkg}.tar.gz)


package() {

    cd "${_pkgname_sourse}-${pkgver}"
    cp -rfv ./* $pkgdir
}
