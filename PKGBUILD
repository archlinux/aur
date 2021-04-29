# Maintainer: Guoyi（"malacology"）<guoyizhang@malacology.net>
# Contributor: Guoyi（"malacology"）<guoyizhang@malacology.net>
# Contributor: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>

pkgname=gblocks-bin
_pkgname=Gblocks
pkgver=0.91b
pkgrel=1
pkgdesc="A program written in ANSI C language that eliminates poorly aligned\
 positions and divergent regions of an alignment of DNA or protein sequences"

url='http://molevol.cmima.csic.es/castresana/Gblocks.html'
arch=('x86_64')

license=('unknown')
makedepends=('wget')
depends=('glibc')

source=("http://molevol.cmima.csic.es/castresana/$_pkgname/${_pkgname}_Linux64_0.91b.tar.Z")
sha256sums=('SKIP')

package() {
  install -Dm755 ${_pkgname}_$pkgver/$_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  wget "https://github.com/starsareintherose/AUR_desktop/blob/main/Gblocks.desktop"
  mv Gblocks.desktop "${pkgdir}/usr/share/applications"
}
