# Maintainer: A.I. <merrick@luois.me>

pkgname=glow-sans-sc-normal
pkgver=v0.9
pkgrel=1
pkgdesc=""
url="https://welai.github.io/glow-sans"
arch=(any)
license=(MIT)
source=(https://github.com/welai/glow-sans/releases/download/$pkgver/GlowSansSC-Normal-$pkgver.zip)
md5sums=("638aa86bc312c8d115169031b978250b")

package() {
  install -Dt "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 $srcdir/*.otf
}
