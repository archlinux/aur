# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=typeracer-bin
_pkgname=terminal-typeracer
pkgver=2.1.4
pkgrel=1
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url="https://gitlab.com/ttyperacer/terminal-typeracer"
license=('GPL3')
depends=('openssl' 'sqlite')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
_md5=586c0dc2df67e8ac2b02dd66b2b35122
source_x86_64=("$pkgname-$pkgver::$url/uploads/$_md5/${pkgname%-bin}"
              "$pkgname-$pkgver-README.md::$url/-/raw/v$pkgver/README.md")
sha512sums_x86_64=('36a4ec600a29b942d62723663cd11e407a4ac3a6e676e12339cdf5085fa179af3ad1374eba69c02d429a3bdb7cb2372b82c7e103ee91122dda8ebbf5f843703c'
                   '4d7cc472ae40c2b939ec7d5e569e1bfae51645c399c924cb4ca8f2fad3bd52afd0f9c0ecff2e55e8d8f0f2d446042538448ab104bec238a10cb32e5e986b9696')

package() {
  install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
