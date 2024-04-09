# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-profile-switcher
pkgname="${_pkgname}-bin"
pkgver=2.3.5
pkgrel=1
pkgdesc="Automatically switch Wooting keyboard profiles based on focused window "
arch=('x86_64')
url="https://github.com/ShayBox/${_pkgname}"
license=('MIT')
depends=("libhidapi-hidraw.so" "libwebkit2gtk-4.1.so" "wootility-lekker")
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=("319bd3f74a1fffbe57dfff0bcb5c48a13d4be1ef95c3eb78b9d739c73ea8c83eff0c2ab9c3363fe4b30b941dbfc980d2db64016004daacda16fe0a24ca770c1d")

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  cp -r "${srcdir}/usr" "${pkgdir}"
}
