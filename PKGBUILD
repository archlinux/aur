# Maintainer: DanCodes <dan@dancodes.online>
pkgname="parrot-bin"
pkgver="1.0.5"
pkgrel=1
pkgdesc="GUI wrapper in Tauri for the Arch Linux package manager, pacman using the wrapper paru. Designed to be intuitive, powerful and user-friendly"
arch=('x86_64')
url="https://github.com/dan-online/parrot"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
source=("https://github.com/dan-online/parrot/releases/download/1.0.5/parrot_1.0.4_amd64.deb")
sha256sums=("820aa0a54cf9d75b42f0a150e3562916bf7428170733e4bc66c4ea8a1ad82333")

package() {
  tar -xz -f data.tar.gz -C "${pkgdir}"
}
