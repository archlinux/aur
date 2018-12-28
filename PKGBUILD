# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=I.Ming
_gitcommit=a3ebddb13de4204d0c39df2946a3b58f9e762e60

pkgname=ttf-i.ming
pkgver=6.00+1+a3ebddb
pkgrel=1
pkgdesc="An old-style CJK font"
url="https://github.com/ichitenfont/I.Ming"
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
license=('custom')
source=("git+${url}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_srcname}"

  install -D -m644 6.00/I.Ming-6.00.ttf "${pkgdir}/usr/share/fonts/TTF/I.Ming-6.00.ttf"
  install -D -m644 6.00/I.MingVar-6.00.ttf "${pkgdir}/usr/share/fonts/TTF/I.MingVar-6.00.ttf"

  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 6.00/I.Ming_readme.md "${pkgdir}/usr/share/doc/${pkgname}/I.Ming_readme.md"
  install -D -m644 6.00/I.Ming_history.md "${pkgdir}/usr/share/doc/${pkgname}/I.Ming_history.md"
  install -D -m644 6.00/I.MingVar_history.md "${pkgdir}/usr/share/doc/${pkgname}/I.MingVar_history.md"

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -D -m644 6.00/IPA_Font_License_Agreement_v1.0.txt \
      "${pkgdir}/usr/share/licenses/${pkgname}/IPA_Font_License_Agreement_v1.0.txt"
}
