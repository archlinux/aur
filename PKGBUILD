# Maintainer: Daniel Flanagan <daniel@lyte.dev>

pkgname=ttf-iosevka-lyte
pkgver=7.2.8
pkgrel=1
pkgdesc="lytedev's customized Iosevka font"
arch=('any')
url="https://github.com/lytedev/Iosevka"
license=('SIL Open Font License v1.1')
source=("https://files.lyte.dev/iosevkalyte/rel/iosevkalyte-${pkgver}.tar.zstd"
	"${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://files.lyte.dev/iosevkalyte/rel/iosevkalyte-${pkgver}-LICENSE.md")
sha256sums=("b52d069ccdc28bce58c5ef640fa6782cd01ca0b603e9b87fa0f9b5c9eac47cb3"
	"72c3d557ff41d871680652f56afd565ba6834c90eadc45a4ec15410dce1c0c80")

package() {
	install -d ${pkgdir}/usr/share/fonts/TTF/
	install -m644 iosevkalyte/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF/
	install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
