# Maintainer: Bobby Burden III <bobby@brb3.org>
pkgname=gitshort
pkgver=1.1.0
pkgrel=1
pkgdesc="CLI to create a short or vanity url with git.io"
arch=("any")
url="https://github.com/ryanmaynard/gitshort"
license=("MIT")
depends=("curl")
makedepends=()
provides=("gitshort")
source=(
"${pkgname}-${pkgver}.tar.gz::https://github.com/ryanmaynard/gitshort/archive/v${pkgver}.tar.gz"
)
sha256sums=("4b7c4831d4010f88993fd7268b868f1d3f1b9f3f45434382915d67e5b17f30b5")

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "gitshort.sh" "${pkgdir}/usr/bin/gitshort"
}
