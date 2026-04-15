# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.49.0
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
sha512sums_x86_64=('0f79269ce5cab74b358a93e1e3534f4e44245adaaef72bcb6b9d7ae746e1e030bd0468a12628d98e13e2db3d205214f1df83575d4eb30d97a6bc31f7641202fa')
sha512sums_i386=('19f50d7c72b9bca120b0cdfe69a0a66c62e27965586c0b4f9fe6153f08f768ab1ef0b7ef6084fc3cc67319dc1c75695b4f5c4a7ddfb2b95d4eac460212026be2')
sha512sums_aarch64=('d5c5aa2d4eb0844d03462989cdca8800bd24c8f456dc58b0a62c03bcadfa9af3b301459c08fc97b9f5ebe0bcb2cc3f07e6b10e052ec3dda10c66d8f0e4564cd3')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
