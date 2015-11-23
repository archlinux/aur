# Maintainer: Your Name <binaryplease@gmail.com >
pkgname=vcal  
pkgver=2.2
pkgrel=1
pkgdesc="Display the data in a vcalendar or icalendar file"
arch=('any')
url="http://tewok.com/software/vcal-2.2"
license=('unknown')
depends=('perl')
source=("http://tewok.com/software/$pkgname-$pkgver")
md5sums=('5c63e5371e3390d6e5af000cb02d64c8')
validpgpkeys=()

package() {
    mkdir -p ${pkgdir}/usr/bin
    chmod +x ${pkgname}-${pkgver}
    cp ${pkgname}-${pkgver} ${pkgdir}/usr/bin/vcal
}
