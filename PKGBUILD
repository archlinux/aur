# Contributor: Adria Arrufat <swiftscythe at gmail dot com>

pkgname=ttf-latex-xft-fonts
pkgver=0.1
pkgrel=1
pkgdesc="LaTeX ttf fonts needed by Abiword to display formulas"
arch=(any)
url="http://movementarian.org/"
license=(custom)
groups=()
depends=(fontconfig xorg-fonts-encodings xorg-font-utils)
install=$pkgname.install

source=("http://movementarian.org/latex-xft-fonts-${pkgver}.tar.gz")
sha1sums=('50edf35ff08354bdf08517add33e16ee37f769e9')

package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF/"
  cd ${srcdir}/latex-xft-fonts-${pkgver}
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
# vim:set ts=2 sw=2 et:
