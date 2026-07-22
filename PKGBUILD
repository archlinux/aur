# Maintainer: Nikita Goncharov <ininids@ininids.in.rs>
pkgname=nothypridle-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A Wayland idle management daemon written in Rust"
arch=('x86_64')
url="https://github.com/ininids/nothypridle"
license=('BSD-3-Clause')
depends=('wayland')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ininids/nothypridle/releases/download/v0.1.3/nothypridle-0.1.3-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('b1dccdc45c12941786d8163dc4122c7acd0d2aed3ceeacb7e905bc16544267d7')
package() {
  cd "${srcdir}"
  tar xzf "${pkgname}-${pkgver}.tar.gz"
  find . -name nothypridle -type f -exec install -Dm755 {} "${pkgdir}/usr/bin/nothypridle" \;
}
