# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ttf-hananiah
pkgver=2
pkgrel=2
pkgdesc="A Hebrew simulation typeface derived from Ezra SIL"
arch=('any')
url="https://fontlibrary.org/en/font/hananiah"
license=('custom:OFL')
source=("https://fontlibrary.org/assets/downloads/hananiah/5b316c3d0960044bc6c85e964c1de25f/${pkgname#ttf-}.zip")
sha256sums=('c8dd72f032508d7702b9d571efd9c45cc2ccb980f8a0ba8df2ee0c04e9248a12')

package() {
  cd "${pkgname#ttf-}"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF/"

  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 *.pdf "$pkgdir/usr/share/doc/$pkgname/"
}
