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
sha512sums=('1e8b286e81162298e27ef00e4b1f28cb30112162aec3080f2c15ff036e251dcd2bf281d07bbb63d4c9cab62f50735c0fcb983b84228d0e523d325317a16e9d74')

package() {
    rm "$srcdir/lightdm-webkit2-material2-${pkgver}-${pkgrel}.tar.gz"
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/material2"
	cp -r "$srcdir/"* \
		"$pkgdir/usr/share/lightdm-webkit/themes/material2/"
}
