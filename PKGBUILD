# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=texturecache
_pkgname=texturecache.py
pkgver=2.4.5
pkgrel=1
pkgdesc="Utility to manage the XBMC/Kodi texture cache and more."
arch=('any')
url="https://github.com/MilhouseVH/texturecache.py"
license=('GPL')
depends=('python' 'kodi')
conflicts=('xbmc-texturecache')
replaces=('xbmc-texturecache')
install=readme.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MilhouseVH/$pkgname.py/archive/$pkgver.tar.gz")
sha256sums=('7bcc60f9bd681c1eb6dae7acde54965b50a179df1641c99973d3611929cd3d02')

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/texturecache"
	install -Dm644 "texturecache.cfg.defaults" "$pkgdir/usr/share/texturecache/texturecache.cfg"
}
