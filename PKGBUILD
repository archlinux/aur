# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.46.0
pkgrel=1
pkgdesc="AWS cloud account cleaning tool"
url="https://github.com/gruntwork-io/${_base}"
arch=(x86_64 i386 aarch64)
license=(MIT)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=(${_base}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_base}_linux_amd64)
source_i386=(${_base}-${pkgver}-i386::${url}/releases/download/v${pkgver}/${_base}_linux_386)
source_aarch64=(${_base}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_base}_linux_arm64)
sha512sums_x86_64=('08cacc2554e5967f83cd8ded6b8e778e154df5e21ae56cd6363294e935cc4e6c8b2deca08f0012e03d7d3f4a80690aae4a11b472b4d438d4d315cce866700ae5')
sha512sums_i386=('d5c95dc842f8ffc1dea92a666c7e92b656e5fccbf13188dd616ef1e4b8666dceb1f23045fcfe8b1faa1cbdf7749fb797ccf7813567bd0b02371bf797060332e1')
sha512sums_aarch64=('6bee0f1cea6939846b6808a632a523f23ee76df8f73bbc5155dd4b320200d623e238f621cad2ab6751f3b5b6c0a8e31076077d09493c6753df0f163b9a500078')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
