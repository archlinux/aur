# Maintainer: Bojan Momcilov <bojan.momcilov@yandex.com>

pkgname=eidmiddleware
pkgver=3.6.0
pkgrel=1
pkgdesc="AKD eID Middleware basic user package"
arch=('x86_64')
url="https://www.eid.hr"
license=('Custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("${url}/datastore/filestore/10/${pkgname}_v${pkgver}_amd64.deb")
options=('!strip' 'staticlibs')
sha512sums=('40f5b6197990326de19857d9927c99ed41e6542cf38859c362ce9c1495030dbb9619ca43027b5497ffbf49a45c03fa2b08849107dc269cd0cfeaa5902e7ce531')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

}
