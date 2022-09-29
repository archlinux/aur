# Maintainer: Bojan Momcilov <bojan.momcilov@yandex.com>

pkgname=eidmiddleware
pkgver=3.7.1
pkgrel=1
pkgdesc="AKD eID Middleware basic user package"
arch=('x86_64')
url="https://www.eid.hr"
license=('Custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("${url}/datastore/filestore/10/${pkgname}_v${pkgver}_amd64.deb")
options=('!strip' 'staticlibs')
sha512sums=('c36ed4c56caa527fe5897e81dcea864102b43a83aa0cb8279d8ec8447d39408f951424d64fe4348c65afe43f484fc9ec2f971a42ba9740083dfa198658e99c06')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

}
