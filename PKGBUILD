# Maintainer: Ben Word <ben@benword.com>
pkgname=quien-bin
_pkgname=quien
pkgver=0.7.1
pkgrel=1
pkgdesc="A better whois and domain intelligence toolkit (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/retlehs/quien"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('b879ba635838344b6fe76e7739e61b8a5af3e3a8e377b9c1bcb2f40b256c5dca')
sha256sums_aarch64=('840079b39857d475704dc2e21d78b37a3e5eaa4295b6c2523e81297c3ac1e91f')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
