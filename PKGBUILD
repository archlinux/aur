# Maintainer: Julian Hornich < vivaeltopo@googlemail.com >

_pkgname=idok
pkgname=${_pkgname}-bin
pkgdesc="A simple command line tool to stream media to kodi"
url="https://metal3d.github.io/idok/"
pkgver=20140910
pkgrel=1
arch=('x86_64' 'i686')
license=('BSD')
makedepends=('gzip')

_url=('https://github.com/metal3d/idok/releases/download')
source=("${_url}/${pkgver}-${pkgrel}/idok-${arch}.gz"
        "https://raw.githubusercontent.com/metal3d/idok/master/LICENSE")
sha256sums=("5b602c8d1e5407d7796c806af5c9cc3f0b9bd6b16b5264a2c722e7960802a1b7"
            "359c126730888651fb2e29791f5cd8f45976dfdd042bb3fa3be1d66aad60d5f1")

package (){
  install -Dm755 "${_pkgname}-${arch}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
