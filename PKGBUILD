# Maintainer: Marcus Schaetzle <kickshaw22@gmail.com>
# Contributor: Nathaniel Maia <natemaia10@gmail.com>
# Contributor: Eric Vidal <eric@obarun.org>

pkgname=kickshaw
pkgver=1.1.201
pkgrel=1
pkgdesc='A menu editor for freedesktop standard menus'
url='http://download.savannah.gnu.org/releases/obladi'
arch=('x86_64')
sha256sums=('SKIP')
license=('GPL2')
source=("${url}/${pkgname}_${pkgver}_GTK3_source_only.tar.bz2")
makedepends=('gtk3' 'gcc')
depends=('gtk3')

build()
{
	cd ${pkgname}_${pkgver}_GTK3_source_only/source || exit 1
	make
}

package()
{
	install -Dm755 ${pkgname}_${pkgver}_GTK3_source_only/source/kickshaw $pkgdir/usr/bin/kickshaw
	install -Dm644 ${pkgname}_${pkgver}_GTK3_source_only/README $pkgdir/usr/share/licenses/kickshaw/README
	install -Dm644 ${pkgname}_${pkgver}_GTK3_source_only/COPYING $pkgdir/usr/share/licenses/kickshaw/COPYING

	install -d "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/af" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/am" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ar" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/as" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/az" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/be" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/bg" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/bho" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/bn" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/bo" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/br" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/bs" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ca" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ceb" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/cs" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/cy" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/da" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/de_CH" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/de_DE" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/el" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/en_GB" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/eo" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/es" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/et" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/eu" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/fa" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ff" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/fi" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/fil" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/fo" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/fr" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/fur" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/fy" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ga" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/gd" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/gl" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/gu" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ha" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/he" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/hi" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/hr" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/hsb" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ht" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/hu" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/hy" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/id" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ig" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/is" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/it" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ja" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ka" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/kk" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/kl" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/km" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/kn" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ko" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/kok" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ks" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ku_TR" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ky" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/lb" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/lo" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/lt" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/lv" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/mai" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/mg" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/mi" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/mk" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ml" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/mn" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/mr" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ms" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/mt" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/my" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/nb" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ne" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/nl" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/nn" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/nso" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/om" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/or" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/pa_IN" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/pl" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ps" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/pt_BR" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/pt_PT" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ro" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ru" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/rw" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/sc" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/sd" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/si" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/sk" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/sl" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/sq" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/sr" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/sv" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/sw" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ta" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/te" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/tg" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/th" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ti" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/tk" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/tn" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/tr" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/tt" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ug" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/uk" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/ur" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/uz" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/vi" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/wo" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/xh" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/yo" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/zh_CN" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/zh_HK" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/zh_TW" "$pkgdir/usr/share/locale"
	cp -R "$srcdir/${pkgname}_${pkgver}_GTK3_source_only/source/resources/txts/translations/zu" "$pkgdir/usr/share/locale"
}
