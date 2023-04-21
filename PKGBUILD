# Maintainer: f4iey 
pkgname=kappanhang
pkgver=1.3
pkgrel=2
pkgdesc="Remotely open audio channels and a serial port to an Icom RS-BA1 server (for ex. Icom IC-705 transceiver)."
arch=('i686' 'x86_64')
gopath="github.com/nonoo/kappanhang"
url="https://$gopath"
license=('MIT')
makedepends=('git' 'go')
depends=('libpulse')
#source=("$url/archive/refs/tags/v$pkgver.tar.gz")
#md5sums=(SKIP)

package() {
  install -dm755 $pkgdir/usr/bin  
  GOBIN=$pkgdir/usr/bin	go install $gopath@latest
}

