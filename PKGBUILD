# Maintainer: klmn <cuk at outlook com>
# Contributor: LightDot <lightdot at gmail com>

pkgname=proxsign-bin
pkgver=2.2.12.29
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

sha256sums=('c7563596e3caac39b939f82949b96beddcfcffef2f3a9a18dd155149935b171d')

package() {
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/usr/bin/${_pkgname}"
}
