# Maintainer: Maddison Hellstrom <maddy@na.ai>
pkgname=swaynagmode
pkgver=0.1.3
pkgrel=1
pkgdesc='control swaynag via keyboard shortcuts'
arch=('any')
url='https://github.com/b0o/swaynagmode'
license=('GPL3')
depends=('bash' 'sway')
makedepends=('git')
provides=('swaynagmode')
source=("https://github.com/b0o/swaynagmode/archive/v${pkgver}.tar.gz")
sha256sums=('7b5f49a8b161670d66c9a92df8937348f6090ebf0b7232c34e9976e4912811ca')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
