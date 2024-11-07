# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=supmover-bin
pkgver=2.4.2
pkgrel=1
pkgdesc="Shift timings and Screen Area of PGS/Sup subtitle"
arch=("x86_64")
url="https://github.com/MonoS/SupMover/"
license=("AGPL-3.0-only")
depends=(glibc gcc-libs)

source=("https://github.com/MonoS/SupMover/releases/download/v${pkgver}/SupMover-linux")

b2sums=("adffbf47d91967eea51ff3a54c5b7b780385d8bead36e00d3da2ffb72e17518b451133973d2fe8614d8bc63d571bd4b4eb75d1bcbbb971627f6a037cd7560139")

package() {
  install -D -m0755 "${srcdir}/SupMover-linux" "${pkgdir}/usr/bin/SupMover"
}
