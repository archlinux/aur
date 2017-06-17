# $Id: PKGBUILD 119577 2011-04-12 14:21:49Z eric $
# Maintainer: Jérôme M. Berger <jerome.berger@sagemcom.com>

pkgname=abi-compliance-checker
pkgver=2.1
pkgrel=1
pkgdesc="Check ABI compatibility between library versions"
arch=('i686' 'x86_64')
url="https://lvc.github.io/abi-compliance-checker/"
license=('GPL')
depends=(gcc binutils perl)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/lvc/abi-compliance-checker/archive/${pkgver}.tar.gz)
md5sums=('05cce2707b1788382b8eecc84572fbd9')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr"
  perl Makefile.pl -install --prefix=/usr --destdir="${pkgdir}"
}
