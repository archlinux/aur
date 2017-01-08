# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=gnome-shell-extension-installer
pkgver=1.5.1
pkgrel=1
pkgdesc="A bash script to search and install GNOME Shell extensions"
arch=(any)
license=(GPL2)
url=https://github.com/brunelli/gnome-shell-extension-installer
depends=("bash" "curl" "dbus" "glib2")
optdepends=("less: to display comments and long descriptions more elegantly")
source=("$pkgname"::"$url/releases/download/v$pkgver/gnome-shell-extension-installer")
sha256sums=(499d0940f3ba4c9e5d153d27de0d7c46d48c66c77be777b3403989e2899770e1)

package() {
  mkdir -p "$pkgdir/usr/bin"
  install $pkgname "$pkgdir/usr/bin/$pkgname" -m 755 || return 1
}
