# Maintainer: Stunts <stunts AT pinamartins DOT com>
pkgname=instruct
_up_pkgname=InStruct
_commit=9a420b8625d666c9f491e0db935d4268e081a5ef
pkgver=20160723
pkgrel=1
pkgdesc="Using multi-locus genotype data to infer pop. structure and self-fertilization rates"
arch=('i686' 'x86_64')
url="http://cbsuapps.tc.cornell.edu/InStruct.aspx"
license=('GPL3')

source=(https://github.com/slowkoni/${_up_pkgname}/archive/${_commit}.zip)
sha256sums=('196edb5cedd4661b16f61c59e7c5b400077141217d77de57a6a33c4ffa412087')

build() {
  cd ${srcdir}/${_up_pkgname}-${_commit}
  make
}

package() {
  #create necessary dirs
  mkdir -p "${pkgdir}/usr/bin"

  #copy core program file
  cp ${srcdir}/${_up_pkgname}-${_commit}/${_up_pkgname} ${pkgdir}/usr/bin

}
# vim:set ts=2 sw=2 et:
