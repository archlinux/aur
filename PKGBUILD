# Maintainer: Bojan Momcilov <bojan.momcilov@yandex.com>

pkgname=eidmiddleware
pkgver=3.2.0
pkgrel=1
pkgdesc="AKD eID Middleware basic user package"
arch=('x86_64')
url="https://www.eid.hr"
license=('Custom')
depends=('qt5-base' 'openssl-1.0' 'ccid')
source=("${url}/sites/default/files/${pkgname}_v${pkgver}_amd64.deb")
options=('!strip' 'staticlibs')
sha512sums=('f6ee8dd273bfc2af5720649cb5518fed1f65a0991aaf2a140ae61c4f8fb9c43fa75d47a8e4ec908f9620c8d667392c80a4fc2c0725bff20dbf556ad2e87509df')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

}
