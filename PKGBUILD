# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ramfetch
pkgver=1.0.4
pkgrel=1
pkgdesc="A fetch which displays memory info using /proc/meminfo"
url='https://codeberg.org/o69mar/ramfetch'
arch=('x86_64')
license=('MIT')
makedepends=('make')
conflicts=('ramfetch-git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('7ce40609e34fd1983f3d386183f1ba0b5bd12f433ec0e871715d41ce2877a15e')

package() {
  mv $pkgname $pkgname-$pkgver
  cd $pkgname-$pkgver
  install -Dm755 ramfetch "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

