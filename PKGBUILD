# Maintainer: jensgrunzer <jensgrunzer@gmail.com>
_pkgname=swingmusic
pkgname="${_pkgname}-x64-bin"
pkgrel=1
pkgdesc="Swing Music is a beautiful, self-hosted music player for your local audio files"
arch=(x86_64)
pkgver=1.4.8
url="https://swingmx.com/"
license=('MIT')
groups=()
provides=("${_pkgname}")
depends=()
makedepends=()
optdepends=('ffmpeg: audio silence skip feature')
conflicts=()
replaces=()
source=(https://github.com/swingmx/swingmusic/releases/download/v${pkgver}/swingmusic
	https://raw.githubusercontent.com/swingmx/swingmusic/refs/heads/master/LICENSE)
sha256sums=('5d1e25b280fe8fe7340e4b01f005e614851c234ad214b33ef298369871cc59d1' '30b0f446384bbda0c6d6b8ca0655e3fe76194828ec4065a9ffffe876c8944fda')

package() {
  cd "${srcdir}"
  install -Dm755  swingmusic -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
