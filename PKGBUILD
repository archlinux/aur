# Maintainer: Maddison Hellstrom <maddy@na.ai>
pkgname=swaynagmode
pkgver=0.2.1
pkgrel=1
pkgdesc='control swaynag via keyboard shortcuts'
arch=('any')
url='https://github.com/b0o/swaynagmode'
license=('GPL3')
depends=('bash' 'sway')
makedepends=('git')
provides=('swaynagmode')
source=("https://github.com/b0o/swaynagmode/archive/v${pkgver}.tar.gz")
sha256sums=('f513395a27ac63192a9f188b6f4f5b36c2c5fa8fa8d71b936e6f069ec5a63f24')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
