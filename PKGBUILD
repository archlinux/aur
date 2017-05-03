# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=gnome-shell-extension-installer
pkgver=1.6
pkgrel=1
pkgdesc="A bash script to search and install GNOME Shell extensions"
arch=(any)
license=(GPL2)
url=https://github.com/brunelli/gnome-shell-extension-installer
depends=("bash" "curl" "dbus" "glib2")
optdepends=("git: update installed extensions cloned from git"
            "less: to display comments and long descriptions more elegantly")
source=("$pkgname"::"$url/releases/download/v$pkgver/gnome-shell-extension-installer")
sha256sums=(8af22ac424e73a83f377044e1fe190ee08a02b965f1782f470fa319ad1865bef)

package() {
  mkdir -p "$pkgdir/usr/bin"
  install $pkgname "$pkgdir/usr/bin/$pkgname" -m 755 || return 1
}
