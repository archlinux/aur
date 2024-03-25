# Maintainer: Denis Ismailaj <denis.ismailaj1@gmail.com>
pkgname=i3-auto-arrange
pkgver=1.0.3
pkgrel=1
pkgdesc="Rearrange i3 workspaces to get rid of gaps in numbering"
arch=('any')
url="https://github.com/denis-ismailaj/i3-auto-arrange"
license=('GPL3')
depends=('i3-wm' 'jq')

package() {
	install -D -m 755 i3-auto-arrange.sh "$pkgdir/usr/bin/i3-auto-arrange"
}
