# Maintainer: Ayrton Sparling <ayrton@sparling.us>
_pkgname=lightdm-webkit2-material2
pkgname=lightdm-webkit2-theme-material2
pkgver=0.0.3
pkgrel=1
pkgdesc="A material design LightDM theme for lightdm-webkit2-greeter"
arch=('any')
url="https://github.com/FallingSnow/${_pkgname}"
license=('WTFPL')
depends=('lightdm-webkit2-greeter')
source=("https://github.com/FallingSnow/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('8c349fbe847d321c4c70b57e24394e34052206d3bd63ea9efd199b922d1a7e60233a70b2ca5bd61a6234190d06c5aaf38391f4d9f91f782313c783c09ed39a0d')

package() {
    rm "$srcdir/lightdm-webkit2-material2-${pkgver}.tar.gz"
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/material2"
	cp -r "$srcdir/"* \
		"$pkgdir/usr/share/lightdm-webkit/themes/material2/"
}
