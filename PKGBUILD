# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=gnome-shell-extension-installer
pkgver=1.5
pkgrel=1
pkgdesc="A bash script to search and install GNOME Shell extensions"
arch=(any)
license=(GPL2)
url=https://github.com/brunelli/gnome-shell-extension-installer
depends=("bash" "curl" "dbus" "glib2" "gnome-shell")
optdepends=("less: to display comments and long descriptions more elegantly")
source=("$pkgname"::"$url/releases/download/v$pkgver/gnome-shell-extension-installer")
sha256sums=(da6b5577b9bfb48573827c1785933772f93da75820162273cabcb9fac1f9d795)

package() {
  mkdir -p "$pkgdir/usr/bin"
  install $pkgname "$pkgdir/usr/bin/$pkgname" -m 755 || return 1
}
