# Maintainer: Bojan Momcilov <bojan.momcilov@yandex.com>

pkgname=eidmiddleware
pkgver=3.7.4
pkgrel=2
pkgdesc="AKD eID Middleware basic user package"
arch=('x86_64')
url="https://www.eid.hr"
license=('Custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("${url}/datastore/filestore/10/${pkgname}_v${pkgver}_amd64.deb")
options=('!strip' 'staticlibs')
sha512sums=('83652c9baacb1273b2542c0da7fb4be64f825b0075e536c01b18cca1949f2ecdf05fe3504bd9c9105d17f17180d24d0d3cc85b39af4ffd2abdc5f2df8368c7b8')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

}
