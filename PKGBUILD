# Maintainer: mizorewww <aac6fef@icloud.com>
pkgname=arkloop-bin
pkgver=26.5.7
pkgrel=1
pkgdesc="Desktop app for building conversational AI agents"
arch=('x86_64')
url="https://github.com/qqqqqf-q/Arkloop"
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libappindicator-gtk3'
  'libdrm'
  'libnotify'
  'libxcomposite'
  'libxdamage'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'mesa'
  'nss'
  'xdg-utils'
)
provides=('arkloop' 'arkloop-desktop')
conflicts=('arkloop' 'arkloop-desktop' 'arkloop-git')
options=('!strip' '!debug')
source_x86_64=("${pkgname}-${pkgver}-${pkgrel}-upstream-x86_64.pkg.tar.zst::https://github.com/qqqqqf-q/Arkloop/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
noextract=("${pkgname}-${pkgver}-${pkgrel}-upstream-x86_64.pkg.tar.zst")
sha256sums_x86_64=('efb4a327f50b630c4e4330f344d82b48d803392d96ec068bd44b94cf6ed76fa5')

package() {
  bsdtar -xpf "${srcdir}/${pkgname}-${pkgver}-${pkgrel}-upstream-x86_64.pkg.tar.zst" -C "${pkgdir}"
  rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"
}
