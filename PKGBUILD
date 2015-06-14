# Maintainer: Simon Tunnat <simon+aur@tunn.at>

pkgname=ttf-coolvetica
pkgver=1.0
pkgrel=1
pkgdesc="Coolvetica font (taken from Garry's Mod)"
url='https://github.com/garrynewman/garrysmod/'
license=(unknown)
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/garrynewman/garrysmod/raw/master/garrysmod/resource/fonts/coolvetica.ttf"
	"https://raw.github.com/garrynewman/garrysmod/master/garrysmod/resource/fonts/coolvetica.txt")
md5sums=('df7be7ddc6446f1f376fb9b7a1cf72a6'
	 'ca90b93f23ae14f68b365e7641ba0186')
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/coolvetica.ttf" "$pkgdir/usr/share/fonts/TTF/coolvetica.ttf"
  install -Dm644 "$srcdir/coolvetica.txt" "$pkgdir/usr/share/licenses/ttf-coolvetica/LICENSE"
}
