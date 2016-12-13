# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=beamerthemeprogressbar
pkgver=0.42
pkgrel=7
pkgdesc='an alternative theme for latex beamer'
arch=('any')
url='http://recherche.noiraudes.net/fr/LaTeX.php'
license=('GPL2')
depends=('texlive-latexextra' 'texlive-bibtexextra')
install=${pkgname}.install
source=(http://recherche.noiraudes.net/resources/LaTeX/svn/${pkgname}.tar.gz)
md5sums=('a607323522b8ea8504f436c500130e2f')

package() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer/themes/{color,font,inner,outer,theme}
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer/art/images
  cd ${srcdir}

  install -m644 beamerthemeprogressbar.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/
  install -m644 beamercolorthemeprogressbar.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/
  install -m644 beamerfontthemeprogressbar.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/font/
  install -m644 beamerouterthemeprogressbar.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/outer/
  install -m644 beamerinnerthemeprogressbar.sty $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/inner/
  install -m644 images/tree04.jpg $pkgdir/usr/share/texmf-dist/tex/latex/beamer/art/images/
}

# vim:set ts=2 sw=2 et:
