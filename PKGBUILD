# Maintainer: yinflying <yinflying@foxmail.com>
pkgname=gfzrnx-bin
pkgver=1.10
pkgrel=1
pkgdesc="RINEX GNSS Data Conversion and Manipulation Toolbox"
arch=('x86_64')
url="http://semisys.gfz-potsdam.de/semisys/scripts/download/index.php"
groups=('GNSS')
depends=()
provides=('gfzrnx')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://semisys.gfz-potsdam.de/semisys/software/gfzrnx/${pkgver}/gfzrnx_lx")
noextract=()
md5sums=('129804b45837ec75d3a7186064a2a973')

package() {
    install -Dm755 gfzrnx_lx "${pkgdir}/usr/bin/gfzrnx"
}
