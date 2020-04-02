pkgname=ttf-porcelain
pkgver=1.0.2
pkgrel=1
pkgdesc='A handwritten font'
arch=('any')
license=('custom:SIL Open Font License v1.1')
depends=()
conflicts=()
source=('Porcelain.ttf::https://github.com/ptcar2009/ttf-porcelain/raw/master/Porcelain.ttf')
sha256sums=('118fed9862e016c292b8843d0572988179548b8c3f7bcc79fc25e9c097b123a0')
package() {
  install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
  install -m 644  "Porcelain.ttf"  "${pkgdir}/usr/share/fonts/TTF/Porcelain.ttf"
}
