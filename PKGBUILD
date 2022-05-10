# Maintainer: papojari <papojari-git.ovoid@aleeas.com>

pkgname='kabeljau'
pkgver=2.0.0
pkgrel=1
pkgdesc='Survive as a stray cat in an ncurses game'
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://codeberg.org/papojari/$pkgname"
license=('LGPL3')
depends=('bash' 'dialog')
makedepends=('just' 'inkscape')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/papojari/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('55725d7aed2fe29413abc8dea98674b63125c464d200eb0cf2a1a175cc1b2d12')

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share"
  just --set bin-path "$pkgdir/usr/bin" --set share-path "$pkgdir/usr/share" install
}
