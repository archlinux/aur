# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('autotiling')
pkgver=0.9
pkgrel=1
pkgdesc="Script for sway and i3 to automatically switch the horizontal / vertical window split orientation"
arch=('x86_64')
url="https://github.com/nwg-piotr/autotiling"
license=('GPL3')
depends=('python-i3ipc')

source=("https://github.com/nwg-piotr/autotiling/archive/v"$pkgver".tar.gz")

md5sums=('384f27537274f1ba6add54b28605b641')

package() {
  install -D -t "$pkgdir"/usr/lib/"$pkgname" "$pkgname"-"$pkgver"/autotiling.py
  install -D -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"/autotiling
}

