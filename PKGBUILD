# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.44.0
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
sha512sums_x86_64=('35be8f5eac23782131d633257203f44c39646c4c1c79c1e8768891f9298b0273704c6277f7ad45f0b950d4c7ef22abc069ff00ace5999a411f02c7cb0519b697')
sha512sums_i386=('ab24ee0eea3a8842d5b7f1570dfdaa9f948f87c144c5c2bbe2374e7dacb3fd67ad6b5a31be5265ae845a275238e55916031c70841bc7c1b032ef763cad5c3aa2')
sha512sums_aarch64=('ec2ed5aaa6ea002f88709601097b85b4e3f221223d9c3926f692ec0b52cfa3b8d5be5af648f87b51318a170ab4c2182c5c1efff441002155f666ccd5471d7dfa')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
