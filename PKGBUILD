# Maintainer:
# Contributor: FabioLolix
# Contributor: archplayer
# Contributor: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

pkgname=xmind
_pkgver=12.0.3-202206261857
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=(x86_64)
url="https://www.xmind.net"
license=(unknown)
depends=(gtk3 alsa-lib libxkbfile nss)
options=(!strip)
source_x86_64=("https://dl3.xmind.net/XMind-for-Linux-amd64bit-${_pkgver}.deb")
sha256sums_x86_64=('faac34ad949d79f8b2691a6cccadc7b6e30e3f5a322674eabfecafb655674cd5')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -d "$pkgdir/usr/bin"
  ln -s /opt/XMind/xmind "$pkgdir/usr/bin/xmind"
}
