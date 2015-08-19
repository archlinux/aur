# Maintainer: Gabriel B. Casella <gbc921@gmail.com>
# Contributor: Rafael Beraldo <rafaelluisberaldo@gmail.com>

pkgname=abntex2
pkgver=1.9.2
pkgrel=1
pkgdesc="a LaTeX class for writing ABNT-compliant documents"
arch=('i686' 'x86_64')
url="https://code.google.com/p/abntex2/"
license=('LPPL')
depends=('texlive-core')
source=("http://dl.bintray.com/laurocesar/generic/${pkgname}.tds-${pkgver}.tar.gz")
conflicts=('texlive-publishers')
sha1sums=('6a927c384d1afdb0c3b917a292c4d1c5847118e5')

install=abntex2.install

package() {
  install -dm755 "${pkgdir}/usr/share/texmf-dist/"

  for subdir in tex doc bibtex ; do
    cp -r "${srcdir}/${subdir}" "${pkgdir}/usr/share/texmf-dist/"
  done
}

# vim:set ts=2 sw=2 et:
