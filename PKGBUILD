# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=morewaita
_reponame=MoreWaita
pkgver=45.0
_commit=0a3bea3f5f8569f340c470b95080a8de1f870070 # tag/v45
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
	local themedir="$pkgdir/usr/share/icons/MoreWaita"
	install -d "$themedir"

	cp -r "$_reponame/apps"      "$themedir/apps"
	cp -r "$_reponame/mimes"     "$themedir/mimes"
	cp -r "$_reponame/panel"     "$themedir/panel"
	cp -r "$_reponame/places"    "$themedir/places"
	cp -P "$_reponame/apps@2x"   "$themedir/apps@2x"
	cp -P "$_reponame/mimes@2x"  "$themedir/mimes@2x"
	cp -P "$_reponame/panel@2x"  "$themedir/panel@2x"
	cp -P "$_reponame/places@2x" "$themedir/places@2x"
	cp "$_reponame/index.theme"  "$themedir/index.theme"
}
