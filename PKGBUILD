# Maintainer: Ricardo Gonçalves <ricardompgoncalves at gmail dot com>
pkgname=disk-benchmark
pkgver=1.0.0
pkgrel=1
pkgdesc="Tool to benchmark disks, devices, filesystems or even files, like CrystalDiskMark but for the command line"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/rigon/disk-benchmark"
license=('MIT')
makedepends=('git' 'gcc')
source=("git+https://github.com/rigon/disk-benchmark.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  gcc -o $pkgname disk-benchmark.c
}

package() {
  cd "$pkgname"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
}
