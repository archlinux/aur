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
sha512sums=('dfbad0145bc39df83f2b2959e4b59a254c7d4a49ecd544d671e5726ae2e6300ee1024aa91711c9b49204c9c2394b7873ba8553213f794a4453f5b9b702eea5c7')

package() {
    rm "$srcdir/lightdm-webkit2-material2-${pkgver}-${pkgrel}.tar.gz"
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/material2"
	cp -r "$srcdir/"* \
		"$pkgdir/usr/share/lightdm-webkit/themes/material2/"
}
