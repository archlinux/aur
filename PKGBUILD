# Maintainer: Ali Furkan Yıldız <alifurkanyildz@gmail.com>
pkgname=avt
pkgver=1.1.1
pkgrel=2
pkgdesc="ali's video tool"
arch=(any)
url='https://gitlab.com/alifurkany/avt'
license=('GPL')
depends=('bash' 'ffmpeg' 'pipewire' 'pulseaudio' 'xorg-xdpyinfo')
source=('git+https://gitlab.com/alifurkany/avt.git')
sha256sums=('SKIP')

package() {
  cd avt
  git config advice.detachedHead false
  git checkout tags/v$pkgver

  install -Dm755 avt "$pkgdir/usr/bin/avt"
}
