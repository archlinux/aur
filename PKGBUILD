# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: Skallwar <estblcsk@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=suckit-bin
_pkgname=suckit
pkgver=0.1.2
pkgrel=1
pkgdesc="Recursively visit and download a website's content to your disk"
arch=('x86_64')
url="https://github.com/Skallwar/suckit"
license=('Apache')
depends=('openssl' 'gcc-libs')
makedepends=('rust')
provides=("$_pkgname" "$pkgname")
source=("README.md::$url/blob/v$pkgver/README.md")
sha512sums=('SKIP')
source_x86_64=("$_pkgname::$url/releases/download/v$pkgver/suckit-v$pkgver-x86_64-unknown-linux-gnu" )
sha512sums_x86_64=('4b17bfff0fd201779970e8bdc2f184647da232aaec9f6b9538ea839e0cfe7d5c6e4054f9b3945d832a235990f7fd957427f04cc95346f2e4fb8c683bdaccd1a3')

package() {
  install -Dm 755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 'README.md' -t "$pkgdir/usr/share/doc/$_pkgname"
}
