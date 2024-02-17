# Maintainer: Ramazan Umut ramazxn@proton.me

pkgname="rfetch-git"
pkgver=0.1
pkgrel=1
pkgdesc="Simple neofetch alternative."
arch=('any')
depends=('bash')
license=('GPL-3.0')
source=("rfetch.sh")
sha256sums=('SKIP')

package() {
				mkdir -p "${pkgdir}/usr/bin"
				cp "${srcdir}/rfetch.sh" "${pkgdir}/usr/bin/rfetch"
				chmod +x "${pkgdir}/usr/bin/rfetch"
}

