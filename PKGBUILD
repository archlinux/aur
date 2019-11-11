# Maintainer: Federico Giuliani <federico.giuliani86@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=texlive-europecv
pkgver=2019.03.19
pkgrel=1
pkgdesc='Unofficial class for European curricula vitæ'
arch=('any')
url='http://www.ctan.org/tex-archive/macros/latex/contrib/europecv/'
license=('GPL')
depends=('texlive-latexextra')
source=("https://github.com/gsilano/EuropeCV/archive/"$pkgver".zip")
sha256sums=('de6ed45b7e2db2c8e88a25cb8de5f60456a4d131fcbb0e58a51d22882c9f8277')

package() {
  install -d -- "$pkgdir"/usr/share/texmf/tex/latex
  cp -r EuropeCV-"$pkgver" -- "$pkgdir"/usr/share/texmf/tex/latex
}
