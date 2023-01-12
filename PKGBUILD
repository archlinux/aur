# Maintainer: Ali Furkan Yıldız <alifurkanyildz@gmail.com>
pkgname=avt
pkgver=1.0.0
pkgrel=1
pkgdesc="ali's video tool"
arch=(any)
url='https://gitlab.com/alifurkany/avt'
license=('GPL')
depends=('ffmpeg' 'perl' 'pipewire' 'pulseaudio')
source=('git+https://gitlab.com/alifurkany/avt.git')
sha256sums=('SKIP')

package() {
  cd avt
  git checkout tags/v$pkgver

  install -Dm755 avt "$pkgdir/usr/bin/avt"
}
