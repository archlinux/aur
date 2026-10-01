# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=supmover-bin
pkgver=2.5.2
pkgrel=1
pkgdesc="Shift timings and Screen Area of PGS/Sup subtitle"
arch=("x86_64")
url="https://github.com/MonoS/SupMover/"
license=("AGPL-3.0-only")
depends=(glibc gcc-libs)

source=("https://github.com/MonoS/SupMover/releases/download/v${pkgver}/supmover-linux.zip")

b2sums=("2658904d918c54c055993d6640d76f0359297526bfbede19233ae0c38c0302476564163ac3da541331ac3eaf8de7234c75e98ce48a694896ccb17a0e4bf9a9cf")

package() {
  install -D -m0755 "${srcdir}/supmover" "${pkgdir}/usr/bin/supmover"
}
