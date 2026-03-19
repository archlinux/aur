# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Zaedus <thezaedus@proton.me>
_pkgname="youtube-tui"
pkgname="${_pkgname}-full-bin"
pkgver=0.9.4
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
sha256sums=('c8898e6cbde585578dc809b9199ea77b3b8afb8217f884343c633e23341f2bc9')

package() {
  cd "${srcdir}"
  install -Dm 755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
