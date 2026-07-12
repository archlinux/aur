# Maintainer: Serhii Starovoitov <drommer.94@gmail.com>

pkgbase=ttf-pt-public-pack
pkgname=('ttf-pt-astra-sans' 'ttf-pt-astra-serif' 'ttf-pt-mono' 'ttf-pt-root_ui' 'ttf-pt-sans' 'ttf-pt-serif')
pkgver=2024.09.02
pkgrel=3
epoch=1
arch=('any')
url='https://www.paratype.com'
license=('custom:OFL')
source=("https://archive.org/download/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('c0926761951f40b35528f261da505fcb70e7cb8fe56476806b312a0644a7faa5')

_srcdir="$pkgbase - $pkgver"
fontdir="usr/share/fonts/paratype"
licdir="usr/share/licenses"

package_ttf-pt-astra-sans() {
  pkgdesc='A sans-serif font designed to be metrically equivalent to Times New Roman'
  provides=('ttf-font' 'ttf-pt-astra-sans')
  conflicts=('ttf-pt-astra-sans' 'ttf-astra-sans')
  install -Dm644 "$_srcdir"/${pkgname#*-}/*.ttf -t $pkgdir/$fontdir/${pkgname#*-}
  install -Dm644 "$_srcdir"/OFL.txt -t $pkgdir/$licdir/$pkgname
}

package_ttf-pt-astra-serif() {
  pkgdesc='A serif font designed to be metrically equivalent to Times New Roman'
  provides=('ttf-font' 'ttf-pt-astra-serif')
  conflicts=('ttf-pt-astra-serif' 'ttf-astra-serif')
  install -Dm644 "$_srcdir"/${pkgname#*-}/*.ttf -t $pkgdir/$fontdir/${pkgname#*-}
  install -Dm644 "$_srcdir"/OFL.txt -t $pkgdir/$licdir/$pkgname
}

package_ttf-pt-mono() {
  pkgdesc='A monospace font for use in forms, tables, worksheets and other scenarios where equal character widths are advantageous'
  provides=('ttf-font' 'ttf-pt-mono')
  conflicts=('ttf-pt-mono' 'ttf-paratype')
  install -Dm644 "$_srcdir"/${pkgname#*-}/*.ttf -t $pkgdir/$fontdir/${pkgname#*-}
  install -Dm644 "$_srcdir"/OFL.txt -t $pkgdir/$licdir/$pkgname
}

package_ttf-pt-root_ui() {
  pkgdesc='A sans-serif typeface designed specifically for user interfaces and web design'
  provides=('ttf-font' 'ttf-pt-root-ui')
  conflicts=('ttf-pt-root-ui')
  _pkgname=${pkgname/_/-}
  install -Dm644 "$_srcdir"/${_pkgname#*-}/*.ttf -t $pkgdir/$fontdir/${_pkgname#*-}
  install -Dm644 "$_srcdir"/OFL.txt -t $pkgdir/$licdir/$pkgname
}

package_ttf-pt-sans() {
  pkgdesc='A humanist sans-serif font inspired by the mid-20th century types suitable for applications and website'
  provides=('ttf-font' 'ttf-pt-sans')
  conflicts=('ttf-pt-sans' 'ttf-paratype')
  install -Dm644 "$_srcdir"/${pkgname#*-}/*.ttf -t $pkgdir/$fontdir/${pkgname#*-}
  install -Dm644 "$_srcdir"/OFL.txt -t $pkgdir/$licdir/$pkgname
}

package_ttf-pt-serif() {
  pkgdesc='A transitional serif typeface with humanistic terminals designed for use together with PT Sans'
  provides=('ttf-font' 'ttf-pt-serif')
  conflicts=('ttf-pt-serif' 'ttf-paratype')
  install -Dm644 "$_srcdir"/${pkgname#*-}/*.ttf -t $pkgdir/$fontdir/${pkgname#*-}
  install -Dm644 "$_srcdir"/OFL.txt -t $pkgdir/$licdir/$pkgname
}
