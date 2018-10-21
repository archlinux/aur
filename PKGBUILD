# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=texturecache
_pkgname=texturecache.py
pkgver=2.4.6
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
sha256sums=('73ea01e1be009ec8153e0b241c356ad045aae5a2f1c4ccec3de902aeb0939240')

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/texturecache"
	install -Dm644 "texturecache.cfg.defaults" "$pkgdir/usr/share/texturecache/texturecache.cfg"
}
