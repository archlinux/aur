# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
_name=sptlrx
pkgname=sptlrx-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Timesynced Spotify lyrics in your terminal."
arch=('x86_64' 'arm64' 'i386')
url="https://github.com/raitonoberu/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
_url="$url/releases/download/v$pkgver/${_name}_${pkgver}_Linux"
source_x86_64=("${_url}_x86_64.tar.gz")
source_arm64=("${_url}_arm64.tar.gz")
source_i386=("${_url}_i386.tar.gz")
sha256sums_x86_64=('50b803ab558fbcf62d1f02a1d6ebd6b3e732baa12d54fe91c88f56545c443979')
sha256sums_arm64=('28d02fa85c226f17eab73457daa6e0466c7dcc4f6672058e56f8c1e4467692ad')
sha256sums_i386=('dc3102bdba4e19194501e74107d50864db6495f428c795b2f265e604cca3ec8e')

package() {
  install -Dm755 "${_name}" "$pkgdir"/usr/bin/"${_name}"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
# vim:set ts=2 sw=2 et:
