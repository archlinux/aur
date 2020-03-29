# Maintainer: A.I. <merrick@luois.me>

_script=tc
_width=condensed
pkgname=glow-sans-${_script}-${_width}
pkgver=v0.9
pkgrel=1
pkgdesc="SHSans-derived CJK font family with a more concise & modern look."
url="https://welai.github.io/glow-sans"
arch=(any)
license=(MIT)
source=(https://github.com/welai/glow-sans/releases/download/$pkgver/GlowSans${_script^^}-${_width^}-$pkgver.zip)
md5sums=('395449d85221e9ca978b9542ab462bae')

package() {
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 $srcdir/*.otf
}
