# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

_name=sptlrx
pkgname=sptlrx-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="Timesynced Spotify lyrics in your terminal."
arch=('x86_64' 'arm64' 'i386' 'armv6h')
url="https://github.com/raitonoberu/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
_url="$url/releases/download/v$pkgver/${_name}_${pkgver}_linux"
source_x86_64=("${_url}_amd64.tar.gz")
source_arm64=("${_url}_arm64.tar.gz")
source_i386=("${_url}_386.tar.gz")
source_armv6h=("${_url}_armv6.tar.gz")
sha256sums_x86_64=('4b7b847b7f701356d8a696fa62f14520369a59887d20f17e79ac2d263e2f55c2')
sha256sums_arm64=('588893fd7b011f53bc47775a8a3600f85c41eb641d3397581d1d08113768b4e3')
sha256sums_i386=('a91c59de16830b63c692394f597ae7da95e821b5e4bacc7fe2b8c07a6a8edcfa')
sha256sums_armv6h=('3b3ba4082f3b0555116560493d042d4db1df7e0aee0bfe7cfb8ce971364d6f96')

package() {
  install -Dm755 "${_name}" "$pkgdir"/usr/bin/"${_name}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
