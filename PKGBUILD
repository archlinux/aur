# Maintainer: Leonardo Amaral <aur at leonardoamaral dot com dot br>
# Based on work of Estela <i at estela dot moe> at atkinson-hyperlegible-next

pkgbase=lexica-ultralegible
pkgname=(otf-${pkgbase} ttf-${pkgbase})
pkgver=1.0.0
pkgrel=1
pkgdesc='Lexica Ultralegible builds on the foundation laid by Atkinson Hyperlegible.'
arch=(any)
url=https://github.com/jacobxperez/lexica-ultralegible
license=(OFL)
source=("https://github.com/jacobxperez/lexica-ultralegible/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b9081bf92966461a1d6ac7db1d02c0c3133c73ddc233d38af854f59f50566e86')

package_otf-lexica-ultralegible() {
  cd "$srcdir/${pkgbase}-${pkgver}"
  install -Dm0644 -t "${pkgdir}/usr/share/fonts/OTF/" fonts/otf/*.otf
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.txt
}

package_ttf-lexica-ultralegible() {
  cd "$srcdir/${pkgbase}-${pkgver}"
  install -Dm0644 -t "${pkgdir}/usr/share/fonts/TTF/" fonts/ttf/*.ttf
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.txt
}
