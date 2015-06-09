# Maintainer: Stunts <f DOT pinamartins AT gmail DOT com>
pkgname=instruct
_up_pkgname=InStruct
pkgver=20090404
pkgrel=1
pkgdesc="Program for using multi-locus genotype data to investigate population structure, and self-fertilization rates."
arch=('i686' 'x86_64')
url="http://cbsuapps.tc.cornell.edu/InStruct.aspx"
license=('Non-commercial')

source=(ftp://cbsuftp.tc.cornell.edu/BioHPC/var/${_up_pkgname}_sources.zip)
md5sums=('644642a1a732fcdf00647b784f468b75')

build() {
  cd ${srcdir}
  make
}

package() {
  #create necessary dirs
  mkdir -p "${pkgdir}/usr/bin"

  #copy core program file
  cp ${srcdir}/${_up_pkgname} ${pkgdir}/usr/bin

}
# vim:set ts=2 sw=2 et:
