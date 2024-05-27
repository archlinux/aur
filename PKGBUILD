# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=rain-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='A development workflow tool for working with AWS CloudFormation'
arch=('x86_64')
url="https://github.com/aws-cloudformation/rain"
license=('Apache-2.0')
provides=('rain')
conflicts=('rain')
source=("$pkgname-$pkgver.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_linux-amd64.zip")
sha256sums=('e4b718c34f8fc502104e8048e45c6a74f88ae4010640bab42a3e983e6ed84ca9')

package() {
  cd "${pkgname%-bin}-v${pkgver}_linux-amd64"
  install -Dm755 ${pkgname%-bin} "$pkgdir"/usr/bin/${pkgname%-bin}
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
