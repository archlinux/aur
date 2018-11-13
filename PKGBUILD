# Maintainer: Federico Giuliani <federico.giuliani86@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=texlive-europecv
pkgver=2018.10.15
pkgrel=1
pkgdesc='Unofficial class for European curricula vitæ'
arch=('any')
url='http://www.ctan.org/tex-archive/macros/latex/contrib/europecv/'
license=('GPL')
depends=('texlive-latexextra')
source=("https://github.com/gsilano/EuropeCV/archive/"$pkgver".zip")
sha256sums=('794ddb78d42118daf20f9d77523ca01234421ddba6bc36c60eb906128afb0770')

package() {
  install -d -- "$pkgdir"/usr/share/texmf/tex/latex
  cp -r EuropeCV-"$pkgver" -- "$pkgdir"/usr/share/texmf/tex/latex
}
