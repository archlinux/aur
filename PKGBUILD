# Maintainer: A.I. <merrick@luois.me>

_script=j
_width=compressed
pkgname=glow-sans-${_script}-${_width}
pkgver=v0.92
pkgrel=1
pkgdesc="SHSans-derived CJK font family with a more concise & modern look."
url="https://welai.github.io/glow-sans"
arch=(any)
license=(MIT)
source=(https://github.com/welai/glow-sans/releases/download/$pkgver/GlowSans${_script^^}-${_width^}-$pkgver.zip)
md5sums=('b310174cfac31e9ff5d2360c09db504f')

package() {
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 $srcdir/*.otf
}
