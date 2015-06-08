# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=beamerthemeprogressbar
pkgver=0.42
pkgrel=5
pkgdesc='an alternative theme for latex beamer'
arch=('any')
url='http://recherche.noiraudes.net/fr/LaTeX.php'
license=('GPL2')
depends=('texlive-latexextra' 'texlive-bibtexextra')
install=${pkgname}.install
source=(http://www.noiraudes.net/svn/progressbar/${pkgname}.tar.gz)
md5sums=('7afe1ad21c5cc18dbf953f1b3d5d6dd3')

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
