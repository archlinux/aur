# Maintainer: lainme <lainme993@gmail.com>
# Modified from latex-beamer pkgbuild by Daniel Ehlers <danielehlers@mindeye.net>

pkgname=latex-beamer-ctan
pkgver=3.36
pkgrel=1
pkgdesc='A LaTeX class for creating slides for presentations. CTAN package'
arch=('any')
url='http://bitbucket.org/rivanvx/beamer/wiki/Home'
license=('GPL')
depends=('texlive-core')
conflicts=('latex-beamer','latex-beamer-hg')
install='latex-beamer-ctan.install'
source=("http://mirror.ctan.org/macros/latex/contrib/beamer.zip")
md5sums=('dcaecc8caa113ba7ccfd7eee48c264a6')

package() {
  cd beamer
  
  install -d ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer

  cp -r * ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer
}
