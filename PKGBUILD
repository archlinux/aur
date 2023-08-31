# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-profile-switcher
pkgname="${_pkgname}-bin"
pkgver=2.1.1
pkgrel=1
pkgdesc="Automatically switch Wooting keyboard profiles based on focused window "
arch=('x86_64')
url="https://github.com/ShayBox/${_pkgname}"
license=('MIT')
depends=("libusb-1.0.so" "libwebkit2gtk-4.1.so")
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=("8fe38e9c15f4c03298db576b50e0235b0ffb868aa53bab96bc9d73a16ef62d360c49b09ab1884149455ef7386ee058fd6bf2bd533a79afa79c5e2f033f819b8b")

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  cp -r "${srcdir}/usr" "${pkgdir}"
}