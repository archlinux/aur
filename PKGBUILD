# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# vim:set ts=2 sw=2 et:

pkgname=latex-template-acmart
pkgver=1.35
pkgrel=1
pkgdesc="Official 2017 ACM Master article template, consolidating 8 individual ACM journal and ACM Proceedings"
arch=('any')
url="http://www.acm.org/publications/authors/submissions"
license=('')
depends=('texlive-latex3')
install=texlive.install
source=(http://mirrors.ctan.org/macros/latex/contrib/acmart.zip)

package() {
  mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/
  cp -r ${srcdir}/acmart ${pkgdir}/usr/share/texmf-dist/tex/latex/
}

md5sums=('51e1b2e57e567d7e6abe4cd3a37c040d')
