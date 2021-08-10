# Maintainer: Bojan Momcilov <bojan.momcilov@yandex.com>

pkgname=eidmiddleware
pkgver=3.3.0
pkgrel=1
pkgdesc="AKD eID Middleware basic user package"
arch=('x86_64')
url="https://www.eid.hr"
license=('Custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("${url}/datastore/filestore/10/${pkgname}_v${pkgver}_amd64.deb")
options=('!strip' 'staticlibs')
sha512sums=('2fa46b583025fe064fe95d1b1dc59e8b960d9b94a3a24df9be3cc39e643e5e345c5841ca27b33a039ce832fcc2dd4af0a57fc5e98a70b07e40c0a46105951bc5')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

}
