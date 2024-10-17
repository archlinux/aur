# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=risor-bin
_pkgname=risor
pkgver=1.7.0
pkgrel=1
pkgdesc='Fast and flexible scripting for Go developers and DevOps.'
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/risor-io/${_pkgname}"
license=('Apache-2.0')
makedepends=('go')
source_x86_64=("${_pkgname}-${pkgver}_x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_x86_64.tar.gz")
source_i386=("${_pkgname}-${pkgver}_i386.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_i386.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}_aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_arm64.tar.gz")
sha256sums_x86_64=('279fe6410651331d7a9b3aaed336d6a694364a0961395ec67628f2f6b0bc9c9a')
sha256sums_i386=('64661e332eb5a90f5823d4f65999dc94dd9684941a8c86fe0ad1a020ef2bc90d')
sha256sums_aarch64=('90009087088b86a2bf5307057cc2f61bfdf95373f193c2940027a0ad24f4efab')

package() {
	install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
