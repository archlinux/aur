# Maintainer: Nicolas Cornu <nicolac76@yahoo.fr>

pkgname=darshan-util
pkgver='3.3.0'
pkgrel='1'
pkgdesc="HPC I/O Characterization Tool"
arch=(any)
url="https://www.mcs.anl.gov/research/projects/darshan"
source=("ftp://ftp.mcs.anl.gov/pub/darshan/releases/darshan-${pkgver}.tar.gz")
sha512sums=('0e3c83a7b988279638f79fcfee9779077a6f798e506198e99417a8e02fbb76b5090955e8131a3544a7974732eb9332bebfd184ee35297efcada7ec9a79ebbd73')

build() {
  cd darshan-${pkgver}/darshan-util
  ./configure --prefix="/usr"
  make
}

package() {
  cd darshan-${pkgver}/darshan-util
  make install DESTDIR="${pkgdir}"
}
