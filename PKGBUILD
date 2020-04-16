# Maintainer: Brian Bidulock <bidulock@archlinux.org>

pkgname=linux-a11y-sound-theme
pkgver=r19.730e525
pkgrel=1
pkgdesc='Sound theme for the linux accessibility organization'
arch=('any')
url="https://github.com/coffeeking/$pkgname"
license=('GPL3')
makedepends=('git')
source=("git+https://github.com/coffeeking/$pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  install -dm0755 "$pkgdir/usr/share/sounds"
  cp -av linux-a11y "$pkgdir/usr/share/sounds"
}

