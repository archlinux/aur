# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.43.0
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
sha512sums_x86_64=('9cc2d1633f667b73ac6597db6bbb55dd89f67a5d284d53f77a0c3f70d15f6fed4eb06c936292c80c7e5052d4797e9b34ee73b2031840b02282aeec720bf2eecc')
sha512sums_i386=('6ff5885c2b895f88996ca1c62b2dd75047c8ad2b83259045854619fe12868197cee0e14e21cc76d0d9b126aeee6e15bf0954cd18be513944d7354f789bc2e0b4')
sha512sums_aarch64=('65f7539672841a5c129a2ac7ad5f35e74934c4b8214cb4a25b4cbbf4c55c997af862ab3103e0fd32e8091a800e27ef08a0a6373ffc273a2822fbaff33cf69131')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
