# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=gnome-shell-extension-clipboard-indicator
pkgver=34
pkgrel=1
pkgdesc="Adds a clipboard indicator to the top panel, and caches clipboard history"
arch=("any")
url="https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator"
license=("GPL")
depends=("gnome-shell")
conflicts=("gnome-shell-extension-clipboard-indicator-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=("11cb5fff6b3084fb13116ddaed8eb3b7")

package() {
  install -d "$pkgdir/usr/share/gnome-shell/extensions" && cp -a "$srcdir/$pkgname-$pkgver/." "$_/clipboard-indicator@tudmotu.com"
}
