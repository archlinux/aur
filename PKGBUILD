# Contributer: Mikhail Babynichev <i@kotrik.ru>
# Maintainer: Mikhail Babynichev <i@kotrik.ru>

pkgname=tosu
pkgver=3.1.0
pkgrel=1
pkgdesc="Eponymous software for reading osu! memory"
arch=(x86_64)
url="https://github.com/kotrikd/tosu"
license=("LGPL3")
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(tosu)
conflicts=(tosu)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/kotrikd/${pkgname}/releases/download/${pkgver}/${pkgname}-linux-v${pkgver}.zip"
        )
noextract=("${pkgver}/${pkgname}-linux-v${pkgver}.zip")
sha256sums=("3f164de319446f89cf2b03b065a60d4857a390df0167fad32e4a744d66381d38")
validpgpkeys=()

prepare() {
	unzip -f "${pkgname}-linux-v${pkgver}.zip"
}

package() {
	# Install gosumemory binary
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/opt/tosu/tosu"	
}
