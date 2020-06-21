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
sha256sums=('a915d51d98ce5e1a0a1524805769b37f52c224584ef42a68685d7d32e59e49ec')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/sp0"
}
