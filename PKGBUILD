# Maintainer: alvaniss <alvaniss1g@gmail.com>
pkgname=privacy-dots
pkgver=1.0.0
pkgrel=1
pkgdesc="Script that displays the status of your microphone, camera, location and screen sharing."
arch=(
  'any'
)
url="https://github.com/alvaniss/privacy-dots"
license=('GPL-3.0-or-later')
depends=(
  'pipewire'
  'v4l2loopback-dkms'
  'jq'
  'dbus'
)
source=(git+https://github.com/alvaniss/privacy-dots.git)
sha256sums=('SKIP')

build() {
  :
}

package() {
  cd "$srcdir/privacy-dots"
  install -Dm755 privacy_dots.sh "$pkgdir/usr/bin/privacy-dots"
}
