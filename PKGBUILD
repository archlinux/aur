# Maintainer: Paarush Senthilkumar <paarushsk at gmail dot com>
# Contributor: Lancelot OWCZARCZAK <lancelot@owczarczak.fr>

pkgname=inochi-session
pkgver=0.8.7
pkgrel=1
pkgdesc="Application that allows streaming with Inochi2D puppets"
arch=('x86_64')
url='https://inochi2d.com/'
license=('BSD-2-Clause')
provides=('cimgui.so')
depends=(dbus freetype2 gcc-libs sdl2 glibc)
source=(
	"https://github.com/Inochi2D/inochi-session/releases/download/v$pkgver/inochi-session-linux.zip"
	"https://raw.githubusercontent.com/Inochi2D/inochi-session/refs/tags/v$pkgver/LICENSE"
)
sha512sums=('129a9bd8b017778902dc94ccb58faf344236231526e305003283ced1778849bba787561ed73101ce20099dfdcc4a44e69164e808dacbf863d2fd4bd12aadad08'
            '44f274eead9606bd0674049debf99dedfcddcf670e8aa04d62d40a474905d63441feefc66451a2a202a1b7d2775cc1db070d3dee746220ef2b9bb006060e900e')

package() {
	cd "$srcdir"
	install -m 755 -D cimgui.so "$pkgdir/usr/bin/cimgui.so"
	install -m 755 -D inochi-session "$pkgdir/usr/bin/inochi-session"
	install -m 644 -D LICENSE-FreeType "$pkgdir/usr/share/licenses/inochi-session/LICENSE-FreeType"
	install -m 644 -D LICENSE-imgui "$pkgdir/usr/share/licenses/inochi-session/LICENSE-imgui"
	install -m 644 -D LICENSE-Lua "$pkgdir/usr/share/licenses/inochi-session/LICENSE-Lua"
	install -m 644 -D LICENSE-Spout2 "$pkgdir/usr/share/licenses/inochi-session/LICENSE-Spout2"
	install -m 644 -D MaterialIcons-LICENSE "$pkgdir/usr/share/licenses/inochi-session/MaterialIcons-LICENSE"
	install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/inochi-session/LICENSE"
}
