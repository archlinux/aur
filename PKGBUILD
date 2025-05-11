# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Zaedus <thezaedus@proton.me>
_pkgname="youtube-tui"
pkgname="${_pkgname}-full-bin"
pkgver=0.8.3
pkgrel=1
pkgdesc="An aesthetically pleasing TUI frontend to browsing YouTube written in Rust. (Binary)"
arch=('x86_64')
url="https://github.com/Siriusmart/youtube-tui"
license=('GPL3')
depends=('libsixel' 'libxcb' 'openssl' 'mpv')
optdepends=(
  'konsole: default terminal emulator'
  'yt-dlp: default youtube downloader'
)
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgfull="${_pkgname}-full_arch-x86_64"
source=("${_pkgname}-${pkgver}::https://github.com/Siriusmart/youtube-tui/releases/download/v${pkgver}/${pkgfull}")
sha512sums=('8edde7fbfa96a5d8901869c966e069c57ddd8c0ec28afa05b2ac27a6441a79bb0eca91e07b7984319c69eeb76aff0fb41692649145ad95949dd49cdf6eeda8d3')

package() {
  cd "${srcdir}"
  install -Dm 755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}