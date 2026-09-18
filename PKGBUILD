pkgname=lith
pkgver=2.0.40
pkgrel=1
pkgdesc='Maple Story 2 launcher'
arch=('x86_64')
url='https://www.lith.cat'
depends=('umu-launcher')

_bin_name="Lith.Launcher-${pkgver}-x64.AppImage"
source=("https://github.com/LithMS/Lith-Artifacts/releases/download/v${pkgver}/${_bin_name}")
sha256sums=('cb5bbb130c5b4932cbc3c3134bacf4fc52495e79974132d9f85defa5858540e5')

package() {
    install -Dm 755 "${srcdir}/${_bin_name}" "${pkgdir}/usr/bin/${pkgname}"
}
