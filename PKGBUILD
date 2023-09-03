# Maintainer: Mauricio de Lima <emauricio@uai21.com>
pkgname=calamares-config
_destname1="/etc"
pkgver=71
pkgrel=1
pkgdesc="Calamares for Archiso"
arch=('any')
url="https://github.com/UaiSO21"
license=('GPL3')
makedepends=('git')
#depends=('')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=(${pkgname}::"git+${url}/${pkgname}")
sha256sums=('SKIP')
if [ -e "${pkgname}.install" ];then
    install=${pkgname}.install
fi
package() {
	install -dm755 ${pkgdir}${_destname1}
	cp -r ${srcdir}/${pkgname}${_destname1}/* ${pkgdir}${_destname1}
}


