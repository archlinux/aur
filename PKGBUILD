# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.50.0
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
sha512sums_x86_64=('ba93aeae5265516d6b2b4e9609258e637a0c60dbbaeed84549d679a1fd58bf454b0f3cbc5cae1ca81489573e311b7d444471eef4216a48f866c4fd3a4376c55c')
sha512sums_i386=('a7d7ec2096037d6e76f35ce32f67b27669f8c981c07fd69e4c97bdf964d3ee9fc811e7904ba95d04cd1a151da1e35e52c132d160799794309d8c07b84090da18')
sha512sums_aarch64=('7fd5c7e41604892a7a7f70c02fe05be81261d63ba84ec3a71c2ff2ac38a8c343b9a5f6325a04c10c5e8b29104282f7a41ace6c76e72f0843b3ca0e25be444e42')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
