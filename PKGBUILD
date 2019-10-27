# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=gnome-shell-extension-installer
pkgver=1.7
pkgrel=1
pkgdesc="A bash script to search and install GNOME Shell extensions"
arch=(any)
license=(GPL2)
url=https://github.com/brunelli/gnome-shell-extension-installer
depends=("bash" "curl" "dbus" "glib2")
optdepends=("git: update installed extensions cloned from git"
            "less: to display comments and long descriptions more elegantly")
source=("$pkgname-$pkgver"::"$url/releases/download/v$pkgver/gnome-shell-extension-installer")
sha256sums=(f1534d65ecb6c4851f59f4c3053dbd690faa00816fa3364adb9e455d6f403643)

package() {
  mkdir -p "$pkgdir/usr/bin"
  install $pkgname-$pkgver "$pkgdir/usr/bin/$pkgname" -m 755 || return 1
}
