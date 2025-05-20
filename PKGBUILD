# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=risor-bin
_pkgname=risor
pkgver=1.8.1
pkgrel=1
pkgdesc='Fast and flexible scripting for Go developers and DevOps.'
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/risor-io/${_pkgname}"
license=('Apache-2.0')
options=(!debug)
source_x86_64=("${_pkgname}-${pkgver}_x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_x86_64.tar.gz")
source_i386=("${_pkgname}-${pkgver}_i386.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_i386.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}_aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_arm64.tar.gz")
sha256sums_x86_64=('171ec1b0447e0726637f933737c7fe447d7cf1c88d4b5e7c1608e61bf5654fae')
sha256sums_i386=('91d581488a676e9f103a166e8f06abe93fdb690863ce21b4a4124d0b33db8817')
sha256sums_aarch64=('a6e2db89fe407371e030f9a6063fa839f1f63affbe8f5eb63b34666768ce3278')

package() {
	install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
