# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=gnome-shell-extension-installer
pkgver=1.4.3
pkgrel=1
pkgdesc="A bash script to search and install GNOME Shell extensions"
arch=(any)
license=(GPL2)
url=https://github.com/brunelli/gnome-shell-extension-installer
depends=("bash" "curl" "dbus" "glib2" "gnome-shell")
optdepends=("less: to display comments and long descriptions more elegantly")
source=("$pkgname"::"$url/releases/download/v$pkgver/gnome-shell-extension-installer")
sha256sums=(6de579a822e923c87626d63daf1e486319d8df71a494288a32934c04decd89b2)

package() {
  mkdir -p "$pkgdir/usr/bin"
  install $pkgname "$pkgdir/usr/bin/$pkgname" -m 755 || return 1
}
