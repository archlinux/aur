# Maintainer: spaceships <https://aur.archlinux.org/account/spaceships>
# Contributor: Brent Carmer <bcarmer@gmail.com>

pkgname=texlive-kbordermatrix
pkgver=1
pkgrel=1
license=('GPL')
depends=('texlive-core' 'texlive-latexextra')
pkgdesc='A LaTeX package for drawing matrices.'
url='http://www.martin-kumm.de/tex_gantt_package.php'
arch=('any')
install=texlive-kbordermatrix.install
source=('http://people.hss.caltech.edu/~kcb/TeX/kbordermatrix.sty')
sha512sums=('5e418f86a8fdae08717cf9559ec3857fcda6a92a73e85dcb7f5e144a398be81e2ea9b5711b3784028736a775c33440e96df0276fff824c295822eab570a2c3e0')

package() {
    mkdir -p $pkgdir/usr/share/texmf/tex/latex/kbordermatrix
    cp $srcdir/kbordermatrix.sty $pkgdir/usr/share/texmf/tex/latex/kbordermatrix
}
