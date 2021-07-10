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
depends=('glibc')

source=("https://github.com/starsareintherose/${_pkgname}/releases/download/${pkgver}/${_pkgname}_${pkgver}.zip" "gblocks.desktop")
sha256sums=('338b2a48b03b0a53242e9bf6804c8f998b3891ca7cfb23cef39ce88d8496e353'
            '1a523d8159873b8541aabb7f2f19af2de4dc3b61cf6974eec71aae2288d02b14')

package() {
  install -Dm755 ${_pkgname}_$pkgver/$_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/gblocks.desktop" "${pkgdir}/usr/share/applications/gblocks.desktop"
}
