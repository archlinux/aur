# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=plasma5-applets-plasma-drawer
pkgver=1.3
pkgrel=1
pkgdesc="A full-screen customizable launcher with application directories and krunner-like search for KDE Plasma."
arch=(any)
url="https://github.com/P-Connor/plasma-drawer"
license=(GPL)
depends=(plasma-workspace)
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('745e2ff55d5962ae83ada488033cae5daaa3bfa06fcbd429379efece31be6efcfda135c763c878e8fec5a7a22ab402e9ae0e9c149dbb22e5ca62abe39606c554')

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/P-Connor.PlasmaDrawer"
  mkdir -p "$_pkgdir"
  cp -r plasma-drawer-$pkgver/* "$_pkgdir"
  rm "$_pkgdir/README.md" "$_pkgdir/Makefile"
}
