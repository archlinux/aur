# Maintainer: archlinux.info:tdy

pkgname=komodo-engine
pkgver=8
_pkgdir=_2d3f23
pkgrel=1
pkgdesc="Freeware version of the Komodo chess engine (~3295 Elo)"
arch=(x86_64)
url=https://komodochess.com
license=(custom)
source=(http://komodochess.com/pub/${pkgname%-*}-$pkgver.zip
        COPYING)
sha256sums=(0ba5f23bdf4d8fefff2e524664265e119beba5c1950b47f5c204c2a20c109fa1
            0d81e7e34a9563047580052052646c5ebb656a39a4575043e0fef6f7704cb18b)

package() {
  cd ${pkgname%-*}-$pkgver$_pkgdir
  install -Dm755 Linux/${pkgname%-*}-$pkgver-linux "$pkgdir"/usr/bin/${pkgname%-*}
  install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/${pkgname%-*}/COPYING
  install -dm755 "$pkgdir"/usr/share/doc/${pkgname%-*}/
  install -m644 *.* "$pkgdir"/usr/share/doc/${pkgname%-*}/
}
