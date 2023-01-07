# Maintainer: Federico Giuliani <federico.giuliani86@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=texlive-europecv
pkgver=2022.08.03
pkgrel=1
pkgdesc='Unofficial class for European curricula vitæ'
arch=('any')
url='http://www.ctan.org/tex-archive/macros/latex/contrib/europecv/'
license=('GPL')
depends=('texlive-latexextra')
source=("https://github.com/gsilano/EuropeCV/archive/"$pkgver".zip")
sha256sums=('a0d7812b615662906f8f127766449ebe5d5f98efe95c2860627124c8adc200b2')

package() {
  install -d -- "$pkgdir"/usr/share/texmf/tex/latex
  cp -r EuropeCV-"$pkgver" -- "$pkgdir"/usr/share/texmf/tex/latex
}
