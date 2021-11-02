# Maintainer: rfvgyhn

pkgname=proton-usage-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Lists Steam applications that have specified a Steam Play compatibility tool"
arch=("x86_64")
url="https://github.com/rfvgyhn/proton-usage"
license=("MIT")
provides=("proton-usage")
conflicts=("proton-usage")
source=("https://github.com/rfvgyhn/proton-usage/releases/download/v$pkgver/proton-usage_v${pkgver}_linux-x64.tar.gz")
sha256sums=('c300f61904b19e3f67e2795b6ac4d219f41f82b4a2b091a853a9e9bb40b8e923')

package() {
  cd "proton-usage_v${pkgver}_linux-x64"
  install -Dm0755 -t "$pkgdir/usr/bin/" proton-usage
}
