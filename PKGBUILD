# Maintainer: darehanl <darehanl@150mail.com>

pkgname=ttf-nanum
pkgver=2018
pkgrel=1
pkgdesc="Nanum series TrueType fonts"
arch=('any')
url="http://hangeul.naver.com/"
license=('custom:OFL')
_filename=NanumFontSetup_TTF_ALL.zip
source=("http://appdown.naver.com/naver/font/NanumFont/setup/$_filename")
sha256sums=('c7584eb9ee521f106cfbf8c893fc6400ca43c66385ab39c3ab6abc89586ee7fb')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}"/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

