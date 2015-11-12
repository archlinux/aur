# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=texturecache
_pkgname=texturecache.py
pkgver=2.2.4
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
sha256sums=('03e7f25a2db122ec85a9936e7ded23a88a66889aa6de82f4905be904693b7ae0')

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/texturecache"
	install -Dm644 "texturecache.cfg.defaults" "$pkgdir/usr/share/texturecache/texturecache.cfg"
}
