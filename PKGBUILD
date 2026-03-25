# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.48.0
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
sha512sums_x86_64=('3d117247fba76611dd1032a86d9c8e3512ffd9a1233282ae60ddffa598632b3c7b06a36f7bd1ebbc9ee0b3ad37ec3b70934946d903f8036a5af451881a76f56f')
sha512sums_i386=('486f9d5b8753bbace34fc8207c6cf7a7b6816c62fde382a221c084d7805533d99f41c6742c6e07c23e56371a3da446fbcf939ac069db0ce817a9039a9c67baf9')
sha512sums_aarch64=('4862c2fd1be679f3cc22bf4ec121e38265055613465a73c6f33e1c4b1489b6418f6d9af70dc0eaaba721325e65357a7cc1aa93024e0761f5e5779e7a0dfb2e76')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
