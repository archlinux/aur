# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=morewaita
_reponame=MoreWaita
pkgver=44.1
_commit=6acecb2761e3e97b9c9592e05f96ef824c8d0789 # tag/v44.1
pkgrel=1
pkgdesc='An Adwaita style extra icons theme for Gnome Shell.'
arch=(any)
url="https://github.com/somepaulo/$_reponame"
license=(GPL3)
depends=(adwaita-icon-theme)
makedepends=(git)
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

package() {
	install -d "$pkgdir/usr/share/icons"

	rm -rf "$_reponame/.git"
	cp -r "$_reponame" "$pkgdir/usr/share/icons"
}
