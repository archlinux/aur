# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-profile-switcher
pkgname="${_pkgname}-bin"
pkgver=3.0.1
pkgrel=1
pkgdesc="Automatically switch Wooting keyboard profiles based on focused window "
arch=('x86_64')
url="https://github.com/ShayBox/${_pkgname}"
license=('MIT')
depends=("libhidapi-hidraw.so" "wootility")
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=("fe384655e0b290c1cf3e1018934f4ffd4104a9502a2898705deaa19f37d75a0a6c615c537134e07784887fb4d101adfb609e8ba06d9f624cb8608cc94506870c")

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  cp -r "${srcdir}/usr" "${pkgdir}"
}
