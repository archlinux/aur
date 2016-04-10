#Maintainer: Cory Swauger <ensayia@gmail.com>

_pkgname=Lila
pkgname=lila-icon-theme
pkgver=20160409
pkgrel=1
pkgdesc="$_pkgname Icon Theme"
arch=('any')
license=('CC BY-NC-ND 4.0')
url="http://ilnanny.deviantart.com/art/Lila-HD-icon-theme-2-0-594947650"
depends=('')
source=('Lila-hd-icon-theme::git+https://github.com/ilnanny/Lila-hd-icon-theme.git#branch=master')
md5sums=('SKIP')

package() {
	install -d -m755 "$pkgdir/usr/share/icons"
	cd Lila-hd-icon-theme
	cp -r * "$pkgdir/usr/share/icons"
}
