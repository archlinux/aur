# $Id$
# Maintainer: Luiz Silveira <zertyz@gmail.com>
# based on the PKGBUILD from 'ttf-anonymous-pro' package

pkgname=ttf-thelinuxbox-fonts
pkgver=1.0
pkgrel=1
pkgdesc='A good selection of 6760 TTF fonts for artists, intended for creating eye-catching documents and graphics.'
arch=('any')
url='http://thelinuxbox.org'
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=('http://thelinuxbox.org/downloads/fonts/fonts.tar.gz')
md5sums=('ae567dc0c0e4e7eb579cc09d5f9e0955')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 downloadFonts/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

