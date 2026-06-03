pkgname=file-manager-bin
_pkgname=file-manager
pkgver=0.0.1
pkgrel=1
pkgdesc="A Linux desktop file manager built with Rust and Iced"
arch=('x86_64')
url="https://github.com/nsjsv/File_Manager"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'fontconfig'
  'gcc-libs'
  'glibc'
  'libxkbcommon'
  'wayland'
  'xdg-utils'
)
optdepends=(
  'ffmpeg: video preview and video metadata support'
  'ffmpegthumbnailer: video thumbnail support'
  'p7zip: 7z archive preview support'
  'unrar: rar archive preview support'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-v$pkgver-x86_64.tar.gz::https://github.com/nsjsv/File_Manager/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64.tar.gz")
sha256sums_x86_64=('05293b040f12fee3b628e65999196be525a453b925887eb324bfa67e9fb89140')

package() {
  cd "$srcdir/$_pkgname-v$pkgver-x86_64"
  cp -a usr "$pkgdir/"
}
