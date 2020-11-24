# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=hadlock-bin
pkgver=1.1.6
pkgrel=2
pkgdesc="X window manager"
arch=('x86_64')
url="https://github.com/AdaShoelace/hadlock"
license=('MIT')
depends=('dbus' 'libxinerama')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/Hadlock"
               "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
               "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha512sums_x86_64=('0339c6619603ab862c12a58086c924120022f6e1826cf154cc7f4903cac8c0e972ea8c767a9973b3cc661fb2ffef1c44d07e67b8f60ed351224e2ee3534eea0f'
                   '30c4c2d74fa7895ac61b21ad3e850b22cd4769a45be19a3f17af94ac0ae0c764ef049612b2c090d665bca28863bb7994a4e2ef6378ad0a3a7bb84596e4322321'
                   'e717de20d70b47ae7eb47eef7bfe9a01cb9ed2db32cd2dd552c85cd8eb35ce63030f7246e065d5419a783ee9009e40284893585674fa7264b410831e43690c91')

package() {
  install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/${pkgname%-bin}"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
