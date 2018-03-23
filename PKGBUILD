# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: frabjous <klement at philos dot umass edu>
pkgname=vim-live-latex-preview
pkgver=0.9
pkgrel=1
pkgdesc="Vim plugin and helper scripts to provide a live-updating PDF preview of LaTeX documents with MuPDF"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=107164"
license=('GPL')
depends=('texlive-core' 'vim' 'xdotool' 'mupdf')
source=(http://the21stcenturymonads.net/misc/${pkgname}-${pkgver}.tar.gz)
md5sums=('3a1d506673ba6c5556d502c0c9d4cdb3')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/share/vim/vimfiles/ftplugin/tex/
  install -m 644 *.vim "${pkgdir}"/usr/share/vim/vimfiles/ftplugin/tex/
  install -m 644 *.txt "${pkgdir}"/usr/share/vim/vimfiles/ftplugin/tex/
  install -d "${pkgdir}"/usr/bin/
  install -D -m 755 *.sh "${pkgdir}"/usr/bin/
}

# vim:set ts=2 sw=2 et:
