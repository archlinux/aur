# Maintainer: Brodi <me@brodi.space>
_pkgname=godu
pkgname=${_pkgname}-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Simple golang utility helping to discover large files/folders."
url="https://github.com/viktomas/godu"
license=(MIT)
arch=('x86_64' 'i686' 'aarch64')
provides=("${_pkgname}" "${_pkgname}-git")
conflicts=("${_pkgname}" "${_pkgname}-git")

source_x86_64=("$url/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("$url/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")

source=("https://raw.githubusercontent.com/viktomas/godu/v${pkgver}/LICENSE.md")

sha256sums_x86_64=('26001c9e86044948eba7ddf7c2d7dab38015a7540400df21d76d01bfb8bdf059')
sha256sums_i686=('87411979e46a5e332a3ad4ba2f9d3d169fa7e06ba01597fcbcac184c7e6fca03')
sha256sums_aarch64=('eb3214ba5b31e778ad3501116730181e49d7809669195beff8a1c1267214589b')

sha256sums=('fbbf1cc302e3112da5f11cafa5b0cb3894c41678fffe5129443fd0da52cd30d2')

package() {
	install -Dm755 godu "${pkgdir}/usr/bin/godu"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
