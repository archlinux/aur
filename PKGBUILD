# Maintainer: FuckNvidiaDoggyStyle FuckNvidiaDoggyStyle@proton.me
pkgname='rollercoaster'
pkgver='1.0'
pkgdesc='Cool Terminal tool'
pkgrel='1'
arch=('any')
url='https://tinyurl.com/ycyhdpve'
depends=('bash' 'alas-utils')
source=("${pkgname}::https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh")
sha512sums=("SKIP")

package() {
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
