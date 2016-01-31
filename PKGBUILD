# Maintainer: Benjamin Chrétien <chretien at lirmm dot fr>
pkgname=git-latexdiff
pkgver=1.1.3
pkgrel=1
pkgdesc="Simple but very convenient wrapper around Git and latexdiff"
arch=('any')
url="https://gitlab.com/git-latexdiff/git-latexdiff"
license=('GPL')
depends=('texlive-core' 'texlive-bin' 'git')
source=("v${pkgver}.tar.gz"::"https://gitlab.com/${pkgname}/${pkgname}/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=("be38239bcecc4ab1587f09b78fed20029d8c1005d49cfc2478b0055c2bb787b4")

package() {
  cd `ls -d ${srcdir}/git-latexdiff-v${pkgver}-*`

  install -m 755 -D git-latexdiff ${pkgdir}/usr/bin/git-latexdiff
}
# vim:set ts=2 sw=2 et:
