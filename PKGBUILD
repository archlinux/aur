# Maintainer: Ivan Lisenkov <ivan@ivlis.com>
pkgname=mumax3
pkgver=3.9.3
pkgrel='1'
pkgdesc="GPU-accelerated micromagnetic simulation program"
arch=('x86_64')
url="http://mumax.github.io/"
license=('GPL')
depends=('cuda-7.5')
optdepends=('gnuplot: for fancy plots')
source=("https://github.com/mumax/3/releases/download/v$pkgver/mumax${pkgver}_linux_cuda7.5.tar.gz")
md5sums=('fbac69c0bcf40309a7f0bf61d9745228')


package() {
  mkdir -p ${pkgdir}/opt/mumax3/
  cp ${srcdir}/mumax3 ${pkgdir}/opt/mumax3 
}
