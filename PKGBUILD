# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=texturecache
_pkgname=texturecache.py
pkgver=2.5.4
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
sha256sums=('0717c2e62dc3f809e8754be2c83d2c7d0f92188741eb425d5377c1d326d25276')

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/texturecache"
	install -Dm644 "texturecache.cfg.defaults" "$pkgdir/usr/share/texturecache/texturecache.cfg"
}
