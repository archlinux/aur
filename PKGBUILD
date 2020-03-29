# Maintainer: A.I. <merrick@luois.me>

_script=tc
_width=extended
pkgname=glow-sans-${_script}-${_width}
pkgver=v0.9
pkgrel=1
pkgdesc="SHSans-derived CJK font family with a more concise & modern look."
url="https://welai.github.io/glow-sans"
arch=(any)
license=(MIT)
source=(https://github.com/welai/glow-sans/releases/download/$pkgver/GlowSans${_script^^}-${_width^}-$pkgver.zip)
md5sums=('4611d7e8c933a740da38d83096791b3e')

package() {
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 $srcdir/*.otf
}
