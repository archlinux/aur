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
sha512sums=('40396b2cc838818ec92f16dcfe3fb755d12dfa059cd1cf46a91addfbaa85d85a6ad79be8d613645afec8a77c1af9e657045c9d1f189e4bb0c64fcfab0ae39557')

package() {
    rm "$srcdir/lightdm-webkit2-material2-${pkgver}.tar.gz"
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/material2"
	cp -r "$srcdir/"* \
		"$pkgdir/usr/share/lightdm-webkit/themes/material2/"
}
