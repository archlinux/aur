# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=morewaita
pkgver=1.0.0
_commit=5e09e4e0b6489404cb91dba472081b74fb997461
pkgrel=1
pkgdesc='An Adwaita style extra icons theme for Gnome Shell.'
arch=(any)
url=https://github.com/somepaulo/MoreWaita
license=(GPL3)
depends=(gnome-shell)
makedepends=(git)
source=("$pkgname::git+$url#commit=$_commit")
md5sums=(SKIP)

package() {
	install -d "$pkgdir/usr/share/icons"

	rm -rf "$pkgname/.git"
	cp -r "$pkgname" "$pkgdir/usr/share/icons"
}
