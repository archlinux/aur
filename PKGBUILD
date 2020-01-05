# Maintainer: Adriano M. <adrianomola0809@gmail.com>

pkgname=gumdl
pkgver=0.1.1
pkgrel=2
pkgdesc="Simple tool to download files from the Internet"
arch=('x86_64')
url="https://github.com/miniMola124/gumdl.releases"
license=('MIT')
depends=('curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/miniMola124/gumdl.releases/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e8d6615796e7a8f736d15e98b0c76364a899a07cfeebbad8270ba8e054d4bf6c4a59c6ee1b62d0f8bf6da3d7c2999b85a51bc0e5bf8a23b39addcd0d4378a8ce')

package() {
  cd src/$pkgname-$pkgver
  install -Dm755 gumdl -t "/usr/bin" 
}

