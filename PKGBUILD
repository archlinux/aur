pkgname=lith
pkgver=2.0.43
pkgrel=1
pkgdesc='Maple Story 2 launcher'
arch=('x86_64')
url='https://www.lith.cat'
depends=('umu-launcher')

_bin_name="Lith.Launcher-${pkgver}-x64.AppImage"
source=("https://github.com/LithMS/Lith-Artifacts/releases/download/v${pkgver}/${_bin_name}")
sha256sums=('eb384ed15328b2e73e3a8f7c0a86d980dd45a6367093ee040ab80461c2bd0855')

package() {
    install -Dm 755 "${srcdir}/${_bin_name}" "${pkgdir}/usr/bin/${pkgname}"
}
