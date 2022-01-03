# Maintainer: mark dot blakeney at bullet-systems dot net
# Contributor: Danilo Kuehn <dk[at]nogo-software[dot]de>
_pkgname=dry
pkgname=$_pkgname-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="dry: a terminal application to manage Docker containers and images"
url="http://moncho.github.io/$_pkgname/"
arch=("x86_64" "i686" "armv7h" "aarch64")
license=("MIT")
depends=("docker")
_pkgdownload=${_pkgname}_${pkgver}
source_x86_64=("${_pkgdownload}-x86_64::https://github.com/moncho/$_pkgname/releases/download/v${pkgver}/$_pkgname-linux-amd64")
source_i686=("${_pkgdownload}-i686::https://github.com/moncho/$_pkgname/releases/download/v${pkgver}/$_pkgname-linux-386")
source_armv7h=("${_pkgdownload}-armv7h::https://github.com/moncho/$_pkgname/releases/download/v${pkgver}/$_pkgname-linux-arm")
source_aarch64=("${_pkgdownload}-aarch64::https://github.com/moncho/$_pkgname/releases/download/v${pkgver}/$_pkgname-linux-arm64")
sha256sums_x86_64=('91c1a91a031fec9fdc223a75321ef3b085904ee47d0523406d0c76596376f82a')
sha256sums_i686=('9a25401a1d73be0483236301cad0dfa976c1b248fabbe0762637011d314acf39')
sha256sums_armv7h=('31bc97d3ffc123ed4369a62ad58cf59ad9fed9e0968f90b4b4f28cbb63821cdc')
sha256sums_aarch64=('7a08ea3fc03871d09e5b6c9c216ff25279c65f55af22915dc81ab6387893618f')

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}-$CARCH" "${pkgdir}/usr/bin/${_pkgname}"
}
