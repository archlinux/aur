# Plase submit changes to the git repository
# https://github.com/masterkorp/pkgbuilds

# Maintainer: Alfredo Palhares <masterkorp@gmail.com>
# Contributor: Martin Kumm <pluto@ls68.de>

pkgname=texlive-gantt
pkgver=1.3
pkgrel=2
license=('GPL')
depends=('texlive-core' 'texlive-latexextra')
pkgdesc="A LaTeX package for drawing gantt plots using pgf/tikz"
url="http://www.martin-kumm.de/tex_gantt_package.php"
arch=('any')
install=texlive-gantt.install
source=(http://www.martin-kumm.de/tex/gantt.sty)
md5sums=('e942191eb0024633155aa3188b4bbc06')

build()
{
	mkdir -p $pkgdir/usr/share/texmf/tex/latex/gantt
	cp $srcdir/gantt.sty $pkgdir/usr/share/texmf/tex/latex/gantt
}
