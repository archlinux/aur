# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=risor-bin
_pkgname=risor
pkgver=1.8.0
pkgrel=1
pkgdesc='Fast and flexible scripting for Go developers and DevOps.'
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/risor-io/${_pkgname}"
license=('Apache-2.0')
options=(!debug)
source_x86_64=("${_pkgname}-${pkgver}_x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_x86_64.tar.gz")
source_i386=("${_pkgname}-${pkgver}_i386.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_i386.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}_aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_arm64.tar.gz")
sha256sums_x86_64=('c222e2815a37e95eb9eb292545e49db2ebdf2d82624103f1f2b027e573955fa2')
sha256sums_i386=('68919d4df45af8f8aa76c636bc8592100371dfd75d7ca2a5c1a74c886b2113bc')
sha256sums_aarch64=('dbc314623e70bd0f0f1b3ca8d9ca31cbbcb395e03b83a9539792a0bc54be55ca')

package() {
	install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
