# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Zaedus <thezaedus@proton.me>
_pkgname="youtube-tui"
pkgname="${_pkgname}-full-bin"
pkgver=0.8.0
pkgrel=1
pkgdesc="An aesthetically pleasing TUI frontend to browsing YouTube written in Rust. (Binary)"
arch=('x86_64')
url="https://github.com/Siriusmart/youtube-tui"
license=('GPL3')
depends=('libsixel' 'libxcb' 'openssl')
optdepends=(
  'mpv: default video player'
  'konsole: default terminal emulator'
  'yt-dlp: default youtube downloader'
)
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}::https://github.com/Siriusmart/youtube-tui/releases/download/v${pkgver}/${_pkgname}-full_arch-x86_64")
sha512sums=('ffc00c17bebc0fbc7f32dfc102363c721ad1a3a415ac065468ba70ba181e72ab016a8381678cfb474e6a07b0d7ef8b62bdc57ec78af240aa014f05da9972fe30')

package() {
  cd "${srcdir}"
  install -Dm 755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
