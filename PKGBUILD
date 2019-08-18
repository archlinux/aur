# Maintainer: yjun <jerrysteve1101@gmail.com>
pkgname=natapp
pkgver=2_3_9
_pkgdate=20181225
pkgrel=2
pkgdesc="Internal Network Penetration Client based on ngrok(Linux Version)"
arch=("x86_64")
url="https://natapp.cn"
license=('unknown')
depends=()
source=(
	"http://download.natapp.cn/assets/downloads/clients/${pkgver}/${pkgname}_linux_amd64_${pkgver}.zip"
)
md5sums=('71037d0cf5f038b6cbb84bdcf37d7c30')

package(){
	cd ${srcdir}
	install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
