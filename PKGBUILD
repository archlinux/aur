# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Alfredo Palhares <masterkorp@gmail.com>
# Contributor: Martin Kumm <pluto@ls68.de>

pkgname=texlive-gantt
pkgver=1.3
pkgrel=3
license=('GPL')
depends=('texlive-core' 'texlive-latexextra')
pkgdesc='A LaTeX package for drawing gantt plots using pgf/tikz'
url='http://www.martin-kumm.de/tex_gantt_package.php'
arch=('any')
source=('http://www.martin-kumm.de/tex/gantt.sty')
sha256sums=('fb62a18c664f4e039775b97705e34e0a374043fe3b3bcaea94318496aadd2a73')

package() {
  mkdir -p $pkgdir/usr/share/texmf/tex/latex/gantt
  cp $srcdir/gantt.sty $pkgdir/usr/share/texmf/tex/latex/gantt
}
