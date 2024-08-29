# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.37.2
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
sha512sums_x86_64=('5ce69aca88d11e15f8bb1800ff974acdf2103f72d77347a79f6b67759c678a0cd0c86119a1767243e62e70fc63c1d3391d1feb86e7a2f6061aaf092fa3946f54')
sha512sums_i386=('c1a63015b6b5cf7cd86d77a27e756afe6f97060ada1899f04e6dbbdb7d738cdb47b24deff7969ed7bef1fad9670b89bb9ee258e125713993c750eacb32dca92d')
sha512sums_aarch64=('da713ca204cdbec74777f97ab9d0cacc6d1bc384edbe27fc20ca823c64da06ea42fc610e737190139dcd6bfb23c803c047e4cb27596e46b57bd6b1756683dc19')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
