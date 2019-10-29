# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
pkgname=us_da-layout
pkgver=0.1.2
pkgrel=1
pkgdesc="US keyboard layout with level 3-4 æøå"
arch=('any')
url="https://github.com/Tyilo/us_da-layout"
license=('GPL')
depends=('xkeyboard-config' 'moreutils')
source=("us_da" "install-us_da-layout" "us_da-layout.hook")
install=us_da-layout.install

package() {
	install -Dm 644 "${srcdir}/us_da" "${pkgdir}/usr/share/X11/xkb/symbols/us_da"
	install -Dm 755 "${srcdir}/install-us_da-layout" "${pkgdir}/usr/share/libalpm/scripts/install-us_da-layout"
	install -Dm 644 "${srcdir}/us_da-layout.hook" "${pkgdir}/usr/share/libalpm/hooks/us_da-layout.hook"
}

sha256sums=('5f9e7e69a69a0c604640c9dd26ab56331af2027dc0ca42a9695feaa138f1e457'
            '579702a5617a25749d35f89fa71fbcee912a43b37a1d2e0f46109f1d11f2e65a'
            '342adf441ce7fe42cf8694ae2294204b4d0391111e2d85dc6fefe49b6333abef')
