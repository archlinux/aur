# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

_name=sptlrx
pkgname=sptlrx-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="Timesynced Spotify lyrics in your terminal."
arch=('x86_64' 'arm64' 'i386')
url="https://github.com/raitonoberu/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
# _url="$url/releases/download/v$pkgver/${_name}_${pkgver}_Linux"
_url="$url/releases/download/v$pkgver/${_name}_${pkgver}_Linux"
source_x86_64=("${_url}_x86_64.tar.gz")
source_arm64=("${_url}_arm64.tar.gz")
source_i386=("${_url}_i386.tar.gz")
sha256sums_x86_64=('fe9bd16945e9671096da32261a23360c394e05e792d4d7871e232ca8f559d076')
sha256sums_arm64=('1f2421bfa8b7c29eab5a41d5dc6e8e476aa58abf66c86e93831e47c89536cd52')
sha256sums_i386=('869b00a01ec48f81949e52b2199a9e97a89b171a5f432ae6632df5cd7153718c')

package() {
  install -Dm755 "${_name}" "$pkgdir"/usr/bin/"${_name}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
