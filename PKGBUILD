# Maintainer: Stefan Schmidt <thrimbor.github gmail com>

pkgname="teamspeak3-kde-link-fix-hack"
pkgver=0.1
pkgrel=1
pkgdesc="Hack to work around the URL opening bug in TeamSpeak 3 occuring when using KDE"
arch=(any)
depends=("teamspeak3")
source=("xdg-open")
sha256sums=('b38009aef984dd301d0e305acca92796d92e4ee5c280d9be5c6c6018d270e672')

package() {
  install -m755 -D "xdg-open" "$pkgdir/usr/local/bin/xdg-open"
}
