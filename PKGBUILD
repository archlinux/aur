# Maintainer: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Contributor: FabioLolix
# Contributor: archplayer
# Contributor: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

pkgname=xmind
_pkgver=22.11.2556
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=(x86_64)
url="https://www.xmind.net"
license=(unknown)
depends=(gtk3 alsa-lib libxkbfile nss)
options=(!strip)
source_x86_64=("https://dl3.xmind.net/Xmind-for-Linux-amd64bit-${_pkgver}.deb")
sha256sums_x86_64=('af0cd02fb4fbc789e400f9fe3f5dd7d8641bc336d433b42cc332122e637e9fb0')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -d "$pkgdir/usr/bin"
  ln -s /opt/Xmind/xmind "$pkgdir/usr/bin/xmind"
}
