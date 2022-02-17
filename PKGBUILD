# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=typeracer-bin
_pkgname=terminal-typeracer
pkgver=2.0.10
pkgrel=1
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url="https://gitlab.com/ttyperacer/terminal-typeracer"
license=('GPL3')
depends=('openssl' 'sqlite')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
_md5=ef092602d333f71883c709111e5c7d9c
source_x86_64=("$pkgname-$pkgver::$url/uploads/$_md5/${pkgname%-bin}"
              "$pkgname-$pkgver-README.md::$url/-/raw/v$pkgver/README.md")
sha512sums_x86_64=('ad5b9d5ca7bbce810295698bbf9e29bb6c2b27a2ed2ec71b2d3130103447971f54de64cdd50e374a1dcc0ea9b501cf50018c7d738cb4ec3300c3f466bc3ecd2e'
                   '4d7cc472ae40c2b939ec7d5e569e1bfae51645c399c924cb4ca8f2fad3bd52afd0f9c0ecff2e55e8d8f0f2d446042538448ab104bec238a10cb32e5e986b9696')

package() {
  install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
