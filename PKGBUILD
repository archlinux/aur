# Maintainer: Danila Fominykh <dancheg97@fmnx.su>

pkgname=gnome-shell-extension-compact-top-bar
pkgver=1
pkgrel=1
pkgdesc="Compact and transparent top bar for GNOME"
arch=("any")
url="https://github.com/metehan-arslan/gnome-compact-top-bar"
license=('MIT')
source=(
    "$pkgname::git+https://github.com/metehan-arslan/gnome-compact-top-bar.git"
)
md5sums=("SKIP")

package() {
  cd "$pkgname/compact-top-bar@metehan-arslan.github.io"
  destdir=/usr/share/gnome-shell/extensions/gnome-compact-top-bar@metehan-arslan.github.io
  find . -type f -exec install -Dm777 {} $pkgdir$destdir/{} \;
}
