# Maintainer: Avinash Ananth Narayan R <nashpapa@gmail.com>
pkgname=cpod
pkgver=1.27.0
pkgrel=1
pkgdesc="A simple, beautiful podcast app."
arch=("x86_64")
url="https://github.com/z-------------/cumulonimbus"
license=('APACHE')
depends=()
makedepends=()
provides=()
replaces=(cumulonimbus)
source=("https://github.com/z-------------/cumulonimbus/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=("71151359b9650d6ee4d421f45a41c7d5537a38163d09048fbdfc7c9ee06be43f")

prepare() {
	[ ! -d ${pkgname}-${pkgver} ] && mkdir "${pkgname}-${pkgver}" > /dev/null
	tar -xf data.tar.xz -C "${pkgname}-${pkgver}"
}

package() {
	cp -r "${pkgname}-${pkgver}"/* ${pkgdir}/
}
