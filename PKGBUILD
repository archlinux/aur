# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
# Maintainer: SP0 Deploy <sp0-deploy@dellinger.dev>
pkgname="sp0-bin"
pkgver=0.1.2
pkgrel=1
pkgdesc='A cross-platform CLI Tool for requesting the Spotify Web API, with a focus on automation. '
arch=('x86_64')
options=(!strip)
url='https://github.com/JohnnyCrazy/Sp0'
license=('MIT')
provides=("sp0")
source=("${pkgname}-${pkgver}::https://github.com/JohnnyCrazy/sp0/releases/download/$pkgver/sp0-linux-x64")
sha256sums=('aaf9ddaeef2736b60e03503e58ea327625fdc7f964d90595bc0f3265851e4dec')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/sp0"
}
