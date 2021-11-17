# Maintainer: rfvgyhn

pkgname=proton-usage-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Lists Steam applications that have specified a Steam Play compatibility tool"
arch=("x86_64")
url="https://github.com/rfvgyhn/proton-usage"
license=("MIT")
provides=("proton-usage")
conflicts=("proton-usage")
source=("https://github.com/rfvgyhn/proton-usage/releases/download/v$pkgver/proton-usage_v${pkgver}_linux-x64.tar.gz")
changelog=CHANGELOG.md
sha256sums=('fa6aac5364d9aa540b1cf39e348b6d74c3494e396572b8e9744bc2e33fd92592')

package() {
  cd "proton-usage_v${pkgver}_linux-x64"
  install -Dm0755 -t "$pkgdir/usr/bin/" proton-usage
}
