# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=rain-bin
pkgver=1.8.1
pkgrel=1
pkgdesc='A development workflow tool for working with AWS CloudFormation'
arch=('x86_64')
url="https://github.com/aws-cloudformation/rain"
license=('Apache-2.0')
provides=('rain')
conflicts=('rain')
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_linux-amd64.zip")
sha256sums=('9faf1ed458f30cee884afff6d0afaabd3ffd2456d082048e7d1b15671cedbea2')

package() {
  cd "${pkgname%-bin}-v${pkgver}_linux-amd64"
  install -Dm755 ${pkgname%-bin} "$pkgdir"/usr/bin/${pkgname%-bin}
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
