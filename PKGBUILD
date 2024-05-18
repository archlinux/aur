# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=libgen-cli
pkgname=${_base}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI tool to access the Library Genesis dataset"
url="https://github.com/ciehanski/${_base}"
arch=(x86_64)
license=(Apache-2.0)
depends=(glibc)
conflicts=("${_base}")
provides=("${_base}")
source=(${_base/-*/}::${url}/releases/download/v${pkgver}/${_base}-v${pkgver}-linux)
sha512sums=('09ea5be792011a3fca0e7e151d52a6091601a85a243d7970826ef9998431927c9cd88955b446f21b50db7aefe1c67f035000fe00c2e8f3cdfce6e9052ebe5522')

package() {
  install -Dvm755 ${_base/-*/} -t "${pkgdir}/usr/bin"
}
