# Contributor: ShadowKyogre <shadowkyogre@aim.com>
pkgname=ttf-lightfoot
pkgver=1.0
pkgrel=1
pkgdesc="Lightfoot font by Paul Lloyd"
arch=(any)
url="http://www.fontstock.net/type-designers/paul-lloyd.html"
license=('freeware')
depends=(fontconfig xorg-font-utils)
source=("Lightfoot.zip::http://www.fontstock.net/download/download.ashx?d=317207"
"Lightfoot-Narrow-Extra-condensed-Regular.zip::http://www.fontstock.net/download/download.ashx?d=317211")
md5sums=('156dc4742da480f262dbc631429baa9f'
         '028d66e0970500f1bdc6e52b446ab0ec')

package() {
	mkdir -p $pkgdir/usr/share/fonts/TTF
	cd $srcdir
	cp -r ./*/*.ttf $pkgdir/usr/share/fonts/TTF/
}

# vim:set ts=2 sw=2 et:
