# Maintainer: Anvar Umarov <arpanetus@protonmail.com>

pkgname="i3-maim-clpimg"
pkgver=1.0.0
pkgrel=0
pkgdesc="create a screenshot and then immediately copy it into the clipboard"
arch=('any')
license=('GPL')
url="https://github.com/arpanetus/i3-maim-clpimg"
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.zip")
depends=('clpimg' 'libnotify' 'maim' 'xdg-user-dirs' 'xdotool')

package() {
        cd "$pkgname-${pkgver}"
        make DESTDIR="$pkgdir" install
}
md5sums=('d6ad879e168690721a4cb43370883947')
md5sums=('d6ad879e168690721a4cb43370883947')
