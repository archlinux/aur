# Maintainer: Nicolas Cornu <nicolac76@yahoo.fr>

pkgname=darshan-util
pkgver='3.2.1'
pkgrel='1'
pkgdesc="HPC I/O Characterization Tool"
arch=(any)
url="https://www.mcs.anl.gov/research/projects/darshan"
source=("ftp://ftp.mcs.anl.gov/pub/darshan/releases/darshan-${pkgver}.tar.gz")
sha512sums=('565fd8b3305efc42454ebbe7c64e1eb486d29086bae53f81bb42f504b1966376908b59f86367025c78b57a458e8d8b18bf7dbe80ccec87743287796a3b3cc9f7')

build() {
  cd darshan-${pkgver}/darshan-util
  ./configure --prefix="/usr"
  make
}

package() {
  cd darshan-${pkgver}/darshan-util
  make install DESTDIR="${pkgdir}"
}
