# Maintainer: Michael Riegert <michael at eowyn net>
# Contributer: Alexander Görtz <aur@nyloc.de>

pkgname=tex2im
pkgver=2.0.2
pkgrel=1
pkgdesc="A simple tool that converts LaTeX formulas into high resolution pixmap graphics for inclusion in text processors or presentations."
url="https://github.com/CD3/tex2im"
arch=('any')
license=('GPL2')
depends=('imagemagick' 'texlive-core' 'python')
provides=('im2tex')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('7bb49760c4c103e09c96b980857d008345b0eb8a8fd071881076175d69c46847')
install="${pkgname}.install"
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 tex2im "$pkgdir/usr/bin/tex2im"
    install -Dm755 im2tex "$pkgdir/usr/bin/im2tex"
}
