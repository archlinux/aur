# Contributor Willy Reinhardt <dev at kurdy dot ch>

pkgname=r-sha3sum
pkgver=1.2.3.1
pkgrel=1
pkgdesc="Print or check SHA3 digests"
url=https://gitlab.com/kurdy/sha3sum
license=('GPL-3.0-or-later')
source=(${url}/-/archive/v${pkgver}/sha3sum-v${pkgver}.tar.gz)
sha256sums=('254558e4c3383dd85a764ae0045c7509ca8cfeef6a768ee38e44582af2d0a7ea')
arch=(x86_64)
makedepends=(rust)
conflicts=(sha3sum)

package() {
  cd sha3sum-v$pkgver
  cargo install --no-track --locked --root "$pkgdir/usr/" --path .
}
