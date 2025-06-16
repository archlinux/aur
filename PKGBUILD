# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=typeracer-bin
_pkgname=terminal-typeracer
pkgver=2.1.5
pkgrel=2
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url="https://gitlab.com/ttyperacer/terminal-typeracer"
license=('GPL3')
depends=('openssl' 'sqlite')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
_md5=67a30aa09144ab2be3a52ca05194ee22
source_x86_64=("$pkgname-$pkgver::https://gitlab.com/-/project/12380631/uploads/$_md5/typeracer"
  "$pkgname-$pkgver-README.md::$url/-/raw/v$pkgver/README.md")
sha512sums_x86_64=('f6ecb53e251ac429fabf2ae29f81050b289a7f9d28554a39d7edc1766f33246c70cd6ee670a3cd426cf7b8822dce1f21001dbd939c947f209f772c5036a1060f'
                   '4d7cc472ae40c2b939ec7d5e569e1bfae51645c399c924cb4ca8f2fad3bd52afd0f9c0ecff2e55e8d8f0f2d446042538448ab104bec238a10cb32e5e986b9696')

package() {
  install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
