# Maintainer: Ayrton Sparling <ayrton@sparling.us>
_pkgname=lightdm-webkit2-material2
pkgname=lightdm-webkit2-theme-material2
pkgver=0.0.1
pkgrel=3
pkgdesc="A material design LightDM theme for lightdm-webkit2-greeter"
arch=('any')
url="https://github.com/FallingSnow/${_pkgname}"
license=('WTFPL')
depends=('lightdm-webkit2-greeter')
source=("https://github.com/FallingSnow/${_pkgname}/releases/download/v${pkgver}-${pkgrel}/${_pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha512sums=('836d1f81af0929e03dd6e9f6b5e282de8b1edbdc71e526c7609258f012d08804d770653e4bfa0ff8d71236beeb5617f9abca53c12b21aaf02a864720d850caf7')

package() {
    rm "$srcdir/lightdm-webkit2-material2-${pkgver}-${pkgrel}.tar.gz"
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/material2"
	cp -r "$srcdir/"* \
		"$pkgdir/usr/share/lightdm-webkit/themes/material2/"
}
