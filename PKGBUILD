# Maintainer: Jeremy Attali <contact@jtheoof.me>

pkgname=ttf-menomonia
pkgver=1.0.0
pkgrel=1
pkgdesc='Font family for Menomonia, a font used in Guild Wars 2'
arch=('any')
license=(custom)
url=http://www.chank.com
source=(
  'LICENSE'
  'menomonia-italic.ttf'
  'menomonia.ttf'
)

sha256sums=(
  '06d7d2e499ade0219c5d702ba35838e138caf78dc4fb023328b486d6d79fa64e'
  '14936ee53f7d885f49c1320d801dcf355f7f8ceade946851ef35cb2ed1876838'
  'ae9afb461f48a7f6ff3c7466f3fd127349fac9cb76263236e8afefbb9905dfe1'
)

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname#ttf-}" ${srcdir}/*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
