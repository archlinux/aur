# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=animdustry
pkgver=1.1
pkgrel=1
pkgdesc="the anime gacha bullet hell rhythm game; originally created as a mindustry april 1st event"
arch=("x86_64")
url=""
license=()
source=(
	"https://github.com/Anuken/animdustry/releases/download/v${pkgver}/animdustry_1_1_linux"
	"https://github.com/Anuken/animdustry/raw/master/assets-raw/icon.png"
	"animdustry.desktop"
)
md5sums=(
	"5f845eee753b34f5c2044fabccd24091"
	"SKIP"
	"SKIP"
	) #generate with 'makepkg -g'

package() {
	install -Dm 755 "$srcdir/animdustry_1_1_linux" "$pkgdir/usr/bin/animdustry"
	install -Dm 644 "$srcdir/icon.png" "$pkgdir/usr/share/animdustry/icon.png"
	install -Dm 644 "$srcdir/animdustry.desktop" "$pkgdir/usr/share/applications/animdustry.desktop"
}
