# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.51.0
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
sha512sums_x86_64=('cbfa02954664a0cfa7eebd1f84b6940af5b1cdd1a7a0df7fa06f6aff0cbb5577882848f2eb4994a6e75e9684269c9b4ba22945bb2a915b7b6d033eda1abae134')
sha512sums_i386=('663ac9506ece8c90bbc15a79464437a326e8c8e6ee3f5c3361d0eadcf0e8555d835fce0b12d3304c7b0a0cccf401fe2a3014c4af9d2af38cbf46eb09f7c23117')
sha512sums_aarch64=('e987890e7311eebdb5188a2d6efdc388d148b5223c28052169ca9a1e6a2e7b2bce02ac4bef98cf5ea59d61ff2c1b2e0b12ddd2031e6cfdaa39c64c61fd103287')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
