pkgname=lith
pkgver=2.0.44
pkgrel=1
pkgdesc='Maple Story 2 launcher'
arch=('x86_64')
url='https://www.lith.cat'
depends=('umu-launcher')

_bin_name="Lith.Launcher-${pkgver}-x64.AppImage"
source=("https://github.com/LithMS/Lith-Artifacts/releases/download/v${pkgver}/${_bin_name}")
sha256sums=('65c209c83fea26a3d731a186af60389383bac0bbeb8c576c4ddb1e02bfff7fea')

package() {
    install -Dm 755 "${srcdir}/${_bin_name}" "${pkgdir}/usr/bin/${pkgname}"
}
