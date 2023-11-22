# Maintainer: Felipe Balbi <felipe@balbi.sh>
pkgname=ttf-iosevka-comfy
_pkgmajor=1
_pkgminor=4
_pkgpatch=0
pkgver=${_pkgmajor}.${_pkgminor}.${_pkgpatch}
pkgrel=1
pkgdesc="Custom build of Iosevka with different style and metrics than the default."
arch=('any')
url="https://git.sr.ht/~protesilaos/iosevka-comfy"
license=('OFL')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~protesilaos/iosevka-comfy/archive/${pkgver}.tar.gz")
b2sums=('abf174a9fab83201088cd07aca7660685b37ce865fabb8a5929449dff7df423c86fe13e1d00ea074e9e9f8724e444221486bc01c2f3d2fa0a6d8488690e47540')

package() {
  # Create font directory
  install -d ${pkgdir}/usr/share/fonts/TTF/

  # Install all TTF variants
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-fixed/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-duo/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-motion/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-motion-fixed/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-motion-duo/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-fixed/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-duo/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-motion/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-motion-fixed/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-motion-duo/ttf/*.ttf ${pkgdir}/usr/share/fonts/TTF

  # Install license
  install -D -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
