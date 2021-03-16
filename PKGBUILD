# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ttf-cmu-typewriter
pkgver=1.0
pkgrel=2
pkgdesc="A typewriter-style slab serif font."
arch=('any')
url="https://fontlibrary.org/en/font/cmu-typewriter"
license=('custom:OFL')
makedepends=('unzip')
source=("${pkgname}-${pkgver}.zip::https://fontlibrary.org/assets/downloads/cmu-typewriter/b6d120f7029a2f8b50af39054e05f1ef/cmu-typewriter.zip")
sha512sums=('288e41518321779f89e1cadcb7648b8e1960b0711a590a96cb22990d76276dbc84b9d11064eb8a8df2b424364d9c23cc1f6681e3d1d00de1e06003c9b5bfe70e')
b2sums=('eeb43f607525952ff57397b1045e53fb26e3c1beb1fd48ba029d604a71133a3ee9b54c5babc2eb7798f29b940c833117622937da3eb48ccf093b760bf3fcbd9c')

package() {
  install -vDm 644 Typewriter*/*.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
  install -vDm 644 Typewriter/OFL.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm 644 Typewriter/README.txt \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
