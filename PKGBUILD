# Maintainer: Ali Furkan Yıldız <alifurkanyildz@gmail.com>
pkgname=avt
pkgver=1.1.6
pkgrel=1
pkgdesc="ali's video tool"
arch=(any)
url='https://gitlab.com/alifurkany/avt'
license=('GPL3')
depends=('bash' 'ffmpeg' 'pipewire' 'pulseaudio' 'xorg-xdpyinfo')
makedepends=('git')
source=("git+https://gitlab.com/alifurkany/avt.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/avt"
  install -Dm755 avt "$pkgdir/usr/bin/avt"
}
