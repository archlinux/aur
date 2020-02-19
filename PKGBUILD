# Maintainer: Jonathan Pettersson <anders.jonathan.p@gmail.com>
pkgname=berglas-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Berglas is a command line tool and library for storing and retrieving secrets on Google Cloud."
arch=('x86_64')
url="https://github.com/GoogleCloudPlatform/berglas"
license=('APACHE')
source=("berglas_$pkgver::https://storage.googleapis.com/berglas/$pkgver/linux_amd64/berglas")
md5sums=('f8b4750923859515e80da7e4f54b2b4d')

package() {
  install -Dm755 "berglas_$pkgver" "$pkgdir/usr/bin/berglas"
}