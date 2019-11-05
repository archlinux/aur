# Maintainer: Jerry Chanut <j.chanut@gmail.com>
pkgname=fast
pkgver=0.0.4
pkgrel=1
pkgdesc="Minimal zero-dependency utility for testing your internet download speed from terminal."
arch=('x86_64')
url="https://github.com/ddo/fast"
license=('MIT')
provides=("$pkgname")
source=("${pkgname}::https://github.com/ddo/fast/releases/download/v${pkgver}/fast_linux_amd64")
md5sums=('SKIP')

package() {
	install -d "${pkgdir}/opt/${pkgname}"
	install -m755 "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
	install -d "${pkgdir}"/usr/bin

	ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
