# Maintainer: tuxifreund <kaiser.barbarossa@yandex.com>
pkgname=mybrowse
pkgver=0.4
pkgrel=2
pkgdesc="A simple WebKit browser written in Python3 and using GTK3"
arch=('any')
url="https://github.com/KaiserBarbarossa/MyBrowse"
license=('GPL3')
depends=('webkit2gtk' 'python' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KaiserBarbarossa/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('20195b0e61c484c68cc124c66b352305d60a9d779a772dcba95adc9ad43bbe02')


package() {
	cd "MyBrowse-$pkgver"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
