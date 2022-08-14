# Maintainer: Albin Larsson <mail@albinlarsson.com>

pkgname=spotify-fixer
pkgver=0.1.0
pkgrel=1
pkgdesc='Fixes Spotify scaling and launching behavior'
arch=('any')
url="https://github.com/friday/spotify-fixer"
license=('MIT')
depends=('spotify' 'python-gobject')
optdepends=('libwnck3: Fix single window app behavior (X11 only)')
source=('spotify')
sha256sums=('a1707932b52b6f8ea78336a26faba1216809183c5ff1508b5e621f17420640c4')

package() {
  install -D --mode +x spotify "${pkgdir}/usr/local/bin/spotify"
}
