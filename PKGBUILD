# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.40.0
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
sha512sums_x86_64=('82f29339abeb42c0695f78f28d9d5f748c3c13daeed5b143aff7a122b728600b0a00b4bbb11239a7f08f2ae7f5f6b2bec531920af42fb5faf97b454608347d33')
sha512sums_i386=('cee69730d23ddabc51d576abfceede1a43de63a51904da5e3eb6bbc6b79b5e3c09b0d88645bbc6f1769a04424f7cabe1d56a9d990e74d579ec230ae0e4f55721')
sha512sums_aarch64=('9534bc115a42c2ae15c951b7383a9e0611ca81a0dfbe80e354891f88279827c07858506f01d662e8b7a4d77b26ae92032e2653be33ec999cc1a15ce0d871dad0')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
