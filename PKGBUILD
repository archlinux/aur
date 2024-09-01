# Maintainer: Felipe Balbi <felipe@balbi.sh>
pkgname=ttf-iosevka-comfy
_pkgmajor=2
_pkgminor=0
_pkgpatch=0
pkgver=${_pkgmajor}.${_pkgminor}.${_pkgpatch}
pkgrel=1
pkgdesc="Custom build of Iosevka with different style and metrics than the default."
arch=('any')
url="https://git.sr.ht/~protesilaos/iosevka-comfy"
license=('OFL')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/protesilaos/iosevka-comfy/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('87b74f5bc6a92d506cc295c460636ae438335be7d81b172fcd1fe1389f281c0f387694af1d06279eb6234e7ba0f1b4b2c15e029949e3a1961818b568a3370b2d')

package() {
  # Create font directory
  install -d ${pkgdir}/usr/share/fonts/TTF/

  # Install all TTF variants
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-duo/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-fixed/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-motion/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-motion-duo/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-motion-fixed/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-duo/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-fixed/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF

  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-motion/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-motion-duo/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF
  install -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/iosevka-comfy-wide-motion-fixed/TTF/*.ttf ${pkgdir}/usr/share/fonts/TTF

  # Install license
  install -D -m644 "${srcdir}"/iosevka-comfy-"${pkgver}"/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
