# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Federico Giuliani <federico.giuliani86@gmail.com>

pkgname=texlive-europecv
pkgver=2018.09.02
pkgrel=1
pkgdesc='Unofficial class for European curricula vitæ'
arch=('any')
url='http://www.ctan.org/tex-archive/macros/latex/contrib/europecv/'
license=('GPL')
depends=('texlive-latexextra')
source=("https://github.com/gsilano/EuropeCV/archive/"$pkgver".zip")
sha256sums=('b66a3179905100f9395da7d55e8a11c02c6c80d4384b359e18f423e32b595df5')

package() {
  install -d -- "$pkgdir"/usr/share/texmf/tex/latex
  cp -r EuropeCV-"$pkgver" -- "$pkgdir"/usr/share/texmf/tex/latex
}
