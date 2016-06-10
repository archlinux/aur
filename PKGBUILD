# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=FiraCode
pkgname=otf-firacode
pkgver=1.102
pkgrel=1
pkgdesc="Monospaced font with programming ligatures"
arch=('any')
url="https://github.com/tonsky/FiraCode"
license=('custom:SIL Open Font License v1.1')
depends=('fontconfig' 'xorg-font-utils')
install=${pkgname}.install
# https://github.com/tonsky/FiraCode/archive/1.102.tar.gz
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('1f131945c5a71572a6442a252e457711425b660edb26a950efdc24dee1e7f94a')

package()
{
  install -D -m644 "${srcdir}/${_name}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 "${srcdir}/${_name}-${pkgver}/FiraCode-Bold.otf" \
    "${pkgdir}/usr/share/fonts/OTF/FiraCode-Bold.otf"

  install -D -m644 "${srcdir}/${_name}-${pkgver}/FiraCode-Light.otf" \
    "${pkgdir}/usr/share/fonts/OTF/FiraCode-Light.otf"

  install -D -m644 "${srcdir}/${_name}-${pkgver}/FiraCode-Medium.otf" \
    "${pkgdir}/usr/share/fonts/OTF/FiraCode-Medium.otf"

  install -D -m644 "${srcdir}/${_name}-${pkgver}/FiraCode-Regular.otf" \
    "${pkgdir}/usr/share/fonts/OTF/FiraCode-Regular.otf"

  install -D -m644 "${srcdir}/${_name}-${pkgver}/FiraCode-Retina.otf" \
    "${pkgdir}/usr/share/fonts/OTF/FiraCode-Retina.otf"
}

# vim:set ft=sh ts=2 sw=2 et:
