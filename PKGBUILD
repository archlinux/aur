# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=typeracer-bin
_pkgname=terminal-typeracer
pkgver=2.0.8
pkgrel=2
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url="https://gitlab.com/ttyperacer/terminal-typeracer"
license=('GPL3')
depends=('openssl' 'sqlite')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
_md5=399f820814b3acb0d8a2b77af2fb4cf9
source_x86_64=("$pkgname-$pkgver::$url/uploads/$_md5/${pkgname%-bin}"
              "$pkgname-$pkgver-README.md::$url/-/raw/v$pkgver/README.md")
sha512sums_x86_64=('e217cbf22516a3960cca90d4175284a3cd8ea3ef1ff404ceb99f782e9670f7b0b64d104c980cea76be9bc9eda03dd34c4e7c7ee4917ea30cd5fc64cb82041df7'
                   'e129352068b9fb6738eec4b255314fba2a953917d2519db071ae74968689b9a5cc2d115f22bd9a3470bf1cae43857c9d405cafe808d84c0f533a2b4201a368c4')

package() {
  install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
