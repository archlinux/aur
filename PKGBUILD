# Maintainer: Felipe Balbi <felipe@balbi.sh>
pkgname=ttf-iosevka-comfy
_pkgmajor=1
_pkgminor=2
_pkgpatch=0
pkgver=${_pkgmajor}.${_pkgminor}.${_pkgpatch}
pkgrel=1
pkgdesc="Custom build of Iosevka with different style and metrics than the default."
arch=('any')
url="https://git.sr.ht/~protesilaos/iosevka-comfy"
license=('OFL')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~protesilaos/iosevka-comfy/archive/${pkgver}.tar.gz")
b2sums=('8a04fe98aa522b58ed1df43401501db6925c1b007ec47e7fcc92cfb22f6f401666c14f845d93c8a6eb3865d36bef10e5b39073fb9de6aa31cd4e880236b0a054')

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
