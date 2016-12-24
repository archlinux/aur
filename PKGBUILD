# Maintainer: Ayrton Sparling <ayrton@sparling.us>
_pkgname=lightdm-webkit2-material2
pkgname=lightdm-webkit2-theme-material2
pkgver=0.0.1
pkgrel=2
pkgdesc="A material design LightDM theme for lightdm-webkit2-greeter"
arch=('any')
url="https://github.com/FallingSnow/${_pkgname}"
license=('WTFPL')
depends=('lightdm-webkit2-greeter')
source=("https://github.com/FallingSnow/${_pkgname}/releases/download/v${pkgver}-${pkgrel}/${_pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha512sums=('5a7b51ccd5723e7ebbcadc8792e113ec3ea2d3d8276da3d70adc56ad556481b838cc4ad1c6bdaa678021088b9c5ed59cc80b53822e48b2fe85fbeb5e181484f0')

package() {
    rm "$srcdir/lightdm-webkit2-material2-${pkgver}-${pkgrel}.tar.gz"
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/material2"
	cp -r "$srcdir/"* \
		"$pkgdir/usr/share/lightdm-webkit/themes/material2/"
}
