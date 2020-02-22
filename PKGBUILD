# Maintainer: Philipp Classen <philipp at posteo.de>
# Contributor: Arnaud Durand-Favreau <biginoz at FREE point FR>
# Previous maintainer: Bjoern Franke <bjo at nord-west.org>
pkgname=stapler
pkgver=1.0.0b1
pkgrel=1
pkgdesc="A small utility making use of the pypdf library to provide a (somewhat) lighter alternative to pdftk"
arch=('any')
url="https://github.com/hellerbarde/stapler"
license=('BSD')
depends=('python' 'python-pypdf2')
conflicts=('stapler-git')

source=("https://github.com/hellerbarde/stapler/archive/$pkgver.tar.gz")
sha256sums=('e272cf4117dff4ce01892d346111476fad67239a20ba4b9dd163c49e8ebbd67e')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -rv "${srcdir}/${pkgname}/"* "${pkgdir}/opt/${pkgname}"
  install -d ${pkgdir}/usr/bin
  ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
