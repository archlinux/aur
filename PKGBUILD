# Maintainer: Fatih Bostancı <ironic@yaani.com>

pkgname=ezanvakti
pkgver=7.0
pkgrel=1
pkgdesc="Islamic Prayer Times bash script for Turkish users"
arch=('any')
url="https://gitlab.com/fbostanci/ezanvakti"
license=('GPL3')
makedepends=()
# change curl to wget and ffmpeg to mplayer if wanted
# isteniyorsa curl yerine wget, ffmpeg yerine mplayer yazilabilir.
depends=('bash' 'sed' 'gawk' 'grep' 'libnotify' 'curl' 'ffmpeg')
optdepends=('yad: gui support')
source=("https://github.com/fbostanci/ezanvakti/archive/v$pkgver.tar.gz")
md5sums=('b425122e4ab94d8267e9671e2ac22d35')

package() {
  cd "$pkgname-$pkgver"
  make PREFIX=/usr sysconfdir=/etc DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
