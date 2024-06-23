# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-profile-switcher
pkgname="${_pkgname}-bin"
pkgver=2.3.5
pkgrel=2
pkgdesc="Automatically switch Wooting keyboard profiles based on focused window "
arch=('x86_64')
url="https://github.com/ShayBox/${_pkgname}"
license=('MIT')
depends=("libhidapi-hidraw.so" "libwebkit2gtk-4.1.so" "wootility-lekker")
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=("2596f5ddcb20a418aebe27d914358878a5bcac48cdc92da08933485143ff6b6bd9f0a6e160a9b83ac8187a5eed4eac90fa0e732c4c30c5b6ef157c53863653c1")

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  cp -r "${srcdir}/usr" "${pkgdir}"
}
