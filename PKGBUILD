# Maintainer: Paulo Fino <somepaulo@duck.com>

pkgname=adwaita-colors-icon-theme
_reponame=Adwaita-colors
pkgver=2.3
_commit=b1f38e0b0c2adad34a8cf323a99eb3579ff41db6 # Release tag commit
pkgrel=1
pkgdesc="Adwaita Colors enhances the Adwaita icon theme by integrating GNOME’s accent color feature. It ensures that your Adwaita icons reflect the same accent color as your GNOME theme."
arch=(any)
url="https://github.com/dpejoh/Adwaita-colors"
license=(GPL3)
depends=("adwaita-icon-theme" "adwaita-icon-theme-legacy")
makedepends=("git")
conflicts=("adwaita-colors-icon-theme-git")
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

package() {
	local themedir="$pkgdir/usr/share/icons"
	install -d "$themedir"
	cp -r "$_reponame/Adwaita"*      "$themedir"
}
