# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Zaedus <thezaedus@proton.me>
_pkgname="youtube-tui"
pkgname="${_pkgname}-full-bin"
pkgver=0.9.2
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
sha512sums=('d752f626f44e88f24c0e07b2487206e7fc9ece20fb5d8c5ccefc81a64b0fbe5ffcfb6a9c048c6b0a113cff8912daae59cf80da3f2f660533581f47b16bfd8b6b')

package() {
  cd "${srcdir}"
  install -Dm 755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
