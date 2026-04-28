# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=supmover-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Shift timings and Screen Area of PGS/Sup subtitle"
arch=("x86_64")
url="https://github.com/MonoS/SupMover/"
license=("AGPL-3.0-only")
depends=(glibc gcc-libs)

source=("https://github.com/MonoS/SupMover/releases/download/v${pkgver}/supmover-linux.zip")

b2sums=("88b734d80f76852473141be718a504004258c9cf2e273fc0a0c71721db7c5f6eebfbd1c31e43699f81e0f5cd5a8e4feb910f591f926866a3acb611e77a310de0")

package() {
  install -D -m0755 "${srcdir}/supmover" "${pkgdir}/usr/bin/supmover"
}
