# Maintainer: Daniel Flanagan <daniel@lyte.dev>

pkgname=ttf-iosevka-lyte-nerd-font
pkgver=16.4.0
pkgrel=1
pkgdesc="lytedev's customized Iosevka font primarily for the Kitty terminal emulator"
arch=('any')
url="https://github.com/lytedev/Iosevka"
license=('SIL Open Font License v1.1')
source=("https://files.lyte.dev/iosevkalyte/rel/iosevkalyteterm-nerd-font-${pkgver}.tar.zstd"
	"${pkgname}-${pkgver}-${pkgrel}-LICENSE.md::https://files.lyte.dev/iosevkalyte/rel/iosevkalyteterm-${pkgver}-LICENSE.md")
sha256sums=("7e453d2f691f8090869f5da9e7bd25b6e1552d6b0b1ed5fb454ec2e428314fff"
	"46ecadda73abf39cda76731a94fd357b743f882dc1156b4410a2967a811c4ff1")

package() {
	install -d ${pkgdir}/usr/share/fonts/TTF/
	install -m644 iosevkalyteterm/ttf-nerd-font/*.ttf ${pkgdir}/usr/share/fonts/TTF/
	install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
