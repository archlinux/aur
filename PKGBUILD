pkgname=lith
pkgver=2.0.51
pkgrel=1
pkgdesc='Maple Story 2 launcher'
arch=('x86_64')
url='https://www.lith.cat'
depends=('umu-launcher')

options=('!strip' '!debug')

_bin_name="Lith.Launcher-${pkgver}-x64.AppImage"
source=("https://github.com/LithMS/Lith-Artifacts/releases/download/v${pkgver}/${_bin_name}")
sha256sums=('4f9798ff352dccc28829779691447e85715a5caa521afe106cbb73526307e018')

package() {
    install -Dm 755 "${srcdir}/${_bin_name}" "${pkgdir}/usr/bin/${pkgname}"
}
