# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
# Maintainer: SP0 Deploy <sp0-deploy@dellinger.dev>
pkgname="sp0-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc='A cross-platform CLI Tool for requesting the Spotify Web API, with a focus on automation. '
arch=('x86_64')
url='https://github.com/JohnnyCrazy/Sp0'
license=('MIT')
provides=("sp0")
source=("${pkgname}-${pkgver}::https://github.com/JohnnyCrazy/sp0/releases/download/$pkgver/sp0-linux-x64")
sha256sums=('66e401380fe68d3c677a31cb2a2f0b80e282f0e367c42646f4ce10ea8ec6388d')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/sp0"
}
