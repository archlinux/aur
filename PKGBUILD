# Maintainer: Noa <coolreader18@gmail.com>

pkgname=gimp-stroke-arrows
pkgver=0.8
pkgrel=1
pkgdesc="Stroke one or several paths as arrows"
arch=(any)
url="https://github.com/Scallact/gimp-stroke-arrows"
license=('GPL-3.0')
depends=(gimp)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3a0a746d92e4ee1ec0ace07d4224daff1d483d1cd447539708e7a95142b8ada4')

package() {
	cd "$pkgname-$pkgver"
	local plugin_dir="$pkgdir/usr/lib/gimp/3.0/plug-ins"
	install -d "$plugin_dir"
	cp -r pl_stroke_arrows -t "$plugin_dir"
	chmod +x "$plugin_dir"/pl_stroke_arrows/pl_stroke_arrows.py
}
