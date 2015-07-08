# $Id: PKGBUILD 119577 2011-04-12 14:21:49Z eric $
# Maintainer: Jérôme M. Berger <jerome.berger@sagemcom.com>

pkgname=abi-compliance-checker
pkgver=1.99.9
pkgrel=1
pkgdesc="Check ABI compatibility between library versions"
arch=('i686' 'x86_64')
url="http://ispras.linuxbase.org/index.php/ABI_compliance_checker"
license=('GPL')
depends=(gcc binutils perl)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/abi-compliance-checker/archive/${pkgver}.tar.gz)
md5sums=('a9163668236cae5e33c606f51c7f8173')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr"
  perl Makefile.pl -install --prefix=/usr --destdir="${pkgdir}"
}
