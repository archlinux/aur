# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-meguri
pkgver=20101113a
pkgrel=6
pkgdesc="Modified IPA and M+ fonts for Japanese"
arch=('any')
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
license=('custom')
depends=('fontconfig')
source=(http://jaist.dl.osdn.jp/users/8/8848/meguri-fonts-${pkgver}.tar.lzma)
sha256sums=('77599ce97a2ead6e7aa714d05855c790ed4664e88fc79cf6eab9c579eb2e1c09')

package() {
  cd ${srcdir}/meguri-fonts-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 docs-ipa/IPA_Font_License_Agreement_v1.0.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_IPA.txt
}
