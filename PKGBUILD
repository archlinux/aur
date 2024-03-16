# Maintainer: Marcello Urbani
pkgname=cdebug
pkgver=0.0.17
pkgrel=1
pkgdesc="a swiss army knife of container debugging. Troubleshoot containers and pods lacking shell and/or debugging tools, add port forwarding,..."
arch=("x86_64")
url="https://github.com/iximiuz/cdebug"
license=('Apache')
provides=(cdebug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/iximiuz/cdebug/releases/download/v${pkgver}/cdebug_linux_amd64.tar.gz")
sha256sums=('34656b433d6646c4131ad1a904c2ae14a128b857c661108438417b731c923f72')

package() {
	install -Dm755 "${srcdir}/cdebug" "${pkgdir}/usr/bin/cdebug"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/cdebug" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
