# Maintainer: DeathSec
# Last Updated: 10:00 PM , 25 April 2017 IST
pkgname=libresponse
pkgver=0.0.3
pkgrel=1
pkgdesc="Human Friendly HTTP/HTTPS library for C/C++"
arch=('i686' 'x86_64')
url="https://github.com/DeathSec/response"
license=('apache')
depends=('curl' 'cmake')
source=(https://github.com/deathsec/response/archive/v$pkgver.tar.gz)
sha256sums=('ed3c93d6daea03dd1f2d836de63607f38865f97f4f16316ffff811edc4d1f76a')                                                                

build() {
        cd "response-$pkgver"    
        cmake . 
        make 
}
 
package() {
        cd "response-$pkgver"
        make DESTDIR="$pkgdir/" install
}
