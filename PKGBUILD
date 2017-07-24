# Contributor: noonov <noonov@gmail.com>

pkgname=ttf-mmcedar
pkgver=20101113a
pkgrel=6
pkgdesc="A combined font that uses Motoya L Cedar and M+ fonts"
url="http://www.geocities.jp/ep3797/modified_fonts_01.html"
license=('custom' 'APACHE')
arch=('any')
depends=('fontconfig')
source=(http://jaist.dl.osdn.jp/users/8/8844/mmcedar-${pkgver}.tar.lzma)
sha256sums=('1e9edf63bda2fa5e46e0c1dcb11a52095d7e81f37bf78a720ef24ed57feeb0a5')

package() {
  cd ${srcdir}/mmcedar-${pkgver}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF

  install -D -m644 doc-mplus/LICENSE_E \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING_MPLUS.txt
}
