pkgname=zenmaster
pkgver=1.0.5
pkgrel=3
pkgdesc="Set up your Arch Installation the way you like. (Inspired by Ninite)"
arch=('any')
url="https://gitlab.com/nexttechcreations/arch-zenmaster"
license=('MIT')
depends=('coreutils' 'bash' 'pacman' 'pacman-contrib' 'systemd' 'procps-ng' 'util-linux' 'libnotify' 'cpupower' 'sudo')

source=("https://gitlab.com/nexttechcreations/arch-zenmaster/-/archive/v1.0.5.1/arch-zenmaster-v1.0.5.1.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/arch-zenmaster-v1.0.5.1"

  install -Dm755 zenmaster "$pkgdir/usr/bin/zenmaster"

  install -d "$pkgdir/usr/share/zenmaster"
  cp -r scripts "$pkgdir/usr/share/zenmaster/"
}

