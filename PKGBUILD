# Maintainer: Gabriel B. Casella <gbc921@gmail.com>
# Maintainer: Cassio Batista <cassio.batista.13@gmail.com>
# Contributor: Rafael Beraldo <rafaelluisberaldo@gmail.com>

pkgname=abntex2
pkgver=1.9.7
pkgrel=2
pkgdesc="a LaTeX class for writing ABNT-compliant documents"
arch=('i686' 'x86_64')
url="https://github.com/abntex/abntex2"
license=('LPPL')
depends=('texlive-core' 'texlive-latexextra')
source=("http://dl.bintray.com/laurocesar/generic/${pkgname}.tds-${pkgver}.tar.gz")
conflicts=('texlive-publishers')
sha1sums=('66b60932890ce5e680edb3a63866340491ec6da2')

install=abntex2.install

package() {
  install -dm755 "${pkgdir}/usr/share/texmf-dist/"

  for subdir in tex doc bibtex ; do
    cp -r "${srcdir}/${subdir}" "${pkgdir}/usr/share/texmf-dist/"
  done
}

# vim:set ts=2 sw=2 et:
