# Maintainer:
# Contributor: FabioLolix
# Contributor: archplayer
# Contributor: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

pkgname=xmind
_pkgver=12.0.1-202203290828
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=(x86_64)
url="https://www.xmind.net"
license=(unknown)
depends=(gtk3 alsa-lib libxkbfile nss)
options=(!strip)
source_x86_64=("https://dl3.xmind.net/XMind-for-Linux-amd-64bit-${_pkgver}.deb")
sha256sums_x86_64=('fef372511e3b6390f9125dfc4ed50d5c6a0a87e8e1d27728b1655dbc582ba0e5')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -d "$pkgdir/usr/bin"
  ln -s /opt/XMind/xmind "$pkgdir/usr/bin/xmind"
}
