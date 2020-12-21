# Maintainer: A.I. <merrick@luois.me>

_script=tc
_width=normal
pkgname=glow-sans-${_script}-${_width}
pkgver=v0.92
pkgrel=1
pkgdesc="SHSans-derived CJK font family with a more concise & modern look."
url="https://welai.github.io/glow-sans"
arch=(any)
license=(MIT)
source=(https://github.com/welai/glow-sans/releases/download/$pkgver/GlowSans${_script^^}-${_width^}-$pkgver.zip)
md5sums=('390bd4672ce6c87c60b4184a8f418b23')

package() {
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 $srcdir/*.otf
}
