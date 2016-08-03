# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=texturecache
_pkgname=texturecache.py
pkgver=2.3.2
pkgrel=1
pkgdesc="Utility to manage the XBMC/Kodi texture cache and more."
arch=('any')
url="https://github.com/MilhouseVH/texturecache.py"
license=('GPL')
depends=('python' 'kodi')
conflicts=('xbmc-texturecache')
replaces=('xbmc-texturecache')
install=readme.install
source=("https://github.com/MilhouseVH/${_pkgname/%%.py}/archive/$pkgver.tar.gz")
sha256sums=('2cc78c7a1ed5974d3abcb25298bd366ab4d601b4de2992afb8abc6cdb29803c2')

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/texturecache"
	install -Dm644 "texturecache.cfg.defaults" "$pkgdir/usr/share/texturecache/texturecache.cfg"
}
