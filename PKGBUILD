# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=texlive-europecv
pkgver=20140627
pkgrel=1
pkgdesc='Unofficial class for European curricula vitæ'
arch=('any')
url='http://www.ctan.org/tex-archive/macros/latex/contrib/europecv/'
license=('GPL')
depends=('texlive-latexextra')
source=("europecv-${pkgver}.zip"::"http://mirror.ctan.org/macros/latex/contrib/europecv.zip")
sha256sums=('8774724fa20744777d2ce7275024f5969b0cdd09684033949b833410c45112d5')

package() {
  install -d -- "$pkgdir"/usr/share/texmf/tex/latex
  cp -r europecv -- "$pkgdir"/usr/share/texmf/tex/latex
}
