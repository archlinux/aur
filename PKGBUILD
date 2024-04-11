# Maintainer: Gordon Chan <gc@gondro.xyz>

pkgname=ttf-shanggu
pkgver=1.020
pkgrel=3
pkgdesc="基於思源的傳承字形（舊字形）字體 尚古 Shanggu Fonts"
arch=(any)
url="https://github.com/GuiWonder/Shanggu"
license=('OFL-1.1')

source=($url/releases/download/$pkgver/ShangguMonoOTCs.7z
	$url/releases/download/$pkgver/ShangguSansOTCs.7z
	$url/releases/download/$pkgver/ShangguSerifOTCs.7z)


md5sums=('SKIP'
	 'SKIP'
	 'SKIP')

package() {
	install -Dm644 *.ttc -t $pkgdir/usr/share/fonts/shanggu/
}
