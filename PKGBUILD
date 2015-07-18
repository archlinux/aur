# Author: Ypnose <linuxienATlegtuxDOTorg>
# Maintainer: Ypnose <linuxienATlegtuxDOTorg>

pkgname=envypn-font
pkgver=1.7
pkgrel=2
pkgdesc="Readable bitmap font inspired by Envy Code R"
url="http://ywstd.fr/me/#envypn"
arch=('any')
license=('custom:MirOS License')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install='envypn-font.install'
changelog='envypn-font.changelog'
source=("http://files.ywstd.fr/p/envypn-font/${pkgname}-${pkgver}.tar.gz")
md5sums=('3a633265baf586087d7dad5ec2361a68')
sha256sums=('f8ec617d2a5fa914e7f17f128eaa494e1877ec3dbb96244b31b48c3071c524f2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "{$pkgdir}/usr/share/fonts/envypn"
  install -m644 *.pcf.gz "{$pkgdir}/usr/share/fonts/envypn"
  install -m644 "fonts.alias" "{$pkgdir}/usr/share/fonts/envypn/fonts.alias"
  install -Dm644 "LICENSE" "{$pkgdir}/usr/share/licenses/envypn/LICENSE"
  install -Dm644 "README" "{$pkgdir}/usr/share/doc/envypn/README"
}

