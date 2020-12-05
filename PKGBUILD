# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_version=3.11
_version_pkg_updates=0
_gitcommit=c1a6ec8e3093b41bb936eeb8deb86c4a573a99a2

pkgname=kose-font
pkgver="${_version}+${_version_pkg_updates}+${_gitcommit::7}"
pkgrel=1
pkgdesc="A Chinese Font derived from SetoFont / Naikai Font / cjkFonts-AllSeto"
arch=('any')
license=('custom:SIL')
url="https://github.com/lxgw/kose-font"
source=(
  "git+${url}.git#commit=${_gitcommit}"
)
sha256sums=(
  'SKIP'
)

package() {
  cd "${srcdir}/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/fonts/${pkgname}"
  install -Dm644 TTF\ \(Simplified\ Chinese\)/XiaolaiSC-Regular.ttf "${pkgdir}/usr/share/fonts/${pkgname}/XiaolaiSC-Regular.ttf"
  install -Dm644 TTF\ \(Simplified\ Chinese\)/XiaolaiMonoSC-Regular.ttf "${pkgdir}/usr/share/fonts/${pkgname}/XiaolaiMonoSC-Regular.ttf"
  install -Dm644 TTF\ \(Japanese\)/Kosefont-JP.ttf "${pkgdir}/usr/share/fonts/${pkgname}/Kosefont-JP.ttf"
  install -Dm644 TTF\ \(Japanese\)/KosefontP-JP.ttf "${pkgdir}/usr/share/fonts/${pkgname}/KosefontP-JP.ttf"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 OpenType_Features.md "${pkgdir}/usr/share/doc/${pkgname}/OpenType_Features.md"
  install -Dm644 history.md "${pkgdir}/usr/share/doc/${pkgname}/history.md"
  install -Dm644 SIL_Open_Font_License_1.1.txt "${pkgdir}/usr/share/licenses/${pkgname}/SIL_Open_Font_License_1.1.txt"
}
