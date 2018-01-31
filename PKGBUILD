# Maintainer: Avinash Ananth Narayan R <nashpapa@gmail.com>
pkgname=cumulonimbus
pkgver=1.9.6
pkgrel=1
pkgdesc="A simple, beautiful podcast app."
arch=("x86_64")
url="https://github.com/z-------------/cumulonimbus"
license=('APACHE')
depends=()
makedepends=()
provides=()
source=("https://github.com/z-------------/${pkgname}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=("5f58d9a493dcfb6354b9b857801f3e6fdce6f392e056bc7566b8c48d4ed74240")

prepare() {
	[ ! -d ${pkgname}-${pkgver} ] && mkdir "${pkgname}-${pkgver}" > /dev/null
	tar -xf data.tar.xz -C "${pkgname}-${pkgver}"
}

package() {
	cp -r "${pkgname}-${pkgver}"/* ${pkgdir}/
}
