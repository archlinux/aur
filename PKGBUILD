# Maintainer: f4iey 
pkgname=kappanhang
pkgver=1.3
pkgrel=1
pkgdesc="Interface for Icom transceivers"
arch=('i686' 'x86_64')
gopath="github.com/nonoo/kappanhang"
url="https://gopath"
license=('MIT')
makedepends=('go')
depends=('libpulse')
#source=("$url/archive/refs/tags/v$pkgver.tar.gz")
#md5sums=(SKIP)

package() {
  install -dm755 $pkgdir/usr/bin  
  GOBIN=$pkgdir/usr/bin	go install $gopath@latest
}

