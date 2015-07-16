# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=gnome-shell-extension-installer
pkgver=1.4.2
pkgrel=1
pkgdesc="A bash script to search and install GNOME Shell extensions"
arch=(any)
license=(GPL2)
url=https://github.com/ianbrunelli/gnome-shell-extension-installer
depends=(gnome-shell)
optdepends=("less: to display comments and long descriptions more elegantly")
source=("$pkgname"::"$url/releases/download/v$pkgver/gnome-shell-extension-installer")
sha256sums=(22a44cacd4e2b9752395809a0642da43df59192284cfcd41398ed3e843310bbf)

package() {
  mkdir -p "$pkgdir/usr/bin"
  install $pkgname "$pkgdir/usr/bin/$pkgname" -m 755 || return 1
}
