# $Id: PKGBUILD 119577 2011-04-12 14:21:49Z eric $
# Maintainer: Jérôme M. Berger <jerome.berger@sagemcom.com>

pkgname=abi-compliance-checker
pkgver=1.99.14
pkgrel=1
pkgdesc="Check ABI compatibility between library versions"
arch=('i686' 'x86_64')
url="http://ispras.linuxbase.org/index.php/ABI_compliance_checker"
license=('GPL')
depends=(gcc binutils perl)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/abi-compliance-checker/archive/${pkgver}.tar.gz)
md5sums=('e9c4575ea8433b957314caef99af4831')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr"
  perl Makefile.pl -install --prefix=/usr --destdir="${pkgdir}"
}
