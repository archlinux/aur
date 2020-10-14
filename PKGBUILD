# Maintainer: Jonathan Pettersson <anders.jonathan.p@gmail.com>
pkgname=berglas-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="Berglas is a command line tool and library for storing and retrieving secrets on Google Cloud."
arch=('x86_64')
url="https://github.com/GoogleCloudPlatform/berglas"
license=('APACHE')
source=("berglas_$pkgver::https://storage.googleapis.com/berglas/$pkgver/linux_amd64/berglas")
md5sums=('7b5444655f73455eb9e15130bd823efd')

package() {
  install -Dm755 "berglas_$pkgver" "$pkgdir/usr/bin/berglas"
}