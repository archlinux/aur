# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=gnome-shell-extension-installer
pkgver=1.6.2
pkgrel=1
pkgdesc="A bash script to search and install GNOME Shell extensions"
arch=(any)
license=(GPL2)
url=https://github.com/brunelli/gnome-shell-extension-installer
depends=("bash" "curl" "dbus" "glib2")
optdepends=("git: update installed extensions cloned from git"
            "less: to display comments and long descriptions more elegantly")
source=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/gnome-shell-extension-installer")
sha256sums=(4c1dfbdc94692ae8db1fdf26c66209170ca6fa4cacb6875d7e5bbb3e5be1864f)

package() {
  mkdir -p "$pkgdir/usr/bin"
  install $pkgname-$pkgver "$pkgdir/usr/bin/$pkgname" -m 755 || return 1
}
