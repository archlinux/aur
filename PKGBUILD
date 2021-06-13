# Maintainer: Federico Giuliani <federico.giuliani86@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=texlive-europecv
pkgver=2021.05.09
pkgrel=1
pkgdesc='Unofficial class for European curricula vitæ'
arch=('any')
url='http://www.ctan.org/tex-archive/macros/latex/contrib/europecv/'
license=('GPL')
depends=('texlive-latexextra')
source=("https://github.com/gsilano/EuropeCV/archive/"$pkgver".zip")
sha256sums=('c4fd5ac6d37601ba75d5931d9b1128984f4eddb7183efcefd1640d621451bacf')

package() {
  install -d -- "$pkgdir"/usr/share/texmf/tex/latex
  cp -r EuropeCV-"$pkgver" -- "$pkgdir"/usr/share/texmf/tex/latex
}
