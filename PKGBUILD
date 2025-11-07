# Maintainer: Marko Zivic <marko.b.zivic@gmail.com>
pkgname=endcord
pkgver=1.0.0.alpha.20
pkgrel=1
pkgdesc="Feature rich Discord TUI client."
arch=('any')
url="https://github.com/mzivic7/$pkgname"
license=('GPL-3.0-only')
provides=('endcord')
conflicts=('endcord')
depends=()
makedepends=()
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland'
            'aspell: spellchecking'
            'yt-dlp: youtube support'
            'mpv: youtube in native player')
source=("$pkgname.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver-linux.tar.gz")
sha256sums=('SKIP')
options=(!strip)

package() {
	install -Dm755 ./$pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./commands.md "$pkgdir/usr/share/doc/$pkgname/commands.md"
	install -Dm644 ./configuration.md "$pkgdir/usr/share/doc/$pkgname/configuration.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
