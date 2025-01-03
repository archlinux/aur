# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.38.1
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
sha512sums_x86_64=('bfa5dba2d8800d23a51cd8f0a9f0e4e92cf7c035ae438f04ed014d7d6e8ed3f76fc7bc96c76dd200549b42eba46500a75cda5ea6c0506aa4fe518dc2efd1ded5')
sha512sums_i386=('b878561a3d06b02b049e941c3f5a5bea62b75aa96fa19847ee188f01ad93216f2f1c328852b679662ff8f1ae80c675f929daf4af8d90a3677884f0921daf0c57')
sha512sums_aarch64=('24d3afeeb87f90bd3d5d8c2b75e97b99364a31c4c3dcf393d328d0b34503bee7dde4d9837084069ecc3c54dd48b51e76bdf1fd4a36091870dec95b53b259b322')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
