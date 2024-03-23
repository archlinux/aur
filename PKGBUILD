# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=risor-bin
_pkgname=risor
pkgver=1.5.2
pkgrel=1
pkgdesc='Fast and flexible scripting for Go developers and DevOps.'
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/risor-io/${_pkgname}"
license=('Apache-2.0')
makedepends=('go')
source_x86_64=("${_pkgname}-${pkgver}_x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_x86_64.tar.gz")
source_i386=("${_pkgname}-${pkgver}_i386.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_i386.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}_aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_arm64.tar.gz")
sha256sums_x86_64=('d09ae76fa32f86af0322b9a6da571fb4bc9f3962653c82cfa8124e004c367ac4')
sha256sums_i386=('3f5801ef1daf858b37937ddda5590c7afa6ba549dcb6438cca87adfca5d24e7b')
sha256sums_aarch64=('33f37a1aaec8a8aa5042f1a61337ae9943c22e053b89cb4bbf36e01eaee25312')

package() {
	install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
