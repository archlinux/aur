# Maintainer: Brian Crescimanno <brian.crescimanno@me.com>
# Maintainer: Radim Sückr <kontakt@radimsuckr.cz>

pkgname=apple_cursor
pkgver=2.0.1
pkgrel=1
pkgdesc='Opensource macOS cursors'
arch=('any')
url='https://github.com/ful1e5/apple_cursor'
license=('GPL3')
depends=()
makedepends=()
source=("macOS.tar.xz::${url}/releases/download/v${pkgver}/macOS.tar.xz")
sha512sums=('3a826df8164cc8b8e924fa95cc726bd746bdbb9d18bfc3d4ae3b125bc81e6f251a8d4bde283601c074bb4b3ad6e3e23c59bc1de49270548d1d2702a00fd54e78')

package() {
    install -d "${pkgdir}/usr/share/icons"

    cp -r "${srcdir}/macOS" "${pkgdir}/usr/share/icons"
    cp -r "${srcdir}/macOS-White" "${pkgdir}/usr/share/icons"
}
