# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=tex2im
pkgver=1.8
pkgrel=1
pkgdesc="Tex2im is a simple tool that converts LaTeX formulas into high resolution pixmap graphics for inclusion in text processors or presentations."
url="http://www.nought.de/tex2im.php"
arch=('any')
license=('GPLv2')
depends=('imagemagick' 'texlive-bin')
source=(http://www.nought.de/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e97f771eacb4e4bd82476d1ee559f8aaa2f40bd93650895e766b37169d3006ee')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 tex2im "$pkgdir/usr/bin/tex2im"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
