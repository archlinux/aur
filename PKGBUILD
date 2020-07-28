# Maintainer: Stanislav Nikitin <pztrn@pztrn.name>
pkgname=ttf-play
pkgver=1.003
pkgrel=2
pkgdesc='Play is a minimalistic sans serif typeface designed by Jonas Hecksher'
url='https://fonts.google.com/specimen/Play'
arch=('any')
license=('custom:OFL')
makedepends=('xorg-mkfontscale' 'xorg-mkfontdir')
depends=('fontconfig')
install=ttf-play.install
source=('Play-Bold.ttf' 'Play-Regular.ttf' 'OFL.txt')
md5sums=('b49c4452371f07f848dcff78ede105bc' 'd90e0a0e734eb3816dec96b3e69cb6a8' 'bae593292272cfd18c27322cd0986555')

package() {
	install -Dm644 Play-Bold.ttf "$pkgdir/usr/share/fonts/TTF/Play-Bold.ttf"
	install -Dm644 Play-Regular.ttf "$pkgdir/usr/share/fonts/TTF/Play-Regular.ttf"
	install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
