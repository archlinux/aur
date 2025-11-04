# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.45.0
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
sha512sums_x86_64=('0e6280cce16f2897642dfaa504dc72cdb811a2ed7bc7ee707d3233b51b0396d0c4d43c2db529ca58bdf7a1260d1eb1cd0f5db74138201aabffc6d77310cc50d7')
sha512sums_i386=('ec48460812e9787e4d0969e9e705231e70de8cdd0b1194dd4d9b7ca294700a674a85d0a5341c05f345b0c827a461587f5970b8fd725294cfb256b5acecb2425c')
sha512sums_aarch64=('cfb4a34f9fcecc08fe90fb8fc8eee60ae66aba911c5ac4ba2087b6d96f8c8b88bc8964452382a03ac49b447cc6864b8da2504fea6c51690169f4412d66b83ac7')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
