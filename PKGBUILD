# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=supmover-bin
pkgver=2.5.1
pkgrel=1
pkgdesc="Shift timings and Screen Area of PGS/Sup subtitle"
arch=("x86_64")
url="https://github.com/MonoS/SupMover/"
license=("AGPL-3.0-only")
depends=(glibc gcc-libs)

source=("https://github.com/MonoS/SupMover/releases/download/v${pkgver}/supmover-linux.zip")

b2sums=("7ae16d58f9b070ef6eccda24842e116ba9d4b6e5988728885a17e37a07008f26130594bc0bf89ff4701bb8a31f3804e97e6852ed7ad840363069997fe446e572")

package() {
  install -D -m0755 "${srcdir}/supmover" "${pkgdir}/usr/bin/supmover"
}
