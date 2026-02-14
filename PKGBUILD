# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-profile-switcher
pkgname="${_pkgname}-bin"
pkgver=3.0.0
pkgrel=1
pkgdesc="Automatically switch Wooting keyboard profiles based on focused window "
arch=('x86_64')
url="https://github.com/ShayBox/${_pkgname}"
license=('MIT')
depends=("libhidapi-hidraw.so" "wootility")
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=("c1bc96611d718c122981a37ecbeb3fd2c0aba536245e6a8e784173273f68cc5b929b462298d9e5864c0cad7ca1449398b5f7e267f6c9e0ed0075638ad9881f84")

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  cp -r "${srcdir}/usr" "${pkgdir}"
}
