# Maintainer: Bobby Burden III <bobby@brb3.org>
pkgname=pastify
pkgver=1.0.0
pkgrel=1
pkgdesc="A command line pastbin service helper"
arch=("any")
url="https://github.com/ryanmaynard/pastify"
license=("MIT")
depends=("curl")
makedepends=()
provides=("pastify")
source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/ryanmaynard/pastify/archive/v${pkgver}.tar.gz"
)
sha256sums=("aa17f4a40b68a2943d2a21f07ae888fca21f523a0df0db09c1df7608d5876ae1")

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "pastify.sh" "${pkgdir}/usr/bin/pastify"
}
