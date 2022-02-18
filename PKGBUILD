# Maintainer: trickybestia <trickybestia@gmail.com>

pkgname=torrc-change-bridges
pkgver=0.1.0
pkgrel=1
pkgdesc="Fastly change bridges in your torrc and restart tor"
arch=(any)
url=https://gist.github.com/trickybestia/b79dc786f3a583807ad2f4ca6ccb14a0
license=(GPL3)
depends=(python)
source=("$pkgname::https://gist.githubusercontent.com/trickybestia/b79dc786f3a583807ad2f4ca6ccb14a0/raw/c7910cecd1d4d05e223c1b2fd034dec3fe0c3f29/torrc-change-bridges")
sha256sums=(cb5adf7ee516ab198b54d1ca826b45ce525b1b9eefe008ab0c8687b0a4fe9c63)

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
  chmod u+s "$pkgdir/usr/bin/$pkgname"
}
