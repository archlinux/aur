# Maintainer: Jonas Malaco <jonas@protocubo.io>
pkgname=ttf-chicagoflf
pkgver=2.1
pkgrel=1
pkgdesc='Public domain typeface inspired by Chicago'
arch=(any)
url='https://fontlibrary.org/en/font/chicagoflf'
license=('custom:Public Domain')
source=("$pkgname-$pkgver.zip::https://fontlibrary.org/assets/downloads/chicagoflf/a2e4a3d14e40fa7076a0a1bc06f3de43/chicagoflf.zip")
sha256sums=('a5c1ff8aeb06505c77e6286fb63b6350494a9b030b688c212322d331d9d2278f')

package() {
    install -Dm0655 -t "$pkgdir/usr/share/fonts/TTF" "chicago/ChicagoFLF.ttf"
    install -Dm0655 -t "$pkgdir/usr/share/doc/$pkgname/" "chicago/ChicagoFLF.pdf"
    install -Dm0655 "chicago/README.ChicagoFLF" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
