# Maintainer: Nicolas Cornu <nicolac76@yahoo.fr>

pkgname=darshan-util
pkgver='3.3.1'
pkgrel='1'
pkgdesc="HPC I/O Characterization Tool"
arch=(any)
url="https://www.mcs.anl.gov/research/projects/darshan"
source=("ftp://ftp.mcs.anl.gov/pub/darshan/releases/darshan-${pkgver}.tar.gz")
sha512sums=('85b97e08be3b25c69bd6445862b5e8d2db5f0e92e5a69e98f55d02dec93a007a10155176da7f005504dd5bb40ae2af17e14d24840a6c1ee6bf5e26ea00027f8d')

build() {
  cd darshan-${pkgver}/darshan-util
  ./configure --prefix="/usr"
  make
}

package() {
  cd darshan-${pkgver}/darshan-util
  make install DESTDIR="${pkgdir}"
}
