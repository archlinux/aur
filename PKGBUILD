# FTK Imager CLI, Copyright 2006-2012 AccessData (accessdata.com)
# Submitted by: David Hunter <archlinux at synackrst dot net>
# Maintained by: Jay M. <jskier at gmail dot com>
pkgname=ftkimager
pkgver=3.1.1
pkgrel=2
pkgdesc="Closed source binary CLI forensic imaging software by Access Data"
arch=('i686' 'x86_64')
url="http://accessdata.com/product-download"
license=('Commercial')
depends=("zlib" "openssl")
if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='64'
  md5sums=('c604300050bdd1c88e83951d4f222e4e')
elif [ "${CARCH}" = 'i686' ]; then
  ARCH='32'
  md5sums=('0a27829a261e8ab8c69846bfe40733')
fi
source=(https://ad-zip.s3.amazonaws.com/${pkgname}.${pkgver}_fedora${ARCH}.tar.gz)

package() {
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/${pkgname} ${pkgdir}/usr/bin
}

