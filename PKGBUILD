pkgname=lith
pkgver=2.0.47
pkgrel=1
pkgdesc='Maple Story 2 launcher'
arch=('x86_64')
url='https://www.lith.cat'
depends=('umu-launcher')

options=('!strip' '!debug')

_bin_name="Lith.Launcher-${pkgver}-x64.AppImage"
source=("https://github.com/LithMS/Lith-Artifacts/releases/download/v${pkgver}/${_bin_name}")
sha256sums=('8130b3ee8302f8af5f68513bbdf4b1071e08003b42fa86a8c2be709eb017e33b')

package() {
    install -Dm 755 "${srcdir}/${_bin_name}" "${pkgdir}/usr/bin/${pkgname}"
}
