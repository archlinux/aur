# Maintainer: Anvar Umarov <arpanetus@protonmail.com>

pkgname="i3-maim-clpimg"
pkgver=1.0.0
pkgrel=0
pkgdesc="Create a screenshot and then immediately copy it into the clipboard"
arch=("x86_64")
license=('GPL')
source=("https://github.com/arpanetus/i3-maim-clpimg/archive/refs/tags/$pkgver.zip")
depends=('clpimg' 'libnotify' 'maim' 'xdg-user-dirs' 'xdotool')

package() {
        cd "$pkgname-${pkgver}"
        make DESTDIR="$pkgdir" install
}
md5sums=('d6ad879e168690721a4cb43370883947')
md5sums=('d6ad879e168690721a4cb43370883947')
