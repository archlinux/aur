# Maintainer: Benjamin Chrétien <chretien at lirmm dot fr>
pkgname=git-latexdiff
pkgver=1.1.4
pkgrel=1
pkgdesc="Simple but very convenient wrapper around Git and latexdiff"
arch=('any')
url="https://gitlab.com/git-latexdiff/git-latexdiff"
license=('GPL')
depends=('texlive-core' 'texlive-bin' 'git')
source=("v${pkgver}.tar.gz"::"https://gitlab.com/${pkgname}/${pkgname}/repository/archive.tar.gz?ref=v${pkgver}")
sha256sums=("ae91f6dce3c5fbc03d3a7647f2c7b8d6c3782a6446a4d93e1d2bd2fd4b1a0736")

package() {
  cd `ls -d ${srcdir}/git-latexdiff-v${pkgver}-*`

  install -m 755 -D git-latexdiff ${pkgdir}/usr/bin/git-latexdiff
}
# vim:set ts=2 sw=2 et:
