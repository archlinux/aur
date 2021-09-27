# Maintainer: Andrew Shark <ashark @ at @ linuxcomp.ru>

pkgname=obs-cli-leafac-bin
pkgver=2.2.3
pkgrel=1
pkgdesc='Remote control OBS from the command line (by leafac, not by muesli)'
arch=(x86_64)
url="https://github.com/leafac/obs-cli"
license=(MIT)
options=(!strip)
source=("https://github.com/leafac/obs-cli/releases/download/v2.2.3/obs-cli-linux"
)
sha256sums=('3ed69aaf335bcb82dcbed1351a7bb3a05c19ad4b6f22e27f43e40835d04ed435'
)

package() {
  install -Dm755 obs-cli-linux "$pkgdir/usr/bin/obs-cli-leafac"
}
