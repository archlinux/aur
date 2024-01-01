# Maintainer: ljoonal <aur at ljoonal.xyz>
pkgname="resolute-bin"
pkgver="0.6.1"
pkgrel=1
pkgdesc="GUI wrapper in Tauri for the Arch Linux package manager, pacman using the wrapper paru. Designed to be intuitive, powerful and user-friendly"
arch=('x86_64')
url="https://github.com/Gawdl3y/Resolute"
license=('GPL-3-or-later')
depends=('gtk3' 'webkit2gtk' 'noto-fonts-emoji')
source=(
  "https://github.com/Gawdl3y/Resolute/releases/download/v$pkgver/resolute_${pkgver}_amd64.deb"
)
sha256sums=(
  "daba4c64aa989e8fd639b22862b72a76346bedb41d9b4aaf7ae13d671d877ace"
)

package() {
  cd "${pkgdir}"
  bsdtar -xf "${srcdir}/data.tar.gz"
}
