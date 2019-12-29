# Maintainer: Adriano M. <adrianomola0809@gmail.com>

pkgname=gumdl
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple tool to download files from the Internet"
arch=('x86_64')
url="https://github.com/miniMola124/gumdl.releases"
license=('MIT')
depends=('curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/miniMola124/gumdl.releases/releases/download/0.1.0/$pkgname-$pkgver.tar.gz")
sha512sums=('e695b5eb06e181472ab0389f90354f2361ebb63abbe805aa212389299ff3e79404dcd963b582a89b09a32d9cce061cbd01e096560f8c509ba1958f854f64dc83')

# build() {
  cd src/$pkgname-$pkgver
  sudo install gumdl /usr/bin/
# }

# check() {
#  cd $pkgname-$pkgver  
# }

package() {
  cd $pkgname-$pkgver
}

