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
sha512sums=('8080b7c4416565b2e0510c77777687d993c4f139fc7034f0a90307b8b636570850387c1752572953a66af59cc9cbd02443db5e8a103ea96848dafbc828aa26dc')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

}
