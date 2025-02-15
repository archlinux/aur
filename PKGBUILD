# Maintainer: klmn <cuk at outlook com>
# Contributor: LightDot <lightdot at gmail com>

pkgname=proxsign-bin
pkgver=2.2.13.38
pkgrel=1
_pkgname=proxsign
_pkgver=pkgver
pkgdesc="SETCCE proXSign® is a set of components for PKI based digital signing. Official AppImage build."
arch=('x86_64')
url="https://www.setcce.com/products/electronic-signature-technologies/pki"
license=('custom: SETCCE')
depends=('fuse2')
provides=('proxsign')
conflicts=('proxsign')
options=("!strip")
_appimage="SETCCE_proXSign-$pkgver-x86_64.AppImage"
source=("https://public.setcce.si/proxsign/update/linux/${_appimage}")
noextract=("${_appimage}")

sha256sums=('2317b45e312b722d880f8614c7fcebe297f55d38b73369fd13f2088760cf601f')

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
}
