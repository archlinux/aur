# Maintainer: Maddison Hellstrom <maddy@na.ai>
pkgname=swaynagmode
pkgver=0.2.0
pkgrel=1
pkgdesc='control swaynag via keyboard shortcuts'
arch=('any')
url='https://github.com/b0o/swaynagmode'
license=('GPL3')
depends=('bash' 'sway')
makedepends=('git')
provides=('swaynagmode')
source=("https://github.com/b0o/swaynagmode/archive/v${pkgver}.tar.gz")
sha256sums=('f7d9e082f3883a31869d75bc4a9f7a2dde4d391fe89cebf836404130ff91f44e')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
