# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.36.0
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
sha512sums_x86_64=('6d723fb65c207ce169872e00aaf61291320f063c71feada8fc0b52beaef8b52eb37cba83704d252f4df4b5362736aaafd9119a573428a3bd05faaaa5a995491d')
sha512sums_i386=('0fec0fc3bc26eae6007b7fe0419008b9712d1ae530d777cdaae305410c49d1942ba484732e1382133f1763a33327b528738bb2de3270948d6b693c67e1631218')
sha512sums_aarch64=('bb8571e2d2328f118f847513fedd800b20db8c0af832b23245a7e9c5706c161efaae7cde4cf08e4dc7f9abdb1b3a679ac980fa1d20f0d3dcc4bcbf23f611a5a1')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
