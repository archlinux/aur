pkgname=plymouth-theme-arch-os
pkgver=1.0.r0.g$(git rev-parse --short HEAD)
pkgrel=1
pkgdesc="Arch OS Theme for Plymouth"
arch=('any')
url="https://github.com/murkl/plymouth-theme-arch-os"
license=('GPL2')
depends=('plymouth' 'cantarell-fonts')
makedepends=('git')
source=($pkgname::git+https://github.com/murkl/plymouth-theme-arch-os.git)
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${pkgname}/src"
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/arch-os"
	install -Dvm644 ./* "${pkgdir}/usr/share/plymouth/themes/arch-os"
}
