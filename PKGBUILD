# shellcheck disable=2034
# Maintainer: Andres Rodriguez Michel <andresmichelrodriguez@gmail.com>

pkgname=ttf-ligaconsolas-nerd-font
pkgver=1.0
pkgrel=3
pkgdesc="Consolas font family patched with ligatures and glyphs"
arch=(any)
depends=(fontconfig xorg-font-util)
source=("https://github.com/Dosx001/$pkgname/raw/main/ligaconsolas-fonts-ttf.tar.gz")
install=$pkgname.install
md5sums=('ee98aac8d196250386f594d5495d43ba')

package() {
	install -dm 755 "${pkgdir}"/usr/share/fonts/TTF
	install -Dm644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}
