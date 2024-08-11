# Maintainer: Ali Furkan Yıldız <alifurkanyildz@gmail.com>
pkgname=avt
pkgver=1.1.8
pkgrel=2
pkgdesc="ali's video tool"
arch=(any)
url='https://gitlab.com/alifurkany/avt'
license=('GPL3')
depends=('bash' 'ffmpeg' 'pipewire' 'pulse-native-provider' 'libpulse' 'xorg-xdpyinfo')
makedepends=('git')
source=("git+https://gitlab.com/slonkazoid/avt.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/avt"
  install -Dm755 avt "$pkgdir/usr/bin/avt"
}
