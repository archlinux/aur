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
sha256sums=("88c83aa6fd1044fe1cf06e65329ae8a6716ca672f919e967ed6f63912382eeb9"
	"46ecadda73abf39cda76731a94fd357b743f882dc1156b4410a2967a811c4ff1")

package() {
	install -d ${pkgdir}/usr/share/fonts/TTF/
	install -m644 iosevkalyteterm/ttf-nerd-font/*.ttf ${pkgdir}/usr/share/fonts/TTF/
	install -D -m644 ${pkgname}-${pkgver}-${pkgrel}-LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
