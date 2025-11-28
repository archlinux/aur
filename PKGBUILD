# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-astrolabe
pkgver=1.00
pkgrel=1
pkgdesc="Astrolabe is a Kufic typeface"
arch=('any')
url="https://aliftype.com/astrolabe"
license=('OFL-1.1')
source=(https://github.com/aliftype/astrolabe/releases/download/v$pkgver/Astrolabe-$pkgver.zip)
sha256sums=('eb303929c9a614df9f71b05f201e2813e8df1ad0af353cfff7f10f35faba768d')

package() {
  cd "$srcdir/Astrolabe-$pkgver"
  install -Dvm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
