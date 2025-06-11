# Maintainer: Asger Hautop Drewsen <asger@tyilo.com>
pkgname=us_da-layout
pkgver=0.2.0
pkgrel=1
pkgdesc="US keyboard layout with level 3-4 æøå"
arch=('any')
url="https://github.com/Tyilo/us_da-layout"
license=('GPL')
depends=('xkeyboard-config' 'moreutils')
source=("us_da" "install-us_da-layout" "us_da-layout.hook")
install=us_da-layout.install

package() {
	install -Dm 644 "${srcdir}/us_da" "${pkgdir}/usr/share/xkeyboard-config-2/symbols/us_da"
	install -Dm 755 "${srcdir}/install-us_da-layout" "${pkgdir}/usr/share/libalpm/scripts/install-us_da-layout"
	install -Dm 644 "${srcdir}/us_da-layout.hook" "${pkgdir}/usr/share/libalpm/hooks/us_da-layout.hook"
}

sha256sums=('5f9e7e69a69a0c604640c9dd26ab56331af2027dc0ca42a9695feaa138f1e457'
            '83c3ffc4aaa3af3dddc7b088b834561562d69df7bd94500ca577f4da151e5d99'
            '94338cdccb7ea0280c79abefe5b187745f2240c8cc0fa324addb9fa449d01e67')
