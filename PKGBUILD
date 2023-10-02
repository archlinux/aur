# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-profile-switcher
pkgname="${_pkgname}-bin"
pkgver=2.1.2
pkgrel=1
pkgdesc="Automatically switch Wooting keyboard profiles based on focused window "
arch=('x86_64')
url="https://github.com/ShayBox/${_pkgname}"
license=('MIT')
depends=("libusb-1.0.so" "libwebkit2gtk-4.1.so")
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=("2a094d5cf9c2c1de330892182bc7ea61ad07cb11290f3597b0fa2aebb032beeb7debbb4bffff455e977a4b7b09ca42ecee90f558293b8e28b729bda4955b765c")

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  cp -r "${srcdir}/usr" "${pkgdir}"
}
