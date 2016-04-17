# Author: Ypnose <linuxienATlegtuxDOTorg>
# Maintainer: Ypnose <linuxienATlegtuxDOTorg>

pkgname=envypn-font
pkgver=1.7.1
pkgrel=1
pkgdesc="Readable bitmap font inspired by Envy Code R"
url="http://ywstd.fr/me/#envypn"
arch=('any')
license=('custom:MirOS License')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install='envypn-font.install'
source=("http://files.ywstd.fr/p/envypn-font/${pkgname}-${pkgver}.tar.gz")
md5sums=('976ceda01018d3b109a735daf4e8af95')
sha256sums=('bda67b6bc6d5d871a4d46565d4126729dfb8a0de9611dae6c68132a7b7db1270')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/fonts/envypn"
  install -m644 *.pcf.gz "${pkgdir}/usr/share/fonts/envypn"
  install -m644 "fonts.alias" "${pkgdir}/usr/share/fonts/envypn/fonts.alias"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/envypn/LICENSE"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/envypn/README"
}


