# Maintainer: Andy Richardson <andy.john.richardson@gmail.com>
pkgname=gnome-shell-extension-simply-workspaces-git
pkgver=v6
pkgrel=1
pkgdesc="Gnome 3 workspace indicator with an i3/polybar style."
arch=(any)
licence=(GPLv3)
depends=('gnome-shell>=1:40.0')

makedepends=('git')
source=("git+https://github.com/andyrichardson/simply-workspaces.git#tag=$pkgver")
sha256sums=('SKIP')
provides+=("$pkgname=$pkgver")
conflicts+=("$pkgname")

package() {
  cd simply-workspaces
  make PREFIX=$pkgdir/usr install
}
