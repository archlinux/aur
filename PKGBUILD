# Maintainer: Michael Riegert <michael at eowyn net>
# Contributer: Alexander Görtz <aur@nyloc.de>

pkgname=tex2im
pkgver=2.3
pkgrel=1
pkgdesc="A simple tool that converts LaTeX formulas into high resolution pixmap graphics for inclusion in text processors or presentations."
url="https://github.com/CD3/tex2im"
arch=('any')
license=('GPL2')
depends=('imagemagick' 'texlive-core' 'python')
provides=('im2tex')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('3cd69eabf1d37bd4c1fe534f6fe4a2bb27753ab903b4fdf891ba07d86b7da6f5')
install="${pkgname}.install"
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 tex2im "$pkgdir/usr/bin/tex2im"
    install -Dm755 im2tex "$pkgdir/usr/bin/im2tex"
}
