# Maintainer: lainme <lainme993@gmail.com>
# Modified from latex-beamer pkgbuild by Daniel Ehlers <danielehlers@mindeye.net>

pkgname=latex-beamer-ctan
pkgver=3.41
pkgrel=1
pkgdesc='A LaTeX class for creating slides for presentations. CTAN package'
arch=('any')
url='http://bitbucket.org/rivanvx/beamer/wiki/Home'
license=('GPL')
depends=('texlive-core')
conflicts=('latex-beamer','latex-beamer-hg')
install='latex-beamer-ctan.install'
source=("http://mirror.ctan.org/macros/latex/contrib/beamer.zip")
DLAGENTS=("http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u")
md5sums=('41f0c90c23f5c807a585fb94ad3c223d')

package() {
  cd beamer

  install -d ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer

  cp -r * ${pkgdir}/usr/share/texmf-dist/tex/latex/beamer
}
