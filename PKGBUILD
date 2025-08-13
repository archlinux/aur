# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: Zaedus <thezaedus@proton.me>
_pkgname="youtube-tui"
pkgname="${_pkgname}-full-bin"
pkgver=0.9.1
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
sha512sums=('5308a41772fbc0278ce8225d37c47c2f4aff78fe52618dc9448327f94f0279f67c72312cb58e7f3ce045a475b0c72042093d74fed18536c51e1f058b720330b5')

package() {
  cd "${srcdir}"
  install -Dm 755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
