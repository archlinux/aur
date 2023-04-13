# Maintainer: DanCodes <dan@dancodes.online>
pkgname="parrot-bin"
pkgver="1.0.6"
pkgrel=1
pkgdesc="GUI wrapper in Tauri for the Arch Linux package manager, pacman using the wrapper paru. Designed to be intuitive, powerful and user-friendly"
arch=('x86_64')
url="https://github.com/dan-online/parrot"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
source=("https://github.com/dan-online/parrot/releases/download/1.0.6/parrot_1.0.6_amd64.deb")
sha256sums=("a27a000d6d52d388cf05ee73f5ce09e7b1582e127dfb9e4a952d825db4fca616")

package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
