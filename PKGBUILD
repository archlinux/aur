# Contributor ringo <ringo@deqc.xyz>

pkgname=reddix-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="Reddit, refined for the terminal."
arch=("x86_64")
url="https://github.com/ck-zhang/reddix"
license=("MIT License")
conflicts=('reddix')
replaces=('reddix')
provides=('reddix')
options=(!strip)
source=("$pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.xz::$url/releases/download/v${pkgver}/reddix-x86_64-unknown-linux-gnu.tar.xz")
b2sums=('198580cdd3b184c3b1252ac532ebad6fe2e2a206d8a52703df0b01ced1d4c1aebce633393f20ed957757d3e628a3bc2c59d42c7d97bbd6ef516b2cc6b9272177')

package() {
  cd "reddix-x86_64-unknown-linux-gnu"
  install -Dm755 reddix -t "$pkgdir/usr/bin/"
}
