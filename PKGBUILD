# Maintainer: zaeyee <zaeyee@163.com>
pkgname="phizclip-studio-dev"
pkgver="1.2.3"
pkgrel=1
pkgdesc="Developer tools for PhizClip-dev"
arch=("x86_64")
url="https://open-dev.xyue.zip:9443/"
license=('custom')
depends=()
source=(
  "${pkgname}-${pkgver}-${pkgrel}.AppImage"::"https://pan-dev.xyue.zip:8443/s/qbcCMtRjckYCJfn/download/PhizClip%20Studio-1.2.3-dev.AppImage"
  "${pkgname}.desktop"
  "${pkgname}.png")
sha256sums=('c98e490db5c8cef51c0299c933adaa646d9b7801e408628b1f1e26578e132d20'
            'bba2a0ba094fb922adb791b224fe32554588ab78f72f3d9630011cc4eb5fea27'
            '53239505b912d9cb80a1f3e22ead56edb56a4a0d8b6b99536a6ab46a1ae8e9a1')
options=(!strip)

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.AppImage" "${pkgdir}/opt/PhizClip-Studio-dev/PhizClip-Studio.AppImage"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/PhizClip-Studio-dev.png"
}
