# Maintainer: Pablo Ovelleiro Corral <pablo1+aur@mailbox.org>
pkgname=vcal
pkgver=2.8
pkgrel=2
pkgdesc="Display the data in a vcalendar or icalendar file"
arch=('any')
url="https://waynemorrison.com/software/vcal"
license=('apache 2.0')
depends=('perl')
source=("https://waynemorrison.com/software/$pkgname")
md5sums=('77040295f692a73cbb9c0def34ab0ee5')

package() {
    mkdir -p ${pkgdir}/usr/bin
    chmod +x ${pkgname}
    cp ${pkgname} ${pkgdir}/usr/bin/vcal
}
