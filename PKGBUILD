# Maintainer: Borhan <me@bor691.ir>
pkgname=quickserv-bin
pkgver=0.3.0
pkgrel=1
epoch=1667356893
pkgdesc="Dangerously user-friendly web server for quick prototyping and hackathons"
arch=('x86_64')
url="https://github.com/jstrieb/quickserv"
license=('MIT')
provides=('quickserv')
source=("https://github.com/jstrieb/quickserv/releases/download/v${pkgver}/${pkgname/-bin/}_linux_x64")
sha256sums=("190c16a540e292b1233d578b45e7220de520d3bbe72a31599cb559992a047bbb")

package() {
	install -D -m755 \
		"${srcdir}/${pkgname/-bin/}_linux_x64" \
		"${pkgdir}/usr/bin/${pkgname/-bin/}"

}

