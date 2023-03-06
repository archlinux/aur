# Maintainer: Felipe Balbi <felipe@balbi.sh>
pkgname=ttf-iosevka-comfy
_pkgmajor=1
_pkgminor=1
_pkgpatch=0
pkgver=${_pkgmajor}.${_pkgminor}.${_pkgpatch}
pkgrel=1
pkgdesc="Custom build of Iosevka with different style and metrics than the default."
arch=('any')
url="https://git.sr.ht/~protesilaos/iosevka-comfy"
license=('OFL')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~protesilaos/iosevka-comfy/archive/${pkgver}.tar.gz")
b2sums=('9685d45d32101674ec1bec0950ed65f0735bfc9ddcff3ee67b68dd1e07def19f1a76a6a0dc342a4d94772cb1aaa98ffd6e8391d91723ac0d65014bd5dd321246')

package() {
  # Create font directory
  install -d ${pkgdir}/usr/share/fonts/TTF/

  # Install all TTF variants
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-duo/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-fixed/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-motion-duo/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-motion-fixed/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-motion/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-duo/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-fixed/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF

  # Install license
  install -D -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
