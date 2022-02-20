# Maintainer: trickybestia <trickybestia@gmail.com>

pkgname=torrc-change-bridges
pkgver=0.1.1
pkgrel=1
pkgdesc="Fastly change bridges in your torrc and restart tor"
arch=(any)
url=https://gist.github.com/trickybestia/b79dc786f3a583807ad2f4ca6ccb14a0
license=(GPL3)
depends=(python)
source=("$pkgname::https://gist.githubusercontent.com/trickybestia/b79dc786f3a583807ad2f4ca6ccb14a0/raw/40f3d990573bd2f4ae0c90e94c87836328cab61d/torrc-change-bridges")
sha256sums=(e1b9fec42a811d24b24e19df579a6acab1637d5df133e4eafcc61171e9b16c1b)

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
  chmod u+s "$pkgdir/usr/bin/$pkgname"
}
