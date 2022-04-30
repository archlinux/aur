# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=suckit-bin
_pkgname=suckit
pkgver=0.2.0
pkgrel=1
pkgdesc="Recursively visit and download a website's content to your disk"
arch=('x86_64' 'aarch64')
url="https://github.com/Skallwar/suckit"
license=('Apache')
depends=('openssl' 'gcc-libs')
provides=("$_pkgname" "$pkgname")
source=("README.md::$url/blob/v$pkgver/README.md")
sha512sums=('SKIP')
source_x86_64=("$_pkgname::$url/releases/download/v$pkgver/suckit-v$pkgver-x86_64-unknown-linux-gnu" )
sha512sums_x86_64=('b3f117876837b76783bcdc3a04573bbac779796a26ed00f8282de874a6449b0b1d1f9527145f2beb07fe6f2139ca7bb696314fba07d6f35056faec1c0e150988')
source_aarch64=("$_pkgname::$url/releases/download/v$pkgver/suckit-v$pkgver-aarch64-unknown-linux-gnu" )
sha512sums_aarch64=('7d34cd95381cd76f9de82e1b58ee575012e51c0ecc9b266af21650ff775796b64c59b590cc4957490d98b8f86a2db64b0c68669e7b7f2f448033d5d886fac338')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 'README.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}
