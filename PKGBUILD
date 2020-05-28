# Maintainer: Daniel Bertalan <dani@danielbertalan.dev>

pkgname=sssteg
pkgver=0.1
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/BertalanD/sssteg/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('939d8b759f0ef10237aaec95f1a32003b25e4a0121bc08905d17fc23106a062d')
validpgpkeys=('9B787C055C7AE4AEADB957B637DAA2139C04C1C0')

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 sssteg.sh "${pkgdir}/usr/bin/sssteg"
	install -Dm644 sssteg.1  "${pkgdir}/usr/share/man/man1/sssteg.1"
	install -Dm644 LICENSE   "${pkgdir}/usr/share/licenses/sssteg/LICENSE"
}
