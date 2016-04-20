# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org> and Mathieu Pasquet <mathieui> <mathieuivi@gmaail.com>
pkgname=pkpgcounter
pkgver=3.50
pkgrel=2
arch=('any')
license=('GPL')
pkgdesc="Generic Page Description Language parser"
depends=('python2' 'setuptools' 'python2-pillow')
source=("http://www.pykota.com/software/${pkgname}/download/tarballs/${pkgname}-${pkgver}.tar.gz")
url="http://www.pykota.com"
md5sums=('564dd96e8a5433564c2e39319e65217e')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir} || return 1
}
