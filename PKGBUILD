# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=wooting-profile-switcher
pkgname="${_pkgname}-bin"
pkgver=2.1.3
pkgrel=1
pkgdesc="Automatically switch Wooting keyboard profiles based on focused window "
arch=('x86_64')
url="https://github.com/ShayBox/${_pkgname}"
license=('MIT')
depends=("libusb-1.0.so" "libwebkit2gtk-4.1.so")
source=("${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha512sums=("c3b5dee46e76152643eb0c60c4cdcd63c6922a60a676a873bcf1dd916ecb8dea6ba71ac8a49c3d3ca85afc23feaf5d216f9b19bed7fe6b384337d71fa2f69b33")

prepare() {
  tar -zxvf data.tar.gz
}

package() {
  cp -r "${srcdir}/usr" "${pkgdir}"
}
