# Maintainer: Daniel Bertalan <dani@danielbertalan.dev>

pkgname=sssteg
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="Hide secrets across multiple files with secret sharing and steganography."
arch=(any)
url="https://danielbertalan.dev/sssteg"
license=('GPL3')
groups=()
depends=('ssss' 'steghide')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
#changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BertalanD/sssteg/archive/v${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.asc::https://github.com/BertalanD/sssteg/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
noextract=()
sha256sums=('04d35bcbd85ddbc91bb3ad703ca1fde47fadf799724bde12b496da7ed0cf3b9b' 'SKIP')
validpgpkeys=('159BD4F60996D172568DD4653B04FADDA4EBCC81')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 sssteg.sh "${pkgdir}/usr/bin/sssteg"
	install -Dm644 sssteg.1  "${pkgdir}/usr/share/man/man1/sssteg.1"
	install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/sssteg/LICENSE"
}
