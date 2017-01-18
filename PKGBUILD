# Maintainer: Ayrton Sparling <ayrton@sparling.us>
_pkgname=lightdm-webkit2-material2
pkgname=lightdm-webkit2-theme-material2
pkgver=0.0.2
pkgrel=1
pkgdesc="A material design LightDM theme for lightdm-webkit2-greeter"
arch=('any')
url="https://github.com/FallingSnow/${_pkgname}"
license=('WTFPL')
depends=('lightdm-webkit2-greeter')
source=("https://github.com/FallingSnow/${_pkgname}/releases/download/v${pkgver}-${pkgrel}/${_pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha512sums=('d83a18b55a45e188b7a0c38f4a70c7d76bbdfdc1cc8319d64f5bead5e15883ff6942905e5bf3b809fc3edf63cd7605271df33013f46fca5b0de9b13338fcbc0d')

package() {
    rm "$srcdir/lightdm-webkit2-material2-${pkgver}-${pkgrel}.tar.gz"
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/material2"
	cp -r "$srcdir/"* \
		"$pkgdir/usr/share/lightdm-webkit/themes/material2/"
}
