# Maintainer: tuxifreund <kaiser.barbarossa@yandex.com>
pkgname=mybrowse
pkgver=0.5
pkgrel=1
pkgdesc="A simple WebKit browser written in Python3 and using GTK3"
arch=('any')
url="https://github.com/KaiserBarbarossa/MyBrowse"
license=('GPL3')
depends=('webkit2gtk' 'python' 'python-gobject')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KaiserBarbarossa/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b5f6f72bd51bbaf44a7eff15d22063ffddfa23b38021d7c20f80f7e91fff1cee')


package() {
	cd "MyBrowse-$pkgver"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
