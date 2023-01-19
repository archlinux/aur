# Maintainer: bacteriostat <dev dot bacteriostat at aleeas dot com>
# Contributor: FabioLolix
# Contributor: archplayer
# Contributor: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

pkgname=xmind
_pkgver=22.11.3656
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=(x86_64)
url="https://www.xmind.net"
license=(unknown)
depends=(gtk3 alsa-lib libxkbfile nss)
options=(!strip)
source_x86_64=("https://dl3.xmind.net/Xmind-for-Linux-amd64bit-${_pkgver}.deb")
sha256sums_x86_64=('b2cbf5e757e6f51bb45ffbf864250409896b02633f2d0570584aa298677d3c05')

package() {
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -d "$pkgdir/usr/bin"
  ln -s /opt/Xmind/xmind "$pkgdir/usr/bin/xmind"
}
