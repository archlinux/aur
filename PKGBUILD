# Maintainer: zaeyee <zaeyee@163.com>
pkgname="phizclip-studio"
pkgver="1.2.0"
pkgrel=3
pkgdesc="Developer tools for PhizClip"
arch=("x86_64")
url="https://open.phiz.chat/"
license=('custom')
depends=()
source=(
  "${pkgname}-${pkgver}-${pkgrel}.AppImage"::"https://pan-dev.xyue.zip:8443/s/TtN7ozqAmAk2smA/download/PhizClip%20Studio-1.2.0.AppImage"
  "${pkgname}.desktop"
  "${pkgname}.png")
sha256sums=('01f7b7e312abe19d763315f79c46e91346e54f77e062a0a3efe0eecfa6991eea'
            'bfcc785d47ed5e0a08be334dfe535f6ee4f7ce4acdc2bdf2adceadfafca13be7'
            '53239505b912d9cb80a1f3e22ead56edb56a4a0d8b6b99536a6ab46a1ae8e9a1')
options=(!strip)

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${pkgrel}.AppImage" "${pkgdir}/opt/PhizClip-Studio/PhizClip-Studio.AppImage"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/PhizClip-Studio.png"
}
