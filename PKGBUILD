# Maintainer: Ben Word <ben@benword.com>
pkgname=quien-bin
_pkgname=quien
pkgver=0.7.2
pkgrel=1
pkgdesc="A better whois and domain intelligence toolkit (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/retlehs/quien"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-amd64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('f506b8310ab72283d27733e89df9c1f3775f35e68020494b4ae5cbf2784bc2c6')
sha256sums_aarch64=('4088501cec58a88da95c2fe151d7ed8fbe0ec9f22b0c628012e402c8b3579347')

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
