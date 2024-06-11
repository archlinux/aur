# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=plasma5-applets-plasma-drawer
pkgver=1.4
pkgrel=1
pkgdesc="A full-screen customizable launcher with application directories and krunner-like search for KDE Plasma."
arch=(any)
url="https://github.com/P-Connor/plasma-drawer"
license=(GPL)
depends=(plasma-workspace)
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('015cc8816e51d750436cee88f8bfabb0159363f98cbc8e41608ff5a0fe25fd9b6ace4125b74edb0289cb9c930b2760e42a616cef2c499d9856bd69711672c33f')

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/P-Connor.PlasmaDrawer"
  mkdir -p "$_pkgdir"
  cp -r plasma-drawer-$pkgver/* "$_pkgdir"
  rm "$_pkgdir/README.md" "$_pkgdir/Makefile"
}
