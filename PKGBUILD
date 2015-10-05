# Original author: Josiah Schwab <jschwab at gmail dot com>
# Maintainer: Josiah Schwab <jschwab at gmail dot com>

pkgname=texlive-emulateapj
pkgdesc="A LaTeX2e class to emulate the Astrophysical Journal (ApJ) page layout"
pkgver=20150123
pkgrel=1
arch=('i686' 'x86_64')
url="http://hea-www.cfa.harvard.edu/~alexey/emulateapj/"
depends=('texlive-core')
provides=('texlive-emulateapj')
install=texlive-emulateapj.install
source=('http://hea-www.harvard.edu/~alexey/emulateapj/emulateapj.cls')
sha1sums=('1a44ba9c00398015d89d2f7b26dc2e37d22e0816')

package() {

  # an older version ships in texlive-latexextra
  # which is installed to /usr/share/texmf-dist/tex/latex/emulateapj/

  install -Dm644 emulateapj.cls $pkgdir/usr/share/texmf/tex/latex/emulateapj/emulateapj.cls

}
