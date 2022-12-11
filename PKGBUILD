# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=typeracer-bin
_pkgname=terminal-typeracer
pkgver=2.1.2
pkgrel=1
pkgdesc="Terminal typing speed tester"
arch=('x86_64')
url="https://gitlab.com/ttyperacer/terminal-typeracer"
license=('GPL3')
depends=('openssl' 'sqlite')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
_md5=c134f71d0246ad3695610499fc50a0ef
source_x86_64=("$pkgname-$pkgver::$url/uploads/$_md5/${pkgname%-bin}"
              "$pkgname-$pkgver-README.md::$url/-/raw/v$pkgver/README.md")
sha512sums_x86_64=('5e7d3e3cc7d5fd3c1ba689d445839811172105b5e5c66069e06d3a71aa647ae27d791013f45528d7af61866410382508cc901737c5e5684bfce7e074459ae98b'
                   '4d7cc472ae40c2b939ec7d5e569e1bfae51645c399c924cb4ca8f2fad3bd52afd0f9c0ecff2e55e8d8f0f2d446042538448ab104bec238a10cb32e5e986b9696')

package() {
  install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
