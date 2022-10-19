# Maintainer: FuckNvidiaDoggyStyle FuckNvidiaDoggyStyle@proton.me
pkgname='rollercoaster'
pkgver='1.0'
pkgdesc='Cool Terminal tool'
pkgrel='1'
arch=('any')
url='https://tinyurl.com/ycyhdpve'
depends=('bash')
source=("${pkgname}::https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh")
sha512sums=("SKIP")

package() {
	#install -dm755 ${pkgdir}/opt/
	#mv ${pkgname} ${pkdir}/opt/

	#install -dm755 ${pkgdir}/usr/bin
	#ln -s /opt/${pkgname}/${packagename} ${pkgdir}/usr/bin/${pkgname}
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
