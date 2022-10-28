# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=morewaita
_reponame=MoreWaita
pkgver=43.1.1
_commit=fbc3a2e0ad6f2ab11704265394ea138ae51b296a
pkgrel=2
pkgdesc='An Adwaita style extra icons theme for Gnome Shell.'
arch=(any)
url="https://github.com/somepaulo/$_reponame"
license=(GPL3)
depends=('gnome-shell>=43')
makedepends=(git)
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

package() {
	install -d "$pkgdir/usr/share/icons"

	rm -rf "$_reponame/.git"
	cp -r "$_reponame" "$pkgdir/usr/share/icons"
}
