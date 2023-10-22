# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=plasma5-applets-control-centre
pkgver=0.1.0
pkgrel=1
pkgdesc="A beautiful control centre widget for KDE Plasma directly inspired by the MacOS control centre."
arch=(any)
url="https://github.com/Prayag2/kde_controlcentre"
license=(GPL3)
depends=(plasma-workspace)
source=("$url/archive/$pkgver.tar.gz")
sha512sums=('93e971e018bf03ae5e9b00e481d6037a568e191a12cd357b23aacc083980c9010adea3a24c00d22a30ac7a869e17fea371461a1ee7ecbd13835b77b42056c51c')

package() {
  _pkgdir="$pkgdir/usr/share/plasma/plasmoids/com.github.prayag2.controlcentre"
  mkdir -p "$_pkgdir"
  cp -r kde_controlcentre-$pkgver/package/* "$_pkgdir"
}
