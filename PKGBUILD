# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
# Maintainer: SP0 Deploy <sp0-deploy@dellinger.dev>
pkgname="sp0-bin"
pkgver=0.1.3
pkgrel=1
pkgdesc='A cross-platform CLI Tool for requesting the Spotify Web API, with a focus on automation. '
arch=('x86_64')
options=(!strip)
url='https://github.com/JohnnyCrazy/Sp0'
license=('MIT')
provides=("sp0")
source=("${pkgname}-${pkgver}::https://github.com/JohnnyCrazy/sp0/releases/download/$pkgver/sp0-linux-x64")
sha256sums=('819f16b480b3b249c04d2490f1884f47d454a845bbc593915b060bd5ee9ef0b4')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/sp0"
}
