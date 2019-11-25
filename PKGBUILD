# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=steam-buddy
pkgver=0.1.3
pkgrel=1
pkgdesc="A web interface for managing Steam remotely"
arch=('any')
url="https://github.com/gamer-os/steam-buddy"
license=('MIT')
depends=('python' 'python-bottle' 'python-yaml' 'python-requests' 'steam-tweaks' 'retroarch' 'libretro-genesis-plus-gx' 'libretro-mgba' 'libretro-nestopia' 'libretro-snes9x' 'retroarch-autoconfig-udev-git' 'flatpak')
source=("https://github.com/gamer-os/steam-buddy/archive/$pkgver.tar.gz")
md5sums=('3145157c3513f35f901d19afc9811ffc')

package() {
  cd "$srcdir/steam-buddy-$pkgver"
  make install DESTDIR="$pkgdir"
}
