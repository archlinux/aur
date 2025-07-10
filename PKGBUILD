# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=rain-bin
pkgver=1.23.1
pkgrel=1
pkgdesc='A development workflow tool for working with AWS CloudFormation'
arch=('x86_64')
url="https://github.com/aws-cloudformation/rain"
license=('Apache-2.0')
provides=('rain')
conflicts=('rain')
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_linux-amd64.zip")
sha256sums=('b39428030da7e17f6db2d3926882ae4e98b7bc0892eb2f38e1d83c334b09b077')

package() {
  cd "${pkgname%-bin}-v${pkgver}_linux-amd64"
  install -Dm755 ${pkgname%-bin} "$pkgdir"/usr/bin/${pkgname%-bin}
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
