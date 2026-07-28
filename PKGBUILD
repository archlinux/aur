# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=recall-zippoxer-bin
_pkgname=recall
pkgver=0.5.0
pkgrel=1
pkgdesc="Full-text search and resume for AI coding-agent conversations (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/zippoxer/recall"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('recall')
conflicts=('recall' 'recall-bin')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/zippoxer/$_pkgname/v$pkgver/LICENSE")
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/zippoxer/$_pkgname/releases/download/v$pkgver/recall-linux-$CARCH.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/zippoxer/$_pkgname/releases/download/v$pkgver/recall-linux-arm64.tar.gz")
sha256sums=('8d58297c216e4892c9c5c3f44570f1cadb3464d6b6bbcb73d461fb591ecf04e9')
sha256sums_x86_64=('86aee348b5a15f2aa18d8c6536d65089e8fcf68ff43b46fefc56f3ab5e791e16')
sha256sums_aarch64=('f4a187d3717d6feb4f66865a82fd9ec671d3a7fd018382db0620ee3fa3ccd211')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
