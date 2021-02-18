# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=typeracer-bin
_pkgname=terminal-typeracer
pkgver=2.0.6
pkgrel=1
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url="https://gitlab.com/ttyperacer/terminal-typeracer"
license=('GPL3')
depends=('openssl' 'sqlite')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
_md5=f8b8d4b1c7fca37aca68c36452df1e3a
source_x86_64=("$pkgname-$pkgver::$url/uploads/$_md5/${pkgname%-bin}"
              "$pkgname-$pkgver-README.md::$url/-/raw/$pkgver/README.md")
sha512sums_x86_64=('623cdcf28d1218ac74fe968ecc349fdc612b5934f3646e96a76857cafd637755dbfd573d50107ac24ac15ba3437e8699b0e06d823347045274a75c99167ec3e1'
                   'e129352068b9fb6738eec4b255314fba2a953917d2519db071ae74968689b9a5cc2d115f22bd9a3470bf1cae43857c9d405cafe808d84c0f533a2b4201a368c4')

package() {
  install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
