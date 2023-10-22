# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=kwin-effects-kinetic
pkgver=1.0
pkgrel=1
pkgdesc="KWin effects optimized for a smooth and snappy KDE Plasma experience."
arch=(any)
url='https://github.com/gurrgur/kwin-effects-kinetic'
license=(GPL)
depends=(kwin)
source=("kwin-effects-kinetic-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('aa7f105e88feecb7309d7e17b9bc45d24921ae62f3f51f3f34f5c6fcef47ca602fff7c3741a2f35700e772ce257e0264436b580795e32487d5dfa8dcf374b716')

package() {
	cd "kwin-effects-kinetic-$pkgver"
	install -d "$pkgdir/usr/share/kwin/effects/kwin4_effect_fadingpopups_kinetic"
	install -d "$pkgdir/usr/share/kwin/effects/kwin4_effect_maximize_kinetic"
	install -d "$pkgdir/usr/share/kwin/effects/kwin4_effect_minimize_kinetic"
	install -d "$pkgdir/usr/share/kwin/effects/kwin4_effect_open_close_kinetic"
	cp -r LICENSE kwin4_effect_fadingpopups_kinetic/contents/ kwin4_effect_fadingpopups_kinetic/metadata.json kwin4_effect_fadingpopups_kinetic/metadata.desktop "$pkgdir/usr/share/kwin/effects/kwin4_effect_fadingpopups_kinetic/"
	cp -r LICENSE kwin4_effect_maximize_kinetic/contents/ kwin4_effect_maximize_kinetic/metadata.json kwin4_effect_maximize_kinetic/metadata.desktop "$pkgdir/usr/share/kwin/effects/kwin4_effect_maximize_kinetic/"
	cp -r LICENSE kwin4_effect_minimize_kinetic/contents/ kwin4_effect_minimize_kinetic/metadata.json kwin4_effect_minimize_kinetic/metadata.desktop "$pkgdir/usr/share/kwin/effects/kwin4_effect_minimize_kinetic/"
	cp -r LICENSE kwin4_effect_open_close_kinetic/contents/ kwin4_effect_open_close_kinetic/metadata.json kwin4_effect_open_close_kinetic/metadata.desktop "$pkgdir/usr/share/kwin/effects/kwin4_effect_open_close_kinetic/"
	install -Dm644 kwin4_effect_fadingpopups_kinetic/metadata.desktop "$pkgdir/usr/share/kservices5/kwin-script-effect_fadingpopups_kinetic.desktop"
	install -Dm644 kwin4_effect_maximize_kinetic/metadata.desktop "$pkgdir/usr/share/kservices5/kwin-script-effect_maximize_kinetic.desktop"
	install -Dm644 kwin4_effect_minimize_kinetic/metadata.desktop "$pkgdir/usr/share/kservices5/kwin-script-effect_minimize_kinetic.desktop"
	install -Dm644 kwin4_effect_open_close_kinetic/metadata.desktop "$pkgdir/usr/share/kservices5/kwin-script-effect_open_close_kinetic.desktop"
}
