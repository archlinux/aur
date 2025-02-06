# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.38.2
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
sha512sums_x86_64=('37670abfb06fa82fbcb25251cbb532b33951d78fe26b0d3f7539da15cacb1a75ee9a9589fb127e4a60d7f8aba7486a2d6569ae9b963f2fc69b6102020ca5e2e4')
sha512sums_i386=('b1cc2352ddf64335bbceb3780b536a783278145e63692f3b98f4a8da87f23169f851e7f50b6819fcb744d0e760f9f926ae149e27f802f17011781a93ddcb2233')
sha512sums_aarch64=('7b0310db0abaa8978e3c50a3d8b80324aa3d085e366f0ac53753ad32ff6662d2a820fa067913fb5c9bc1fb5ba20fd014989d8c106204b3edd43afb3eb2bc3acf')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
