# Maintainer: A.I. <merrick@luois.me>

_script=sc
_width=wide
pkgname=glow-sans-${_script}-${_width}
pkgver=v0.91
pkgrel=1
pkgdesc="SHSans-derived CJK font family with a more concise & modern look."
url="https://welai.github.io/glow-sans"
arch=(any)
license=(MIT)
source=(https://github.com/welai/glow-sans/releases/download/$pkgver/GlowSans${_script^^}-${_width^}-$pkgver.zip)
md5sums=('1336005921b4026bab8ebb74cb5fad60')

package() {
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 $srcdir/*.otf
}
