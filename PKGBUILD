# Maintainer: DeathSec                        
pkgname=libresponse
pkgver=0.0.1 
pkgrel=1
pkgdesc="A Easy to use HTTP , HTTPS , FTP , SCP , SFTP Library for C/C++"
arch=('i686' 'x86_64')  
url="https://github.com/DeathSec/response"
license=('apache')
depends=('curl' 'cmake')
source=(https://github.com/deathsec/response/archive/v$pkgver.tar.gz)
sha256sums=('945ec206f354f7c3208b7055ac53670d1b282ae926d04259c9454cc274adb9f3')                                                                

build() {
        cd "response-$pkgver"    
        cmake . 
        make 
}
 
package() {
        cd "response-$pkgver"
        make DESTDIR="$pkgdir/" install
}
