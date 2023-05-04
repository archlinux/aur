# shellcheck shell=bash disable=SC2034,SC2154
# download fonts by yourself due to a login wall
pkgname=ttf-fzjljw
pkgver=1.10
pkgrel=1
pkgdesc="a font of Beijing Founder Electronics"
arch=(any)
url=https://www.foundertype.com/index.php/FindFont
license=(custom)
source=()
sha256sums=()

package() {
	install -D ../*.ttf -t "$pkgdir/usr/share/fonts/TTF"
}
