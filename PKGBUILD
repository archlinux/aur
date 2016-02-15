#Maintainer: Cory Swauger <ensayia@gmail.com>

_pkgname=Meliora
pkgname=meliora-openbox-themes
pkgver=20160214
pkgrel=1
pkgdesc="$_pkgname Openbox Themes"
arch=('any')
license=('ZLIB')
url="https://bitbucket.org/Ensayia/meliora-openbox-themes/src"
depends=('openbox')
source=('meliora-openbox-themes::git+https://bitbucket.org/Ensayia/meliora-openbox-themes.git#branch=master')
md5sums=('SKIP')

package() {
	install -d -m755 "$pkgdir/usr/share/themes"
	cd meliora-openbox-themes
	cp -r * "$pkgdir/usr/share/themes"
}
