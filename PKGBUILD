# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=risor-bin
_pkgname=risor
pkgver=2.1.0
pkgrel=1
pkgdesc='Fast and flexible scripting for Go developers and DevOps.'
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/risor-io/${_pkgname}"
license=('Apache-2.0')

options=(!debug)

source_x86_64=("${_pkgname}-${pkgver}_x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_x86_64.tar.gz")
source_i386=("${_pkgname}-${pkgver}_i386.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_i386.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}_aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_$(uname -s)_arm64.tar.gz")
sha256sums_x86_64=('5ae92a33c2542edb63887e11ffca93fd0d5c25c4f1732b368175d201675cd535')
sha256sums_i386=('5d1c5c268afe4cf6475b7e30fbda3715a0f92f8c86b264445bfed7ea78571987')
sha256sums_aarch64=('e278ac185b8f6e6a7236e17495731c39bbf0f7625aa402fd9f068850b7bbe58a')

package() {
    cd $srcdir

	install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
